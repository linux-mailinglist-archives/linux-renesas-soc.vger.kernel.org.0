Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B0D51A7C6
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 May 2019 14:05:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728526AbfEKMFo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 May 2019 08:05:44 -0400
Received: from mail-eopbgr1400119.outbound.protection.outlook.com ([40.107.140.119]:35493
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725861AbfEKMFo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 May 2019 08:05:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCBbvpQUcD69vuX98q9yRmFQDson6LPl4W6+Vgj6zfc=;
 b=XppD+0UfsT9P1oL18lsfEO0XnjEiCMJZSCxS7vu9AKWgORDiWuntLRrPZwywcX8UkFAu7TqaNLj+AOwlE1gYsx96HLa0StmLjbq+N+LyjS9NB9eYtQL/RldcBt6kUqa0Sqb1S6SiHKCxDN2omeaQpgZkQwy1iRUheeg9neteVE0=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.163.12) by
 TY1PR01MB1802.jpnprd01.prod.outlook.com (52.133.164.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Sat, 11 May 2019 12:05:35 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0%5]) with mapi id 15.20.1878.022; Sat, 11 May 2019
 12:05:35 +0000
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
Thread-Index: AQHVBqOe6pcDFSgi+kib0k09CW4w2aZkCZeAgABXf8CAASsEAIAASbRA
Date:   Sat, 11 May 2019 12:05:35 +0000
Message-ID: <TY1PR01MB156253600A81FD44964B56658A0D0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190509201142.10543-1-chris.brandt@renesas.com>
 <20190509201142.10543-6-chris.brandt@renesas.com>
 <e987df36-eca6-f05f-d1bf-7dc43fc9d4b4@cogentembedded.com>
 <TY1PR01MB15628A94DA371A7636984A708A0C0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <711839c7-930f-938e-4626-8a7524f5b82e@cogentembedded.com>
In-Reply-To: <711839c7-930f-938e-4626-8a7524f5b82e@cogentembedded.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e26c54a-877a-41ac-ab22-08d6d608f9b8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1802;
x-ms-traffictypediagnostic: TY1PR01MB1802:
x-microsoft-antispam-prvs: <TY1PR01MB180284D196022A7249E26FA48A0D0@TY1PR01MB1802.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 00342DD5BC
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(136003)(346002)(39850400004)(366004)(376002)(199004)(189003)(476003)(7696005)(5660300002)(66446008)(81166006)(76176011)(8936002)(86362001)(4326008)(66066001)(81156014)(6636002)(64756008)(66556008)(25786009)(6246003)(316002)(486006)(305945005)(256004)(8676002)(186003)(7736002)(71190400001)(99286004)(229853002)(71200400001)(53936002)(26005)(54906003)(6436002)(2906002)(3846002)(6116002)(68736007)(478600001)(52536014)(102836004)(74316002)(72206003)(66946007)(558084003)(110136005)(66476007)(55016002)(76116006)(14454004)(73956011)(446003)(11346002)(6506007)(33656002)(9686003);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1802;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /EMR5YXRXskiblYmCLSiZ6Kv3bRJRpX/wuEGfb/F+71V3nkvkn/jrFTH1MgXAfDA7s+c5Q+8RywH+A5TC7ntNzPaPAlyzJeQZucDzb0AOaNvTCNJfLcia3dKAuYhQx9SWzsypHL3S43Sc+HfwDc1Nbhwojb8EePlNE0oqLhmMJe4CZXDR7B8XIrqfrvUAcns7BpSY/IiHw9alBdjqrMjyhqadgnHmwSxszkKlfeHRr87wtNN5HQqbPWU9n03kGwXUrLQ00B7q7nFv+OZiWPe2t2+n1P4EIpSMHyi1on3uc9dSgqzwA8ALIQcRYJqQ90a10r/6EqqJDn8k3vdU8JDLOEY86GCtEt66a+1v2BZWqIZz3lHxDhaMhEauL4bBVSB47HPo/IHyHQ7iYsnu61zEPIBqnjWAQr4VoC4jEUDqio=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e26c54a-877a-41ac-ab22-08d6d608f9b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2019 12:05:35.5454
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1802
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

T24gU2F0LCBNYXkgMTEsIDIwMTksIFNlcmdlaSBTaHR5bHlvdiB3cm90ZToNCj4gPiAJCWNhc2Ug
VVNCX0RSX01PREVfVU5LTk9XTjoNCj4gPiAJCWNhc2UgVVNCX0RSX01PREVfT1RHOg0KPiANCj4g
ICAgIE1heWJlIGRlZmF1bHQ6IGluc3RlYWQ/DQoNClllcywgdXNpbmcgZGVmYXVsdCBpbnN0ZWFk
IHdvcmtzLg0KDQpUaGFuayB5b3UhDQoNCkNocmlzDQo=
