Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD2BB155AAC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2020 16:25:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726874AbgBGPZV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Feb 2020 10:25:21 -0500
Received: from mail-eopbgr1410110.outbound.protection.outlook.com ([40.107.141.110]:52843
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726674AbgBGPZU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Feb 2020 10:25:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i//JYKg5eJpPDOz1IS9oM/d16T4creo2pKL6btJSry3TuGC9MIuV98o1w5a+KerinNQeW78nUv1rGiKWwhdrbZGIp7chPeF0X0quGW+HsBK+kqLBnYsxTYB7mhLyBGjOYl4Y2qxXmCxKwKM/Wi3hU+1S8UEfrReYdnm5ZUm7D19gXCUS+XCr9wrvtZwtqZqjrHgEs2WqcL6qGi5V4gguHesjx2adpxgKExi4KEwfX3RF1b7aoSiGX0HOz5XnIGcLMGwY6VAn+fco2v+et5ZqdlYpZlAjV3wA238N9uNexoBIXgOkDefKReYz73+m7X1/RhhYKze+VrgDL3rzYEWgvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxJqP/VbtEbGGhV83+dSvA6MuMXHxGSqp//2RCYiDoM=;
 b=WTJkp4DCk5Is4jDI9E52angdnYN+ScA5o4OZz8Fgpd5VSCJ++FvNqKszWhzR58d98fduJUpUkx9i4QNtDDRQaSlSgdVzKgVUAgisQSCVGKUk3p/AQ/finwudI8UcZnOXw2Yp8al2vTvlHaF64TomB0uFZEkCtlKSjkz9S/VfyL3WfkdjOCj4OqmG2LKEZxuN3F6qI4+zngI+Q3bFVbJ4AfVLWZOBVIQc6x9pOeSuS7CLP/TCITM7MHkvgaBpf1+mp12WKnIqEr5OMOZt8Rycu8oaPbPnWKZ1z9juB8RgFD+kmR7Zv6DCzOWGAaaFfINSawqvaM6VyczxQVDHjyUJjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxJqP/VbtEbGGhV83+dSvA6MuMXHxGSqp//2RCYiDoM=;
 b=L4gmtkPHs0BpVmyxAkYTL8fSCuP9F8HWlDvVmEMKRyKXd7WEWEXs07o/fhez/tPe58cBO7I2+PlgbBZQr3xqshg94zWXnEaUNuGVLwmPSALbqnbbbuBWg1W8O76O02vNG1rAs0JSf596un9demPs7mvUPO9S0e9BGgjmig0pwM0=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.163.12) by
 TY1PR01MB1561.jpnprd01.prod.outlook.com (52.133.161.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Fri, 7 Feb 2020 15:25:17 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::8870:97e4:a63c:67ea]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::8870:97e4:a63c:67ea%7]) with mapi id 15.20.2707.020; Fri, 7 Feb 2020
 15:25:16 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "David S. Miller" <davem@davemloft.net>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH RFT 0/5] sh_eth: get rid of the dedicated regiseter
 mapping for RZ/A1 (R7S72100)
Thread-Topic: [PATCH RFT 0/5] sh_eth: get rid of the dedicated regiseter
 mapping for RZ/A1 (R7S72100)
Thread-Index: AQHV2sjuY/y4+IGNNU209XmT/+6jSqgP30LA
Date:   Fri, 7 Feb 2020 15:25:16 +0000
Message-ID: <TY1PR01MB1562CFDEE9179DC7578A99CD8A1C0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <c643125b-5280-cd62-afc1-63b8a06501c1@cogentembedded.com>
In-Reply-To: <c643125b-5280-cd62-afc1-63b8a06501c1@cogentembedded.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcY2JyYW5kdDAxXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctMDk1OGE1YmEtNDliZS0xMWVhLWFhNWItOTRlNmY3Njc5M2FlXGFtZS10ZXN0XDA5NThhNWJjLTQ5YmUtMTFlYS1hYTViLTk0ZTZmNzY3OTNhZWJvZHkudHh0IiBzej0iMTE1MCIgdD0iMTMyMjU1NjI3MTQ4MzE0MjMxIiBoPSJhMlJnNzlVdEVqNklaT2QrT2ZydG9lRHQ5dFE9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2300af5e-5a91-41da-6650-08d7abe1ef73
x-ms-traffictypediagnostic: TY1PR01MB1561:
x-microsoft-antispam-prvs: <TY1PR01MB1561DB5BAAAC8F29D85C910A8A1C0@TY1PR01MB1561.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0306EE2ED4
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(136003)(346002)(39860400002)(366004)(376002)(199004)(189003)(110136005)(478600001)(316002)(26005)(186003)(6506007)(7696005)(66556008)(66476007)(2906002)(66446008)(5660300002)(4744005)(52536014)(64756008)(33656002)(66946007)(9686003)(55016002)(15974865002)(76116006)(71200400001)(86362001)(81166006)(81156014)(8936002)(8676002)(26583001);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1561;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FjId9NCS0YX7DjlWHszndoFD0TrK+0XIwOTNeyhpltNxJoY19AECHNb8/sAMyjUc8MA/w+aj3gzO2sZFsbdKOM7iTRILVwcdKGzUxD6PpOC9PhWrCo0Df84/U9RDuWrYguVUqV0tvTA/yvoqVHrAlIuho567+jVJ6DhGT8DdvQw0cPGR0iNgQE1OwaF9w6BrN5Q26CX92HxgvooIpp68JaaZziN3S+GTqqOTVmkq1fdKWPZ+hqurfe8hXXidDXIfyfK3yDwHquGlih40LUE+TIfucWXNSrEIYm0OreVTqpFT+CMKKx+145TaOx4J5kjKWChG5RrVg9k4pIL/qIC8cmIA5PXPSAw0bTJMkl1uk12VDQUDV/22ggXE1ZRhVe16Bx9JGvQg+97fd8ijkQQ6Z2mAQIQ4uTrEq7KfrTsGqjPsBGhdk/qPSPZdhkPqXGHFT8KGBpp041LWQPU8wlTb2ROsWw4avMZgpSQtTI39T+JjoRZ6aSMaXA0QJjYfdqWe5e+LT2lr6xtIyGMJb9Z0HVtDSl6nlVCtbV5pHtTODd8lH0QrQM+ugXMdF9z4w50h
x-ms-exchange-antispam-messagedata: 5ZXA1SvI6jFSMhqf8Y+OYd8rhtMYoDw28HaalZ/RKmMAQTAzRw/7hvvF+aVVtZsl09KokwWRAe0xAsx2xOegU9MaBm+3IDNNxM3norFhfqs3b/RxiVTZFNXnSh9k9VWgdtMM36IUx92O/Mq5LJSsjA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2300af5e-5a91-41da-6650-08d7abe1ef73
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2020 15:25:16.7214
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YQ8vZsebcY6H9ha0GoudJZiBu4QFgOUgBoa7SkFV89fKdZOhmA1tLMmyT0SzFDUk3znDjY510+XHIxFUdyuhrtTIo3kh6JGwOJ3nvL+B07s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1561
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

