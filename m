Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A986616290
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2019 13:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbfEGLFn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 May 2019 07:05:43 -0400
Received: from mail-eopbgr1410122.outbound.protection.outlook.com ([40.107.141.122]:26592
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726280AbfEGLFn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 May 2019 07:05:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d4w1JciM/vXlpVU/BEx6jXIP+YR5qxRQfUBODk9/API=;
 b=lCw7W9A10GIeP0XYs2Owe0Qx3gBrOJs7JNKv07XQzBBYpSbHZiSoy5tVwd3bLlXQRC+k2iqBrKGMFbtLXsNbGYLEe6KG45LULJDMIBKJhrgq+BFdVVOcJt3G03E4aAOZXFg+n2CCCVHGG3SI/8ZvI3QSTwCzmMBZSl7AphJtIN8=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.163.12) by
 TY1PR01MB1499.jpnprd01.prod.outlook.com (52.133.161.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Tue, 7 May 2019 11:05:38 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0%5]) with mapi id 15.20.1856.012; Tue, 7 May 2019
 11:05:38 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 09/10] ARM: dts: r7s9210: Add USB Device support
Thread-Topic: [PATCH 09/10] ARM: dts: r7s9210: Add USB Device support
Thread-Index: AQHVBGY7HeLCsOXtzUGu0g3yTltSAaZfWVAAgAAm7FA=
Date:   Tue, 7 May 2019 11:05:38 +0000
Message-ID: <TY1PR01MB1562E0C04902FFF938AA123A8A310@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190506234631.113226-1-chris.brandt@renesas.com>
 <20190506234631.113226-10-chris.brandt@renesas.com>
 <8182b7b7-c447-b0ba-2654-ac71f9c86dbb@cogentembedded.com>
In-Reply-To: <8182b7b7-c447-b0ba-2654-ac71f9c86dbb@cogentembedded.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 831dc0f8-5b41-4dda-56e8-08d6d2dbf011
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1499;
x-ms-traffictypediagnostic: TY1PR01MB1499:
x-microsoft-antispam-prvs: <TY1PR01MB1499169B01BC7D69A2CAC6A88A310@TY1PR01MB1499.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 0030839EEE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(366004)(39860400002)(136003)(346002)(376002)(199004)(189003)(6506007)(7696005)(102836004)(76176011)(71200400001)(71190400001)(446003)(26005)(186003)(4326008)(6246003)(55016002)(53936002)(99286004)(11346002)(476003)(486006)(6436002)(86362001)(66946007)(66556008)(3846002)(66476007)(110136005)(64756008)(66446008)(73956011)(52536014)(2906002)(316002)(256004)(6116002)(33656002)(54906003)(76116006)(25786009)(558084003)(9686003)(8936002)(229853002)(8676002)(81156014)(5660300002)(81166006)(72206003)(6636002)(14454004)(478600001)(7736002)(66066001)(68736007)(74316002)(305945005);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1499;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qRMKEUIlqNxoGyKsWxpdwgxlqaKigsbX3tkvOC+figjnOvcJtQuOAgEpLYvtEaYZ772pV6VZ7bMSm0oy3wmpr4xiZbuNYZu4K6l5NzOz05oSMbn353ukkq4Q7G4W3/bl1k8x+STCgSG4HMmuo2UVkEIhHmzCTpN24fz7xXGvohyPYaK48ThFZ2hjfkrWAA/9ZPIJc8lK75pGOwz8+wXfO92Vgj4QmWFfkmiJp1OvXY3YcCLfI63NORmyr+pmO79KqeV8RUZ2X8wTeK0U/dd+eOgFdOTwteJUMCrY0HMwnu7gLhhKYhhAWFZXEsv2T346/MtmVMadc+pilCT4oAY22jZx2fHAKyqJtKOBlak5JIgQ1kepvUd9sWl2hTCBBo8GVzYzxPBldCEYRNV2RPIE2x46tUw1wCmxomRm8ji74o0=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 831dc0f8-5b41-4dda-56e8-08d6d2dbf011
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2019 11:05:38.5241
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1499
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

T24gVHVlLCBNYXkgMDcsIDIwMTksIFNlcmdlaSBTaHR5bHlvdiB3cm90ZToNCj4gPiArCQl1c2Jo
czA6IHVzYmhzQGU4MjE5MDAwIHsNCj4gDQo+ICAgIFRoZSBub2RlIG5hbWVzIHNob3VsZCBiZSBn
ZW5lcmljLCBpLmUuICJ1c2JAZTgyMTkwMDAiLg0KPiANCg0KR29vZCBwb2ludC4NCg0KQWx0aG91
Z2ggaXQgc2VlbXMgbGlrZSB1c2ItcGh5IGlzIHN0aWxsIGNvcnJlY3QuDQoNClRoYW5rcywNCkNo
cmlzDQo=
