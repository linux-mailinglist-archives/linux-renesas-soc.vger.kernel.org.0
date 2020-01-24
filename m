Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BAAC14777B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2020 05:16:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729893AbgAXEQR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Jan 2020 23:16:17 -0500
Received: from mail-eopbgr1400124.outbound.protection.outlook.com ([40.107.140.124]:52496
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729797AbgAXEQR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Jan 2020 23:16:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kvbr3wRLeMF3yVLqmVWaTj6GAMMPWjBqNq0GcruGdOfQ7LQH9SiVzk8Ybvc5F34/ShDdzo/F+kIL7yL96oEAjkuF3hwT/RcHPmmNWdGrmPV6f5zn21Cd3gImij09J3LzOC3kqVyJoJV5H+kquqzW5X4kkHrs8v/gK1usjoKT53njClBTTVkVytERWvvUu0paknznwR8dvBhJmxC9dQ+EsIhI4rS9WknXLOfAZHPO7y36MwV5W5tRnYGnUzpZwDQFc4fn6n7G8FVtDmb+zh1arTowavXD23HxWVLMktPGH1H2jx26SU6eYnCFzWqOs/YbYhMzSgOyDQFdQ4GuudoSWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvK07KFFRTkQs0026KPEl11d4SYriDp3BaFLk1uF548=;
 b=TOG/WQW8kNtxUB+vcnh6dpU57lRX+GzIQ8R2amgyVh9nOUJUN9lDvnJx7gOKjFqNeT0+rj2PffOOX+MjhWXK6/YBW601F9O2Obb6Cp9LHIXKV+uFz6RCFHbbU50UriojrHaYJ8l73EntXScNgX5WPH+AVVa04WP4rojAWEdxMONDBfMpHuFiC8QKF9hE3lj2oCjnXCCkGhd7TCg/ii9HLQMg6/IhGqVLcau/1XAkLfFaJ7zlNd8rudAPHxpNzkR3m4oEC4O+pM34hN/Nau5X8sV/16H1VCy2KGC01tHEkLJYKlt19ckZsoUwC2E3m/W1OKJv71cM0JUCIM8i1XfQKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvK07KFFRTkQs0026KPEl11d4SYriDp3BaFLk1uF548=;
 b=pqFzSkjpLNaPvIxEqsKfI4JpRW/0cqFBPtojFF7XTaO+AvBN+6vC2Ghoxah1/YXnfxihs7BruI/kWD43YZalGfkRJlMaAS/3kTVIEmFPFLGJc2CFQvqCTS18ZCXkg87OFP6kZIVmuAVMfS8kTNvKdPGrPz2yxb77sqLIK9aXmgE=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB2606.jpnprd01.prod.outlook.com (20.177.104.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.19; Fri, 24 Jan 2020 04:16:14 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::318b:31aa:4212:bd49]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::318b:31aa:4212:bd49%7]) with mapi id 15.20.2665.017; Fri, 24 Jan 2020
 04:16:14 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Greg KH <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Tony Prisk <linux@prisktech.co.nz>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        USB list <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] usb: host: ehci-platform: add a quirk to avoid stuck
Thread-Topic: [PATCH v2] usb: host: ehci-platform: add a quirk to avoid stuck
Thread-Index: AQHV0eWnau2SnovLYkCRv0gNW3Qw46f4P9eAgAD0h0CAAAFJcA==
Date:   Fri, 24 Jan 2020 04:16:14 +0000
Message-ID: <TYAPR01MB454494F6246E2575F8531AA6D80E0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1579781234-2084-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXqVFOO=D6AgzBmfW3SPYfGa-sBdZ4a+4nJZD5tFNDcWA@mail.gmail.com>
 <TYAPR01MB45443172A8C024BAA509F682D80E0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
In-Reply-To: <TYAPR01MB45443172A8C024BAA509F682D80E0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b1334db1-974b-41e2-b086-08d7a08426e5
x-ms-traffictypediagnostic: TYAPR01MB2606:
x-microsoft-antispam-prvs: <TYAPR01MB26066246F87BE7AF49E7B2E1D80E0@TYAPR01MB2606.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 02929ECF07
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(346002)(396003)(366004)(39860400002)(136003)(199004)(189003)(76116006)(66946007)(9686003)(2906002)(4326008)(55016002)(66446008)(52536014)(66476007)(5660300002)(64756008)(4744005)(66556008)(86362001)(33656002)(8676002)(2940100002)(8936002)(81166006)(26005)(186003)(6916009)(7696005)(6506007)(81156014)(54906003)(316002)(71200400001)(478600001);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB2606;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qisf/MR0BYUuxoXn+4JfIX6Unz9yx4Khkptw2dZ8vjvoulxp7lBFT1xEU3dPQLEO0Sjp7+l/fJrrLoDrTfilinJddk1UKYCVvj7abhUVM/R85jhfBRr7JJsMRrL96CWyqTpdvVHSdvUOSLxQqm6zUSXz3erXXdTB8e6hv9atP4FXb36r4pDPCWVyVoOhsmzfqAenvuWjLp1oeBsw5dVsc0zLJNs1qTOb/ASUO7Ghz2VcMTEkf61RiLz13l8X+lomToZLEE6RX3qyBx2simrdycZuABUrvOUOOeTNrJSLlThz9zGCG54cr2nNjGau/7jNBOtdj1oxVyk6hQzc5J/zEJJjZqg9ZP6G7qaG92jPLaGjPxg1LKiYbrhjRCXGYLdhmzpx41Hql7Cytck0rnhnRyZ7KId6wAlUfWGFYNTDayGGH9kNyngEHxAFIf+CB2CR
x-ms-exchange-antispam-messagedata: UHjnfByt5IDcwMl0AALvEy09zb8YqN7b3brc402knVgPegIiaNRUXpnnDwEgWt7HXprQs7iymQsES8z94AHOyd8DGAmA2HK8vLC/USC27Blp2wsUYlYQX06NkLM5O6JvcIpnQKjwkGnuum1rDC/DGw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1334db1-974b-41e2-b086-08d7a08426e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2020 04:16:14.3889
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ovkPDBUejMhpF3M2Z7NbT8oByE1S1m6vJKdQMSXdjie7LFg8UvZXJZ9xq8YsDPBqpUnD7V6MiVve/PWzbDhq1+qBJ9Npcd698sU+r/+pyej6ryUabqRsjB0gqAy9p3vm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2606
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuIGFnYWluLA0KDQo+IEZyb206IFlvc2hpaGlybyBTaGltb2RhLCBTZW50OiBG
cmlkYXksIEphbnVhcnkgMjQsIDIwMjAgMToxMyBQTQ0KPHNuaXA+DQo+ID4gSSBndWVzcyB0aGlz
IGFmZmVjdHMgUlovRzIsIHRvbz8gLmZhbWlseSA9ICJSWi9HMiIuDQo+IA0KPiBJIHRoaW5rIHNv
LiBTbywgSSdsbCBhZGQgIlJaL0cyIiBvbiB2MyBwYXRjaC4NCg0KU29ycnksIEknbSBhc2tpbmcg
aGFyZHdhcmUgdGVhbSB3aGV0aGVyICJSWi9HMiIgZmFtaWx5IHNob3VsZCBiZSBhZmZlY3RlZCBv
ciBub3QuDQpTbywgSSdkIGxpa2UgdG8gYWRkIHRoaXMgYXMgaW5jcmVtZW50YWwgcGF0Y2ggaWYg
bmVlZGVkLg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo=
