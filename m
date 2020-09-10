Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA31D264559
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Sep 2020 13:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728626AbgIJLdk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Sep 2020 07:33:40 -0400
Received: from mail-eopbgr1310119.outbound.protection.outlook.com ([40.107.131.119]:5440
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730321AbgIJLYp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Sep 2020 07:24:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EwD22/dcpnH6a/sbjig+x5NhG71iL8ptpkkmI3Cob50dtvh8I6VEgM31UEQ0+UrV0PQmb+ZecMCUOw7sOXeoabKBEneC8I3xCWkHViVZ+mEMCySg8BFdycS56z0tBaelvv2jNaaWiTKFvkurNHAXOeaOnKoQIQ444SlGYROZJwnP1mTJ5vc7QWsE5EnlrHqL8H67iCysBxbHo5HIbXf+z3HduZq8W/h8WWUlJj4h/ddrclvMd14x2J1ibONBzGV2ce/uLUPr9bW1b421kAq9OAQcSRBE5AKleB+OcOMKUkVTPDrwCQjZxugAyMLiBjYNcUFP7D6oHylP1nVrdcxvOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CzLX3toqOStQTFy60LrGjLGlTT71uOju5tCD6g8HA5Y=;
 b=VPIyuyG1kXbfLqt7pMawAyP9GjhdBD9NkDbigkf9PqzDjgR8QnxUZUu0KFUZ0b75AuSbachC+OioKyHqm8X0WDCLsjtaARxPVXrSLSl2/L0RROSAq2jqsR1PA7KVCSvKYy1CytqmxUr20jc9mEEhEtqcPDo0OXzJU4fOEuGOHMs33WVEZrXhwfX+j6YGlDUljjl/zO17PaOQ68QZDhJCdVabHvcIs4cpokkw2RlFuEknQQE3mgFuX6ZVi/yovT//x3y8yhgQMsnQH1vdgQU2Sfj0v2cWqD9OVRB4STxHt642iUgEU5OANHr1RVVXAkb+Ev6OZMzMva7+/8uywZUlAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CzLX3toqOStQTFy60LrGjLGlTT71uOju5tCD6g8HA5Y=;
 b=GDFKU9KngrExYpua2bPhYNIfh+G7B8jbXcC2+LgfVgNpMeglB0i16khuwarbERFt6khb8+ZoIdm4DvMa7j6VK1ZRe1hU7qrD7NPr6Ais15OD/zkG1KloFSKWt2k3ExB2GARjhD0DPkkeD5TTYYL5LYeyMcaMbaLXCzQyii2WJfw=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB2569.jpnprd01.prod.outlook.com (2603:1096:404:74::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Thu, 10 Sep
 2020 11:24:21 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9055:525d:2d64:b625]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9055:525d:2d64:b625%5]) with mapi id 15.20.3348.019; Thu, 10 Sep 2020
 11:24:20 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: RE: [PATCH 14/14] arm64: dts: renesas: Add Renesas Falcon boards
 support
Thread-Topic: [PATCH 14/14] arm64: dts: renesas: Add Renesas Falcon boards
 support
Thread-Index: AQHWhPgXPxjJ48KvYUmh4Lgcbyf/male/suAgAK7PuCAAAL6gIAAAqXw
Date:   Thu, 10 Sep 2020 11:24:20 +0000
Message-ID: <TY2PR01MB36929567AEB2CB7BB45B2036D8270@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599470390-29719-15-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdUXUvU5dPkBFdW_ZVhnBKpFEPVLD3mdOkhrmakZjCHErg@mail.gmail.com>
 <TY2PR01MB36929138C1723ABE87358597D8270@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAMuHMdU6TLz09bvNCK8kRruu-W+B8c9Bnbr5kTCZzW-38cqO8A@mail.gmail.com>
