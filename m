Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AD9519E89
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 May 2019 15:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727690AbfEJNzc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 May 2019 09:55:32 -0400
Received: from mail-eopbgr1400115.outbound.protection.outlook.com ([40.107.140.115]:45031
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727249AbfEJNzc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 May 2019 09:55:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MREFxAt6Tz6IO7UTdiHS1dtTfAKPnjg5XaQbQDS4v00=;
 b=TTNitd0w03Y83Y1U6L7BO4IhYdkP3KZZ/QdUBKSLyqotorTlC3JTCv4rEOd+0GldA8Ur1/6upaC+cPohPHmNI8joBRLPtYewHAKNpqa0svQRb3LW6K1ll/ZvdqArUlm+GBm4nXlV7t3AHyQilQIXLmh0R1ywlX6TmMLn81EfZDY=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.163.12) by
 TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Fri, 10 May 2019 13:55:26 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0%5]) with mapi id 15.20.1878.022; Fri, 10 May 2019
 13:55:26 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 05/15] phy: renesas: rcar-gen3-usb2: Check dr_mode when
 not using OTG
Thread-Topic: [PATCH v2 05/15] phy: renesas: rcar-gen3-usb2: Check dr_mode
 when not using OTG
Thread-Index: AQHVBqOe6pcDFSgi+kib0k09CW4w2aZkCZeAgABXf8A=
Date:   Fri, 10 May 2019 13:55:25 +0000
Message-ID: <TY1PR01MB15628A94DA371A7636984A708A0C0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190509201142.10543-1-chris.brandt@renesas.com>
 <20190509201142.10543-6-chris.brandt@renesas.com>
 <e987df36-eca6-f05f-d1bf-7dc43fc9d4b4@cogentembedded.com>
In-Reply-To: <e987df36-eca6-f05f-d1bf-7dc43fc9d4b4@cogentembedded.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3bc719eb-123e-4b91-7d66-08d6d54f2795
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1770;
x-ms-traffictypediagnostic: TY1PR01MB1770:
x-microsoft-antispam-prvs: <TY1PR01MB1770BBF09ECA7C7C350602948A0C0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:364;
x-forefront-prvs: 0033AAD26D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(396003)(39860400002)(346002)(136003)(376002)(189003)(199004)(86362001)(74316002)(52536014)(76116006)(2906002)(76176011)(66946007)(8936002)(66556008)(73956011)(66476007)(66446008)(5660300002)(99286004)(64756008)(71200400001)(71190400001)(14444005)(256004)(305945005)(6636002)(9686003)(7736002)(68736007)(53936002)(6246003)(446003)(11346002)(476003)(33656002)(486006)(229853002)(26005)(8676002)(6116002)(6506007)(186003)(81156014)(81166006)(14454004)(102836004)(4326008)(66066001)(3846002)(7696005)(316002)(54906003)(478600001)(110136005)(6436002)(55016002)(72206003)(25786009);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1770;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: n7ejWDtSPnQaz+wLThSHNwCG9OPOD3XC2b4sxI8G8xR17T4V8u4aDAe4rGjXZpLMsMNEf2KLeFSmudGd5U7Vc8Lm+hyujQy/VYup6QPDVbpr0oiqC3Wnx/ilXsToK/Rv3C7iB4fezwcvuNcfGHzZu62BCIWwnzaeHP0nQOFak31Qsfb++j01ELXLYtAVb/S0IWn8uh2CR+nfnwS5DRJXhc9dwK/mhSHqaxT/hEKsyWXKlLy+hVcyjOTwpM5fGe2xtnx09saFts95Gw0kt8N9TNJLDu9jUx6ByARgpr9I6vOeH2By1tmA6nnGgwTpqN2lZcX6uVl3CUxTQUhwY6SFX+NdUSQkDdeSE9srT9jfHERek7GiqrdYMuOmIfMbEs31LAp/F8XLVjQ6E2Mpb8oP7HWiIS9q61tw8/kYxw2LwUo=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bc719eb-123e-4b91-7d66-08d6d54f2795
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2019 13:55:26.0203
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1770
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

