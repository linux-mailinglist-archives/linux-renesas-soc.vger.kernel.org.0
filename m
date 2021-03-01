Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF51327CBF
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Mar 2021 12:02:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230523AbhCALBg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 1 Mar 2021 06:01:36 -0500
Received: from mail-eopbgr1410129.outbound.protection.outlook.com ([40.107.141.129]:61828
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233392AbhCALAa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Mar 2021 06:00:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iAkO7KhQVzVhVTW7hhjUZflCd3pxsp24HMj2mGXlha3NIbO1b9dBP/Cl4+CGlWpHjd82FKLD67AFkNK993XlOSWaDXrWBB1pEHZYV2CkMgDZLhe6aRfnQc4k+makq+SOBWnvuDElhjWM5JIRul/V8cYOGwjV3Ed9FmVoNiNPrDpLs19uEnx+x73QcRBA0S4AEOHLQlVKQLhhhOP4VMZ6MezpRRezdWFDBIcsb91vJ4QFtBY9e4rkHvJeW03xx8OSddR9I6nZd7eHNlkvwygeeG/bt9geOClK+u05HrFd7Abzkyktl84glNJyLnK+Mx2Cn7DsFhn35ECD6Q7Pg2stJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HrTd84OWXtHg3sV5W5f1vbUxJzQOqJJ60bBSXBnhT1k=;
 b=a5npJM+zNRGqF1cMUcofg/j80lOfSM7/E0x8d5GI18/eZtIwL0rWRnV/i6VxgqMk8ABi1EfDeyiNTD3XYpmwZ+X6C7uDczleY1RRSb5Hdidn4oV2wazp+rT2dGPgf6EVeONfNkoHCk07o/rt+HD9sLnq1sex+GBygFhlBGUBlOXlwpAlelZ8x6uhwOS5R9tDn/EeKGIv5g2mwAtuuNzHm3dz9ZLvebfCST2rnYanU9LzN2K4QYq9gUGh3zmHJSycWvYGjceEwGHCNOkyD+Be+zfYDbUXMPDaCcMZJjrX/CAIWBB+bmmI7w8OkdUpkn+eSWFe5y7UbTHxNE9XLZdyQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HrTd84OWXtHg3sV5W5f1vbUxJzQOqJJ60bBSXBnhT1k=;
 b=HZsaoJ8LL3SKV3/xn8RrnLus/Z4bn2cTXdpfJK3zINXbxoRE77P1egvXqLe9y5mq2/61RKmPrfPj9puydv0OLJgQMfWt3Xe7xv+iV7ZGOg0Fhyw3jSi9b52E//5L9Ko60k6s/0fx3ly/0vj6oMhja2ksyKa8qkXmMRx99JztiFc=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYCPR01MB6350.jpnprd01.prod.outlook.com (2603:1096:400:92::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Mon, 1 Mar
 2021 10:59:40 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::cb4:9680:bb26:8f3f]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::cb4:9680:bb26:8f3f%4]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 10:59:40 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: RE: [PATCH v3] arm64: dts: renesas: Add mmc aliases into board dts
 files
Thread-Topic: [PATCH v3] arm64: dts: renesas: Add mmc aliases into board dts
 files
Thread-Index: AQHXC3AOJmo/i2fQRkqPbIkfTls2dapo0auAgADIL8CABN4IMIAAYTKAgAAi8rA=
Date:   Mon, 1 Mar 2021 10:59:40 +0000
Message-ID: <TY2PR01MB3692F86488846C01862A9210D89A9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1614255382-6377-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdWLBX89R+jZSZSofgL-ONhjFBBdMDwd44Tuu8BY46+GjA@mail.gmail.com>
 <TY2PR01MB369202DF4D3EEC1085F6B00CD89D9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <TY2PR01MB3692F86C982DAA22761A3DDBD89A9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAMuHMdXXBKe8Dzobfwf=L6O9=b5vDo2Z7JLpwPa2SH_cdK_uHA@mail.gmail.com>