In-Reply-To: <CAMuHMdU6TLz09bvNCK8kRruu-W+B8c9Bnbr5kTCZzW-38cqO8A@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:29e4:1562:227f:bbc3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ae683b2a-abec-4d87-3469-08d8557c103a
x-ms-traffictypediagnostic: TY2PR01MB2569:
x-microsoft-antispam-prvs: <TY2PR01MB25699F5EAF96E1836C694FBAD8270@TY2PR01MB2569.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ILQm4gEWlvJ4ldguesj14A8jFQSVt00FgOYAu27XclPKoWw9Cmkzx3MVtxJ+Nr1so1rxwbcSSbJzWhp6jzOLa4/U4B5LzKx2kBLx8ktYzhxxmzrYvxlomuT9ddNZruP0I7zByE4qDRLnpXSCWiEO5IGr1Vj5n+z261S9p38tbc1jNAY1+OORNXznQsssbuFFuOIE/6IalOsZSLvrcPB+vuT6pKmZkZh6oRsnJezDy+DzboFw+6UkeIx7bCNZ/GZIiO/cqzne12hpTqvuyjjvWb0iOYRN+CIqbaIBTZreaTr22oAXkq5tn9sTpLA2l1FupTKK07DgJQkmx1P2Ecd8Gw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(346002)(396003)(366004)(478600001)(76116006)(53546011)(71200400001)(66556008)(66476007)(64756008)(6506007)(55016002)(66446008)(4326008)(186003)(6916009)(7696005)(5660300002)(52536014)(2906002)(86362001)(54906003)(66946007)(33656002)(8676002)(8936002)(316002)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: qefNlo8kn2uyVHy98PHx4K+RmleG5nBE60XgknRoaNt34Z4hiy+hsCiAcMTz5e1TboTrz1bGUxSUqmEImXk3oSZbLTbwIlwZppTkPOnaGMCF3aosmSvAaCmrZT6H+Bj5ehKe77H+0++L2UASI39tO6ii4hcVnU6uvQJajg2JdA19jrNSh6G/ARJgPdMWsYe4ddYj1ZuPnizxImVgD9vQz2qOiR9BRCFc5N6LG1lVSTbum68jwSpVqefHb5YiaHOK5caWFWL6yLwTrwJ9mqpr4o9HnWjJ0MPSk9PMa8omTqxetvgKhfdfizvxpwWdr8/A0z/MZq5fwcvR6AYMWUG23679cIj62oJnQgfQw/264Gx4gliU5pmqoBIkaSMmT25gkOJsl9pYgfisQwstoAgw7I7tS4j9uSgMYlOl/5ofTTp3XF3KdERyntVcLb6K7JtykCsEaxOxieupWvEbw3EeVzWSezQaEFLJP/eTn7aR1lp0l24mgNqGQt5Gi17wH7qxOrfDCdmtSccM61oR9Di2NC4H5SCXDRsTfJKFQbi30KDE7umVrrnQpDGimGGd0slh87cPlll9OlcKpiSY4tJLsBeXmHT05TkYVLk39t9/4RsfM9Ivif+myfX8JZugMGpSpYXsNDlXbY/DQ2CCOnI9DD6Df7+SV3b/LWi4S63bj3zLOjbAMf1D/BkOaeVnxlLZXM4AC4RKNIGk2yB912crdQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae683b2a-abec-4d87-3469-08d8557c103a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2020 11:24:20.7991
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WNg95zNMchuAFc+fMFdY0+HvknyVVwBGW8Z61Yc/EJ7KFqACAnFa2MQbf5cc4V2V9RYMdSjE8tOPqL/G+3VzzjMRDm5rqlhpIvrEBx44wIHyWSCpEud0Gpw6PCpA5ksR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2569
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVGh1cnNk
YXksIFNlcHRlbWJlciAxMCwgMjAyMCA4OjE0IFBNDQo+IA0KPiBIaSBTaGltb2RhLXNhbiwNCj4g
DQo+IE9uIFRodSwgU2VwIDEwLCAyMDIwIGF0IDE6MDQgUE0gWW9zaGloaXJvIFNoaW1vZGENCj4g
PHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+IEZyb206IEdl
ZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgOSwgMjAyMCAyOjIx
IEFNDQo+ID4gPiBPbiBNb24sIFNlcCA3LCAyMDIwIGF0IDExOjIwIEFNIFlvc2hpaGlybyBTaGlt
b2RhDQo+ID4gPiA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+
ID4gPiBJbml0aWFsIHN1cHBvcnQgZm9yIHRoZSBSZW5lc2FzIEZhbGNvbiBDUFUgYW5kIEJyZWFr
T3V0IGJvYXJkcw0KPiA+ID4gPiBzdXBwb3J0Lg0KPiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+
DQo+ID4gPg0KPiA+ID4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiA+ID4NCj4gPiA+ID4gLS0t
IC9kZXYvbnVsbA0KPiA+ID4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvZmFs
Y29uLWNwdS5kdHNpDQo+ID4gPiA+IEBAIC0wLDAgKzEsNDQgQEANCj4gPiA+ID4gKy8vIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ID4gPiA+ICsvKg0KPiA+ID4gPiArICogRGV2
aWNlIFRyZWUgU291cmNlIGZvciB0aGUgRmFsY29uIENQVSBib2FyZA0KPiA+ID4gPiArICoNCj4g
PiA+ID4gKyAqIENvcHlyaWdodCAoQykgMjAyMCBSZW5lc2FzIEVsZWN0cm9uaWNzIENvcnAuDQo+
ID4gPiA+ICsgKi8NCj4gPiA+DQo+ID4gPiBBcyB0aGlzIGJvYXJkIGNvbnRhaW5zIHRoZSBDUFUs
IEkgaGFkIGV4cGVjdGVkDQo+ID4gPg0KPiA+ID4gICAgICNpbmNsdWRlICJyOGE3NzlhMC5kdHNp
Ig0KPiA+ID4NCj4gPiA+IGhlcmUuDQo+ID4NCj4gPiBJIGdvdCBpdC4gSSdsbCBhZGQgaXQuDQo+
IA0KPiBUaGFua3MhDQo+IA0KPiBCVFcsIEkgZm9yZ290IHRvIG1lbnRpb24gdGhhdCB0aGUgZmls
ZSBzaG91bGQgcHJvYmFibHkgYmUgbmFtZWQNCj4gcjhhNzc5YTAtZmFsY29uLWNwdS5kdHNpLCBp
LmUuIGluY2wuIHRoZSBTb0MgcGFydCBudW1iZXIgcHJlZml4Lg0KDQpJIGdvdCBpdC4gSSdsbCBy
ZW5hbWUgdGhlIGZpbGUgb24gdjIgcGF0Y2guDQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBT
aGltb2RhDQoNCg==