T24gRnJpLCBNYXkgMTAsIDIwMTksIFNlcmdlaSBTaHR5bHlvdiB3cm90ZToNCj4gPiArCX0gZWxz
ZSB7DQo+ID4gKwkJLyogTm90IE9URywgc28gZHJfbW9kZSBzaG91bGQgYmUgc2V0IGluIFBIWSBu
b2RlICovDQo+ID4gKwkJbW9kZSA9IHVzYl9nZXRfZHJfbW9kZShjaGFubmVsLT5kZXYpOw0KPiA+
ICsJCWlmIChtb2RlID09IFVTQl9EUl9NT0RFX0hPU1QpDQo+ID4gKwkJCXdyaXRlbCgweDAwMDAw
MDAwLCB1c2IyX2Jhc2UgKyBVU0IyX0NPTU1DVFJMKTsNCj4gPiArCQllbHNlIGlmIChtb2RlID09
IFVTQl9EUl9NT0RFX1BFUklQSEVSQUwpDQo+ID4gKwkJCXdyaXRlbCgweDgwMDAwMDAwLCB1c2Iy
X2Jhc2UgKyBVU0IyX0NPTU1DVFJMKTsNCj4gDQo+ICAgICBNYXliZSBhICpzd2l0Y2gqIGluc3Rl
YWQ/DQoNCkkgbGlrZSB0aGF0IGlkZWEgYmVjYXVzZSBJIGNhbiBnZXQgcmlkIG9mIHRoZSBkcl9t
b2RlIHZhcmlhYmxlLg0KDQpIb3dldmVyLi4uDQpJIGp1c3QgdHJpZWQgaXQsIGJ1dCBpZiBJIG9u
bHkgaGF2ZSBhIGNhc2UgZm9yIEhPU1QgYW5kIFBFUklQSEVSQUwsIEkgDQpnZXQgdGhpcyBnY2Mg
d2FybmluZzoNCg0KICB3YXJuaW5nOiBlbnVtZXJhdGlvbiB2YWx1ZSDigJhVU0JfRFJfTU9ERV9V
TktOT1dO4oCZIG5vdCBoYW5kbGVkIGluIHN3aXRjaCBbLVdzd2l0Y2hdDQogIHdhcm5pbmc6IGVu
dW1lcmF0aW9uIHZhbHVlIOKAmFVTQl9EUl9NT0RFX09UR+KAmSBub3QgaGFuZGxlZCBpbiBzd2l0
Y2ggWy1Xc3dpdGNoXQ0KDQoNClNvLCBteSBjb2RlIHdvdWxkIGhhdmUgdG8gYmU6DQoNCgl9IGVs
c2Ugew0KCQkvKiBOb3QgT1RHLCBzbyBkcl9tb2RlIHNob3VsZCBiZSBzZXQgaW4gUEhZIG5vZGUg
Ki8NCgkJc3dpdGNoICh1c2JfZ2V0X2RyX21vZGUoY2hhbm5lbC0+ZGV2KSkgew0KCQljYXNlIFVT
Ql9EUl9NT0RFX0hPU1Q6DQoJCQl3cml0ZWwoMHgwMDAwMDAwMCwgdXNiMl9iYXNlICsgVVNCMl9D
T01NQ1RSTCk7DQoJCQlicmVhazsNCgkJY2FzZSBVU0JfRFJfTU9ERV9QRVJJUEhFUkFMOg0KCQkJ
d3JpdGVsKDB4ODAwMDAwMDAsIHVzYjJfYmFzZSArIFVTQjJfQ09NTUNUUkwpOw0KCQkJYnJlYWs7
DQoJCWNhc2UgVVNCX0RSX01PREVfVU5LTk9XTjoNCgkJY2FzZSBVU0JfRFJfTU9ERV9PVEc6DQoJ
CQlicmVhazsNCgkJfQ0KCX0NCg0KSSBndWVzcyB0aGF0IGlzIHN0aWxsIE9LLg0KDQpDaHJpcw0K
DQo=
