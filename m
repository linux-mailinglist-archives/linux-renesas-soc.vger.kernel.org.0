Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7289A157377
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2020 12:31:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727422AbgBJLbE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Feb 2020 06:31:04 -0500
Received: from mail-eopbgr1400138.outbound.protection.outlook.com ([40.107.140.138]:34715
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726796AbgBJLbE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Feb 2020 06:31:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZdREvM/sZT8/lxmrWJrGibiPt4D9n31EbQFABu80E2AoCVghDm0SzSlpICZfHyj3ei2oFwvMTtiaLu3QGsfvtfkgrEH5T4la4yWh8CKYseXH6kw80pGYQDxVa/U8kHRfJLZi8yhnjLvZOv327lWGtIZCTMXFmIJbirgisqYuxIhVWTzoq/5DJV0iadLlr3W/eQZTLKS0hTEsYWbiOfbV9Unr0Tsjzim8WF02iuXiUOR9QCDo8T2XRGuRffIyqcU3x4FaN1Z/9wa8P73yGM7A56HCGSVmELB2FndiC0n/YzqeTO3KszdIldi/ylBn+rtUYMfH8+561rL/dP5n7mWyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUbVSEzUGj+Dac+fCZTB1uTFN0J7IC/+NfNwk4ecQ8E=;
 b=atcsCOr1wZJvYbXH8VXhAUBNw2l3cBuBC2FDVeDuV/ZFrkX+QbCfjQu6K6v9CUBxIDbWkN6T0ck87CC+WTvZmbD7mOzlf9pnoSG6a7r+FyOirV+1Vt27/DezDoQgyGU+VLokMfJdbVQqc4jGDblet9SaO2yc+oKkKPb1lA+VFmn4xt0SP9zesRu4djJie8fi9s2BQLkBIkcWxjIb9e/OY8VYtbql8KSzcwyl31eyLx/7VZGoOMWoVVftRb3VJ5jD1n6LjhcEDnVIq/GWcBwjtMcPTETpg1ORFFrMJ0v0VQRlsK+AUwCf99aV1p64hcBBdx5UGfaLobZV5Pmy0NMzdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUbVSEzUGj+Dac+fCZTB1uTFN0J7IC/+NfNwk4ecQ8E=;
 b=VKWjTPso+YIbnCOjhpM/RtQk5QM/OL8EhrCsZkVRuTIRee/7EbKOA8HhBkUu/bmIX5trLYHEZ1EjuzwF75X0YdcPox1DdipYq32ejUe3dClR6gKIO1vBp0c51G/+oo//g5eQbJBEwc2h7pMDTLugNMMpMVsWOQMmd5oKpPT8AEM=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.163.12) by
 TY1PR01MB1609.jpnprd01.prod.outlook.com (52.133.163.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Mon, 10 Feb 2020 11:31:00 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::8870:97e4:a63c:67ea]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::8870:97e4:a63c:67ea%7]) with mapi id 15.20.2707.028; Mon, 10 Feb 2020
 11:31:00 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] ARM: dts: r7s72100: Add SPIBSC clocks
Thread-Topic: [PATCH] ARM: dts: r7s72100: Add SPIBSC clocks
Thread-Index: AQHV3dN9T9Vt0u1WzECd32yImKJz2agUGE0AgAA2ZKA=
Date:   Mon, 10 Feb 2020 11:31:00 +0000
Message-ID: <TY1PR01MB1562D7E98F1200B868A91F928A190@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20200207162704.18914-1-chris.brandt@renesas.com>
 <CAMuHMdXdgcs0pgmeVR+DW_oxsUcR159i-=ZL+LLoqpQoAvq6fA@mail.gmail.com>
