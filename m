Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C97E155B1E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2020 16:51:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727012AbgBGPvf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Feb 2020 10:51:35 -0500
Received: from mail-eopbgr1410111.outbound.protection.outlook.com ([40.107.141.111]:6115
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726982AbgBGPvf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Feb 2020 10:51:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ImnLSOlNkowlU9dyR2Aah4HZaXqmqxXGeoIsxUay3krkICgoVx1vyE70SCpTx8nnyvVB54P9EJKhZZbbFOa+Kepw5VtntekjTNO43G7ULOwW5HGcmLuak2n2bArAfgyrLB7xMa/dbF7LbIUdPFa83H7YuVDTQSQw89jL5qJNcIg6Ez50h73eg9Hug4t5QNKwiXbbU4gXpO4HG3Y6hYhmhqK/lFo3hqmQ7NZ1IQWirFxCiib1DR9V/kvI4f4Xs0G3508LGlK4/ydjhEX33SlyHGdDYM3DJ8q8+qk5SwKOzGdZRPw/b7fFqBaSdjTxOp1zB9pjLN02rllI4JVLP+HomA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ntPt0TofFnPNsTiRgRwEwDi7mfMciNQ/zLlhCTZR8xM=;
 b=BBjFXdCjjeYh4uU51TyOssDDhq2e8MxycCqu8pE1u2MdfG0NUSRzpZ+34CbQHYvQBSCfppCsA4SlcacWAa/ANA4hX4VKhNX4t5TG42zKEI+yQHxkjhe0jFMR5jBJN0dlU8FhkVLpm7JQtWkCplzcqndV9dKQz8QpHAdEYqVUdlJxOqZiMqr0ImBfdgnP9bxBIgqXmIrwN8IonS3EK1PrykMqIMpfYdUr8XE1bpnBFKJYL9dz5fCo/rZT9EG/RNx6n8zOGctq7+nFJjCtACTzlMgciIHYD8dQo002xu47hVY+kQ9+X7SH1aUzhKvIsdTM1s17YK9ipbP6bUaVIFVZ2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ntPt0TofFnPNsTiRgRwEwDi7mfMciNQ/zLlhCTZR8xM=;
 b=Z6zvoik/6fzt6Zde4biYIpr1zT3kDDYR2enDuh9TOpTPeTrovLVAGhI0ULvqv0r3AwbF9dDPUHJ9SeqVSBJK8MO4V+OPzegJOGTPh5stlwEmYlLinJwyTRjitNtA6tH+9gj3YCfpT6XImx56G7jcr4xaVlaoV/sbcS/NK3GMjAw=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.163.12) by
 TY1PR01MB1484.jpnprd01.prod.outlook.com (52.133.162.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Fri, 7 Feb 2020 15:51:32 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::8870:97e4:a63c:67ea]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::8870:97e4:a63c:67ea%7]) with mapi id 15.20.2707.020; Fri, 7 Feb 2020
 15:51:32 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "David S. Miller" <davem@davemloft.net>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH RFT 0/5] sh_eth: get rid of the dedicated regiseter
 mapping for RZ/A1 (R7S72100)
Thread-Topic: [PATCH RFT 0/5] sh_eth: get rid of the dedicated regiseter
 mapping for RZ/A1 (R7S72100)
Thread-Index: AQHV2sjuY/y4+IGNNU209XmT/+6jSqgP30LAgAAHOvA=
Date:   Fri, 7 Feb 2020 15:51:31 +0000
Message-ID: <TY1PR01MB156298E4D2741ED7A64C81F58A1C0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <c643125b-5280-cd62-afc1-63b8a06501c1@cogentembedded.com>
 <TY1PR01MB1562CFDEE9179DC7578A99CD8A1C0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1562CFDEE9179DC7578A99CD8A1C0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcY2JyYW5kdDAxXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctYjQ5YzUyZWItNDljMS0xMWVhLWFhNWItOTRlNmY3Njc5M2FlXGFtZS10ZXN0XGI0OWM1MmVkLTQ5YzEtMTFlYS1hYTViLTk0ZTZmNzY3OTNhZWJvZHkudHh0IiBzej0iNTA5IiB0PSIxMzIyNTU2NDI5MDY1NTQyNDMiIGg9IlpXRWtyZ0hIN3M4VnhnZ20zTnlZYlJxSmNuaz0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a5088367-d368-438f-410b-08d7abe59a59