T24gTW9uLCBGZWIgMywgMjAyMCwgU2VyZ2VpIFNodHlseW92IHdyb3RlOg0KPiBzbyBmYXI6IGlu
IHRoZSBldGh0b29sIEFQSSBmb3IgdGhlIHJlZ2lzdGVyIGR1bXAuIEknZCBhcHByZWNpYXRlDQo+
IGlmIENocmlzIEJyYW5kdCBjb3VsZCBzYW5pdHktdGVzdCB0aGlzIHBhdGNoIHNldCBhcyBoZSBz
ZWVtIHRvDQo+IHN0aWxsIGhhdmUgdGhlIFJaL0ExIGhhcmR3YXJlLi4uDQoNCldvcmtzIG9uIGEg
UmVuZXNhcyBSWi9BMUggUlNLIGJvYXJkLg0KDQoNCldlbGNvbWUgdG8gQnVpbGRyb290DQpidWls
ZHJvb3QgbG9naW46IHJvb3QNCiQgaWZjb25maWcgZXRoMCB1cA0KWyAgIDE3Ljk0MDA2Ml0gR2Vu
ZXJpYyBQSFkgZTgyMDMwMDAuZXRoZXJuZXQtZmZmZmZmZmY6MDA6IGF0dGFjaGVkIFBIWSBkcml2
ZXIgW0dlbmVyaWMgUEhZXSAobWlpX2J1czpwaHlfYWRkcj1lODIwMzAwMC5ldGhlcm5ldC1mZmZm
ZmZmZjowMCwgaXJxPVBPTEwpDQpbICAgMTcuOTU5MzM5XSBzaC1ldGggZTgyMDMwMDAuZXRoZXJu
ZXQgZXRoMDogTGluayBpcyBVcCAtIDEwME1icHMvRnVsbCAtIGZsb3cgY29udHJvbCBvZmYNClsg
ICAxNy45NzUwNzFdIElQdjY6IEFERFJDT05GKE5FVERFVl9DSEFOR0UpOiBldGgwOiBsaW5rIGJl
Y29tZXMgcmVhZHkNCiQNCiQgdWRoY3BjDQp1ZGhjcGM6IHN0YXJ0ZWQsIHYxLjI5LjMNCnVkaGNw
Yzogc2VuZGluZyBkaXNjb3Zlcg0KdWRoY3BjOiBzZW5kaW5nIHNlbGVjdCBmb3IgMTAuMTAuMTAu
MjQwDQp1ZGhjcGM6IGxlYXNlIG9mIDEwLjEwLjEwLjI0MCBvYnRhaW5lZCwgbGVhc2UgdGltZSA4
NjQwMA0KZGVsZXRpbmcgcm91dGVycw0KYWRkaW5nIGRucyAxMC4xMC4xMC4xDQokDQokDQokIGNk
IC90bXANCiQgd2dldCB3d3cuZ29vZ2xlLmNvbQ0KQ29ubmVjdGluZyB0byB3d3cuZ29vZ2xlLmNv
bSAoMTcyLjIxNy4xMi42ODo4MCkNCmluZGV4Lmh0bWwgICAgICAgICAgIDEwMCUgfCoqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqfCAxMTk4NyAgMDowMDowMCBFVEENCiQNCg0KQ2hyaXMN
Cg0K