In-Reply-To: <CAMuHMdXXBKe8Dzobfwf=L6O9=b5vDo2Z7JLpwPa2SH_cdK_uHA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 63694dc2-bb4b-4485-ab03-08d8dca11cc6
x-ms-traffictypediagnostic: TYCPR01MB6350:
x-microsoft-antispam-prvs: <TYCPR01MB63508E97E331EC51588449C7D89A9@TYCPR01MB6350.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bkZQKDWiUn2KUma8fbjdl9/iliwR3z8a3y8YE5hQTHjph1WRis+DEhroRSifk9OIzvH234f3nQB8cqHWd9hYNCmHhL2xEzUZu6MTZGovUlpjDk/tKOwW18gqkZe5XBrwyJrjTQDl/i2YbwfmzYYHs4VHH+lughRwO0TbpDE7d7xDio38lnmRz+01W0OivUQACwvnWw28QgGvMakDR5uicxL6SGPO3FJ4vzVwfp5A8UYzDfWXdAXa+HB2FYuCz4Rabi0LkfUweF8Zltvilh7lFtdJ+lYUY3/9Yk2btn8jH2VV0o4ZA9pr9Lk+AweUs+KJflrsaiVy6XzN/TwNBL2+YTqY2x5fmaRbcy0eqotFRt2yQXHqf6ccLMcueN8V1vubqAhIjx3iPYmVmVFZaROL+YRXssaF+JkII1E7i0xEjIZmOuA8TtixDAV6jv9RqajFyqOd2wJ0GFEAXPE2mRuzXyW/Y1zNwoLr7Z99njy3v3DM+tueIFfRwhjNa7bzzYQd8/H7xQ/ijX45UaTP4UP/2g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(346002)(136003)(396003)(366004)(54906003)(8676002)(7696005)(186003)(8936002)(316002)(6506007)(4326008)(6916009)(478600001)(2906002)(55236004)(26005)(66556008)(52536014)(64756008)(76116006)(71200400001)(66476007)(5660300002)(66446008)(66946007)(55016002)(33656002)(86362001)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?SWNicU53NWtyK1ZKSFM0c0ljUTZMc0s3dGVIeE41amJ6cjUrR3JnNzdqU1lT?=
 =?utf-8?B?cm83MFdvcWk5SzBZaXRUYlRSYTlldUxQYTZXa053WXpnS3dkVnkzZFYrcFZD?=
 =?utf-8?B?cjlJTWVlMmZ1K2g3dnUrdzBWZWRFcDFGQlRXRWE4QnBhMlNYTVpFS05UY0Qw?=
 =?utf-8?B?cmdGY3p3Tzlrem1zMVVGRDlFMVNzbTRvMGJWQlRFUVFxcUppSXB6YmJ3OS9o?=
 =?utf-8?B?cS9WM1dEczJoRFc0OWxzT3BUcVhlOTduZk9qSmZyTlBqYmpmMzBXOUc5NHpR?=
 =?utf-8?B?VFo4d24rbzdiMjd0RlpKVDh0dC9TM0FFd0E5T3V6VTc4ZDdFVHVJMTF4VkVC?=
 =?utf-8?B?dmFVcnd6VnJjbFlTaGQ2WEF4cms0WWE2dm8zT1I3OUdJWVgwS2hMSGVvQkJP?=
 =?utf-8?B?QkcrQUNHQVpEM2tTYm1qbUFZcjZmWWxicDNCdlhMOWtOVlVZQXNMd09tL2Rj?=
 =?utf-8?B?cXpOQ3RKZ2M4d0FoS3AybUhTQllHbVJIU21abUF1bzdQVDc4RmJzOThTdW1I?=
 =?utf-8?B?RGJKMm9PdWhHSUhyUUFmODN3TW1WcmRHOW1KYlVvSkpZNTRNSWV5M0l3Wnh1?=
 =?utf-8?B?T0dJM1E4OW9iQ05oUTFHWjVWeWEyUUJETEFLNXFxVTV4cmdMb2s5bW9paExn?=
 =?utf-8?B?U3pPNTlnd1pOeFczR0JkQ1Y5aVhSQTByQlZjd2s4K1AyWDFhOC9JbTFZRWZQ?=
 =?utf-8?B?cE5DTjIvY3hJcndrRVcxZGk5ckVCWmNiNXIvRUhRM2lSbnB2Q05HdmtYYU9Y?=
 =?utf-8?B?OE9nVWdQLzNBSjlHYUl3NE5jaFlQUmNUcDRWME9xQzVPOEQ5QXpDajB4U2Fq?=
 =?utf-8?B?cy9tT3dTc2g0ekxEd0pMekJLSVdLL0tEeGpCNE1MVytGU1psZ1JpdFRjWmZZ?=
 =?utf-8?B?T3Q1VzI4dkx3NEFtbHQ3ZE5sWVFwaHNlR29WY2EwSS9jL1hkbHd4YkJWM21l?=
 =?utf-8?B?Z3ZtYjlQOUhrM1FpNHlUZS9vWDhiYUxlYnU2eFhVaTBuc2lMMFY1VzRvZDFU?=
 =?utf-8?B?eW9yZjk3TDlNdnVPdjl2cmh1RjRIakRzNmZQdThMTGFWK3VXQUF2R1V5NUZ5?=
 =?utf-8?B?dXRWbzMvWVBMV1JrOXlpc0wrRUdBbXZpNzgrdkYwMGw5YWYwSWpMU1hqaDQ5?=
 =?utf-8?B?bjFHSlNheC8wU0s2Z2pZS3RTaXZWUllrelczT0ZkOGpmODJvRFc3YllaaVZy?=
 =?utf-8?B?Y1ZpUld5YXd0MnZ3TWlhQVZoaWFCV1JaVHEyOFc4MDVPM1RmS2l6NW1XdXpx?=
 =?utf-8?B?WDVnZ0xabW5UdFlSaGpFNlY5aWlsUmNBc3hwalNZODNselNqc1NFQmozUXhw?=
 =?utf-8?B?S0g3ZzBKV1JuenFxQTdDOXdjY3VKNGhkTlByWld3ZlY5d0ZLVFlNUEFWWVVt?=
 =?utf-8?B?NWk1Zm9KS3lENGs2VVowSmFHb2h0ZmVjSnRoMXdFbTNoRk4wY0twajlnUjNm?=
 =?utf-8?B?aVdiWGNQaWR2VUJEc0lRazl3R0RZdjJBWVhsZC9BSWx4Z25BbmVaZ2Jabm03?=
 =?utf-8?B?K3RmOEc3UlB2V1k4cnhhSnlURktndk0zT1ZrKzlxZXZwRlQ4eXkxanV0K2Q1?=
 =?utf-8?B?bkhBR25EUVNrbDFadFZjaXlwOVpMSXZ2WFBMZlkrc3NJR3pxcjF5SG1oc2pj?=
 =?utf-8?B?NDFYL09rajBoVTNIdVU2RGRGcEJKYVNwYk1GZGowajVUeFovUGNqUlNFRThi?=
 =?utf-8?B?Sk1LSEtXcU1hNG5CRm91M0NiUGtVcGxBN1I0ZUlTMW9LcWlINUFhOTN5cUU1?=
 =?utf-8?Q?UYgsDoUXCebTZ9A+ZiUpvMmiNLQRqNhjjrA03jp?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63694dc2-bb4b-4485-ab03-08d8dca11cc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2021 10:59:40.1853
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NxpweBihc8IkzUlElt8Z5/YxxP3diEHjXs/EnKn6Ubxe+q4cKQCI6HteoYMd8VTfIIFUVmmp2CVH5RmkNbyEQgRsYgQ+XQpEv9QIaonwwORvQj9NUndWzZ2jzP7AUfmZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6350
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogTW9uZGF5
LCBNYXJjaCAxLCAyMDIxIDU6NTEgUE0NCj4gT24gTW9uLCBNYXIgMSwgMjAyMSBhdCA0OjEzIEFN
IFlvc2hpaGlybyBTaGltb2RhDQo+ID4gPiBGcm9tOiBZb3NoaWhpcm8gU2hpbW9kYSwgU2VudDog
RnJpZGF5LCBGZWJydWFyeSAyNiwgMjAyMSAxMDowMiBBTQ0KPiA+ID4gPiBGcm9tOiBHZWVydCBV
eXR0ZXJob2V2ZW4sIFNlbnQ6IFRodXJzZGF5LCBGZWJydWFyeSAyNSwgMjAyMSA5OjQ3IFBNDQo+
ID4gPiA+IE9uIFRodSwgRmViIDI1LCAyMDIxIGF0IDE6MTYgUE0gWW9zaGloaXJvIFNoaW1vZGEN
Cj4gPiA+ID4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvc2FsdmF0b3ItY29t
bW9uLmR0c2kNCj4gPiA+ID4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvc2Fs
dmF0b3ItY29tbW9uLmR0c2kNCj4gPiA+ID4gPiBAQCAtMzYsNiArMzYsOSBAQA0KPiA+ID4gPiA+
ICAgICAgICAgICAgICAgICBzZXJpYWwwID0gJnNjaWYyOw0KPiA+ID4gPiA+ICAgICAgICAgICAg
ICAgICBzZXJpYWwxID0gJmhzY2lmMTsNCj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgZXRoZXJu
ZXQwID0gJmF2YjsNCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgbW1jMCA9ICZzZGhpMDsNCj4g
PiA+ID4gPiArICAgICAgICAgICAgICAgbW1jMSA9ICZzZGhpMjsNCj4gPiA+ID4gPiArICAgICAg
ICAgICAgICAgbW1jMiA9ICZzZGhpMzsNCj4gPiA+ID4gPiAgICAgICAgIH07DQo+ID4gPiA+DQo+
ID4gPiA+IExvb2tzIGxpa2Ugb24gU2FsdmF0b3ItWChTKSB0aGUgdHdvIFNEIGNhcmQgc2xvdHMg
YXJlIGxhYmVsZWQNCj4gPiA+ID4gU0QwIGFuZCBTRDMsIHNvIHRoZSBsYXN0IG9uZSBzaG91bGQg
YmUgbW1jMz8NCj4gPiA+ID4NCj4gPiA+ID4gV2hhdCdzIG1vc3QgaW1wb3J0YW50PyBHZXR0aW5n
IHRoZSBuYW1pbmcgcmlnaHQsIG9yIG1hdGNoaW5nIHRoZQ0KPiA+ID4gPiB0cmFkaXRpb25hbCBu
YW1pbmc/DQo+ID4gPg0KPiA+ID4gTW9zdCBpbXBvcnRhbnQgaXMgc3RhYmxlIHRoZXNlIG1tY2Js
a04gbmFtaW5nIGZvciB1c2luZyBpdCBvbg0KPiA+ID4gdGhlICJyb290PSIgcGFyYW1ldGVyIDop
DQo+ID4gPg0KPiA+ID4gSSBkb24ndCBoYXZlIGEgc3Ryb25nIG9waW5pb24gdGhvdWdoLCBJTU8s
IG1hdGNoaW5nIHRoZSB0cmFkaXRpb25hbCBuYW1pbmcNCj4gPiA+IGlzIGJldHRlciB0aGFuIGJv
YXJkIGxhYmVsZWQgYmVjYXVzZToNCj4gPiA+IC0gd2UgZG9uJ3QgbmVlZCB0byBhZGQgYW55IGFs
aWFzIGludG8gYSBib2FyZCBkdHMgaWYgdGhlIGJvYXJkIGlzIHVzaW5nIG9uZQ0KPiA+ID4gICBz
ZGhpL2VNTUMgb25seSBsaWtlIHI4YTc3OTk1LWRyYWFrLmR0cy4NCj4gPiA+IC0gYWxzbywgdGhl
IHRyYWRpdGlvbmFsIG5hbWluZyBpcyBmYW1pbGlhciB0byB1cy4NCj4gPg0KPiA+IEknbSBhZnJh
aWQgYWJvdXQgY2hhbmdpbmcgbXkgbWluZC4gQnV0LCBtYXkgSSB1c2UgZU1NQyBjaGFubmVsIGFz
IG1tYzA/DQo+IA0KPiDigJxBIHdpc2UgbWFuIGNoYW5nZXMgaGlzIG1pbmQgc29tZXRpbWVzLCBi
dXQgYSBmb29sIG5ldmVyLiINCg0KSW50ZXJlc3RpbmcuDQoNCj4gPiBUaGlzIG1lYW4gdGhhdCBJ
J2QgbGlrZSB0byBjaGFuZ2UgdGhlIGFsaWFzZXMgYXMgYmVsb3cuDQo+ID4NCj4gPiArICAgICAg
ICAgICAgICAgbW1jMCA9ICZzZGhpMjsNCj4gPiArICAgICAgICAgICAgICAgbW1jMSA9ICZzZGhp
MDsNCj4gPiArICAgICAgICAgICAgICAgbW1jMiA9ICZzZGhpMzsNCj4gPg0KPiA+IFRoaXMgaXMg
YmVjYXVzZSBpdCdzIGVhc3kgdG8gaW1hZ2luZSBtbWNibGswIGFzIGVNTUMNCj4gPiBhbmQgc3Vw
ZXIgb2xkIGtlcm5lbHMgKHY1LjQgb3Igb3IgZWFybGllcikgd2VyZSBwcm9iZWQgYXMgbW1jYmxr
MA0KPiA+IHNvIHRoYXQgd2UgY2FuIHVzZSAicm9vdD0vZGV2L21tY2JsazBwTiIgb24gdGhlIGtl
cm5lbCBwYXJhbWV0ZXIuDQo+IA0KPiBNYWtlcyBzZW5zZS4gIEkgaGFkIGEgbG9vayBhdCBteSBS
LUNhciBIMyBFUzEuMC9TYWx2YXRvci1YIGJvb3QgbG9ncywNCj4gd2hpY2ggc2hvd3MgdGhlIGZv
bGxvd2luZyBoaXN0b3J5Og0KPiANCj4gICAtIHY0LjcuLnY0LjktcmM4OiBtbWMwID0gU0QwIG1t
YzEgPSBTRDMNCj4gICAtIHY0LjgtcmM3Li52NS40LXJjMTogbW1jMCA9IGVNTUMgbW1jMSA9IFNE
MCBtbWMyID0gU0QzDQo+ICAgLSB2NS40LXJjMy4udjUuMTEtcmM3OiBtbWMwID0gU0QwIG1tYzEg
PSBlTU1DIG1tYzIgPSBTRDMNCj4gICAtIHY1LjktcmM3Li52NS4xMTogbW1jMCA9IFNEMCBtbWMx
ID0gU0QzIG1tYzIgPSBlTU1DDQoNClRoYW5rIHlvdSBmb3Igc2hhcmluZyB0aGUgaW5mb3JtYXRp
b24uIFRoZXNlIGFyZSBoZWxwZnVsIQ0KDQo+IE5vdGUgdGhhdCAoMSkgdGhpcyBpbmNsdWRlcyBi
b3RoIG1haW5saW5lIGFuZCBkZXZlbG9wbWVudCBrZXJuZWxzIGJhc2VkDQo+IG9uIHJlbmVzYXMt
ZHJpdmVycywgYW5kICgyKSBuYW1pbmcgY291bGQgYmUgdW5zdGFibGUsIGhlbmNlIHRoZQ0KPiBv
dmVybGFwcGluZyByYW5nZXMuDQo+IA0KPiBTbyBJJ2xsIGJlIHdhaXRpbmcgZm9yIHlvdXIgdjQu
Li4NCg0KVGhhbmsgeW91IGZvciB5b3VyIGNvbW1lbnRzISBTbywgSSdsbCBzdWJtaXQgdjQgcGF0
Y2ggc29vbi4NCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0K