In-Reply-To: <CAMuHMdXdgcs0pgmeVR+DW_oxsUcR159i-=ZL+LLoqpQoAvq6fA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcY2JyYW5kdDAxXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctY2ZmZDdjOTYtNGJmOC0xMWVhLWFhNWItOTRlNmY3Njc5M2FlXGFtZS10ZXN0XGNmZmQ3Yzk4LTRiZjgtMTFlYS1hYTViLTk0ZTZmNzY3OTNhZWJvZHkudHh0IiBzej0iNTEwIiB0PSIxMzIyNTgwNzg2MTIzNTM3MzgiIGg9IjhkMEJHeWg4bWttVXlseWZObk8ra2RRU2syRT0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7861042a-e960-4963-7f5e-08d7ae1cb4a6
x-ms-traffictypediagnostic: TY1PR01MB1609:
x-microsoft-antispam-prvs: <TY1PR01MB16098A99913F68AFE426DA9C8A190@TY1PR01MB1609.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 03094A4065
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(189003)(199004)(8676002)(316002)(186003)(26005)(4326008)(8936002)(55016002)(9686003)(81166006)(81156014)(54906003)(6506007)(76116006)(478600001)(7696005)(86362001)(2906002)(71200400001)(52536014)(66476007)(66556008)(64756008)(66946007)(66446008)(5660300002)(4744005)(6916009)(33656002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1609;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yDfRFcvipQLRsSmKoPVk7dXlJiV0nXozNxtNTL9AO1qKFMyrbnzsmtA5vSKY+AVcxFoTL575WBZwm/pPjlu7oGiTjBzX/Oqj5H9a83ZVX+N91bBa8lHXdME7qGyTZFy4fR9UOp2v4BOKB5HZZMfQVNigK9AHG3GrUKLqnxqo+EAKD5lq0aBxpkd7hvIXaxZ6FEtrQWVedJZjVf3B7Hk6C9B9huwclv8M6ctsjCC4f1mHxDy0VAW1hYy+aUH5P8tSqpZKA+U55T28LydOHkmt59Vst0D1eD31NbwDalDm9RcdsQDUicVbfOrjaEBcArJLrKSUPPp48VfjAN4ByHWhNWGeVJbi+lSKuGb2BTEQlWXbFE12ecViHA8ZOaRoLUu5CwfevMpqmEpcdUIae1uWnIGcSxD8M9rZdZO6QjAyuKFTrhJsed7CSAelhXLQ2s3o
x-ms-exchange-antispam-messagedata: Cu55gHSCf8UAMLWzVra+s3kRVp3+283LU4QmfkHkaWzeT7GDU4LlWrGc/3D2kXFwBeKhiBvZxCqhVCVCaeFoTOCQZHiaIba3RiOeQ8mdtc+1InsqE/ub+kQZrATJcTQzy9v0oVTBAMQUZU7A3N6tsw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7861042a-e960-4963-7f5e-08d7ae1cb4a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2020 11:31:00.7473
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cli0qaAemJIlfQpYowQL5F4C8ipRBqvzinG0vbkZep8iP+nFQGNroSbrBR1cRM9u7LyoZC/TCfJYGlUYbdkbfK1dS5uFN47kFqPLHgK1Wcc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1609
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCk9uIE1vbiwgRmViIDEwLCAyMDIwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3Jv
dGU6DQo+IEhvd2V2ZXIsIEkgYmVsaWV2ZSBJIGNhbm5vdCBxdWV1ZSB0aGlzIGluIHJlbmVzYXMt
ZGV2ZWwgeWV0LCBhcyB0byBhdm9pZA0KPiBhIHJlZ3Jlc3Npb24sIHRoZSBmbGFzaCBub2RlIGlu
IHI3czcyMTAwLWdyLXBlYWNoLmR0cyBzaG91bGQgZ2Fpbg0KPiBhcHByb3ByaWF0ZSBjbG9jayBh
bmQgcG93ZXItZG9tYWlucyBwcm9wZXJ0aWVzLg0KPiBBbmQgdG8gYXZvaWQgYmlzZWN0aW9uIGlz
c3VlcywgdGhhdCBzaG91bGQgYmUgY29tYmluZWQgd2l0aCB0aGlzIHBhdGNoLA0KPiByaWdodD8N
Cg0KQXJlIHlvdSBzYXlpbmcgYSBwYXRjaCBzZXJpZXM/IE9yIDEgcGF0Y2ggdGhhdCBlZGl0cyBi
b3RoIGZpbGVzPw0KDQpUaGFua3MsDQpDaHJpcw0KDQo=