x-ms-traffictypediagnostic: TY1PR01MB1484:
x-microsoft-antispam-prvs: <TY1PR01MB1484C71B32B976FDF83554F48A1C0@TY1PR01MB1484.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0306EE2ED4
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(366004)(136003)(396003)(39860400002)(376002)(189003)(199004)(6506007)(4744005)(26005)(186003)(86362001)(71200400001)(81166006)(81156014)(8676002)(7696005)(316002)(33656002)(2906002)(110136005)(64756008)(2940100002)(478600001)(8936002)(55016002)(52536014)(5660300002)(66946007)(76116006)(9686003)(66446008)(66556008)(66476007)(26583001);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1484;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EP6BJL4VVt+KflZ5Zc8CZQM/hJvXoMxMnCKYjkAlDUHDpA6d3kMtzq+2QF/NbDc02M3F4WqjDWESOaS1aFU5HNj5wpXF35+FpzQWZKrOmAoX83lkeQtFx3uVClPQWtjsqnUD0QONcgdl2VKjZVY+jCXS3BVGavzH3W/mKRVT5Mo1A7jmYWT1bu7oo7/sEpCK5UtvZlLSX9Ef4VJ839V95Q1tR0UtGDK+8vvLXWQ3Kz5/VTohC5EelyGqG4b+KK1YvXt/84DE6y//GHKvCRt8KgbJ4yEf/Z+yYsKcu9GCX0IiDqzBtem/Ca+L9Qqsj8brkMS1NpgTuoNO+gh7eaef2YB28eTnZz7/bl+zghq8VLzE6ey/AX0N494RhmmA1jWZ6m4Nio7Mwi7YOZCICC/nJGIW3yByIwNVubq68CHTyp6rxOIi+DQxSWxho5RY4KVKCQBSnROg3cPesvf3rpMACmE1plyvqcN5ouNVHUCITLOBUHF1S9cgZidsA3A3FSX8
x-ms-exchange-antispam-messagedata: 7P0SDSPGm1DO9YZ9AfASHZbjEpP3JxAFNiWm2z+SHkCMoumckYxV+kOJ9yYjdXWr3k9cCDhqKstLqg20t/Cjc0tfPEcALbCak88q58Id2SQxAPRtC/toIQI0FuUMbip3YtUKvgYkg5rmlggiEtdhHQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5088367-d368-438f-410b-08d7abe59a59
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2020 15:51:31.8427
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v4ycBCUfgFeoo+R4p90AEPpzUGXxV67R0p6XrGNDcny4mJazjzD3THnmu/SYTnqa9brLmvNFIrNtJLcyycrBX9IFs1cb0/QsQjorhxRERvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1484
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

PiBPbiBGcmksIEZlYiA3LCAyMDIwLCBDaHJpcyBCcmFuZHQgd3JvdGU6DQo+IE9uIE1vbiwgRmVi
IDMsIDIwMjAsIFNlcmdlaSBTaHR5bHlvdiB3cm90ZToNCj4gPiBzbyBmYXI6IGluIHRoZSBldGh0
b29sIEFQSSBmb3IgdGhlIHJlZ2lzdGVyIGR1bXAuIEknZCBhcHByZWNpYXRlDQo+ID4gaWYgQ2hy
aXMgQnJhbmR0IGNvdWxkIHNhbml0eS10ZXN0IHRoaXMgcGF0Y2ggc2V0IGFzIGhlIHNlZW0gdG8N
Cj4gPiBzdGlsbCBoYXZlIHRoZSBSWi9BMSBoYXJkd2FyZS4uLg0KPiANCj4gV29ya3Mgb24gYSBS
ZW5lc2FzIFJaL0ExSCBSU0sgYm9hcmQuDQoNCkZvciB0aGUgc2VyaWVzOg0KDQpUZXN0ZWQtYnk6
IENocmlzIEJyYW5kdCA8Y2hyaXMuYnJhbmR0QHJlbmVzYXMuY29tPg0KDQoNCg==
