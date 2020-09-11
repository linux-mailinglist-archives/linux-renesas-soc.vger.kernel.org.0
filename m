Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 046C2265615
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Sep 2020 02:35:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725298AbgIKAf0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Sep 2020 20:35:26 -0400
Received: from mail-eopbgr1400107.outbound.protection.outlook.com ([40.107.140.107]:12932
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725280AbgIKAfY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Sep 2020 20:35:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FgSujXktCvBi3dwmnfR0NusNOn/BUffrpwPUvmNzfwZlXVd1FaxhOQUT5ssf26qHBZ1zlFywCcm7Wb8IgAA1fBOShzvmi2tgYo+aohPiSFgrwYpuVabF0e6Z6DSP4a2ViIh7UmqsK2nVYwPX7XtygSCOLz8CtrfAsz2+2twQnEkt63SBT9uQn+4nBf5hJYu1Lw6wdJ1Jc8vqrc4P+2vScrQmEu4xKxxqYg+fWMS4QChMJy+lCmdu+hZ/TyPa7trHCGUF2kUaL7Hz+gp4gzNr3gKC5nelOFBtYIzLoHuwCmo+/gZ7BlFiaZSFyy6LNzManifvVS63ub/ge7Ij/GgGxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpuIl39aeHKjDFEhrxxLpITVT30mgUSowQrvIqfVxeQ=;
 b=VI7EIF2eiTBaln5ihb3jnBwm16zAbdOF+yK3rYtUgRgAPeo1P0tfOlqocoNvZkLszQmSJIm9Pu6HF5VrqCIbE4t3lThLgOvSd4oeh8TjIE8Ku0lTcvP8ZwX/BsVLOiL+19CzjP2q3/aWdwlmjwEdv1X8vA97ZGs4ieMqRUlOHK9K+yRovOlK2HRCrqzWSatFHSGCWHCnerRkPSk4TlCujXZgUUM3vLIyvrc+jDHfWUVchC2Rdw3Cl2coJcbLWIkui5y7+fsIZaf0hrGXOS9pk3zCmaVpPxfDbli9g0E3UoKxFjkTcauWAL5vVnJGtZM9AMu9ytBsjrIrclNfZIaCYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpuIl39aeHKjDFEhrxxLpITVT30mgUSowQrvIqfVxeQ=;
 b=l4ZJVakVjDMkWbvTCkpHgUvLTdByd7gt02Uyi4hqaZDyvBK9XtfRj0L53k9SPAh8yz8Fdis/S+Kky+MY7SVRr4jJqOCMu742TYzn2fJVuLwbTYAZZvkt6nrljae7AS8Iuiy7I3b3eQcnRnUBdDJrC4jbsn7lcYGMEaR+2o22Dw0=
Received: from OSAPR01MB3683.jpnprd01.prod.outlook.com (2603:1096:604:33::12)
 by OSAPR01MB1857.jpnprd01.prod.outlook.com (2603:1096:603:2e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Fri, 11 Sep
 2020 00:35:21 +0000
Received: from OSAPR01MB3683.jpnprd01.prod.outlook.com
 ([fe80::1d16:3e99:8fb2:84e1]) by OSAPR01MB3683.jpnprd01.prod.outlook.com
 ([fe80::1d16:3e99:8fb2:84e1%7]) with mapi id 15.20.3370.016; Fri, 11 Sep 2020
 00:35:21 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 2/4] clk: renesas: cpg-mssr: Use enum clk_reg_layout
 instead of a boolean flag
Thread-Topic: [PATCH v2 2/4] clk: renesas: cpg-mssr: Use enum clk_reg_layout
 instead of a boolean flag
Thread-Index: AQHWhqsLVVvoRJkSnU+xEKgVPvWmEKlh2QgAgAAAJgCAAMAdEA==
Date:   Fri, 11 Sep 2020 00:35:20 +0000
Message-ID: <OSAPR01MB36831B4C6C687D97D7D83E6FD8240@OSAPR01MB3683.jpnprd01.prod.outlook.com>
References: <1599657211-17504-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599657211-17504-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdX0--GqyjqWH+0Hi_6_A2BC8qda6k2wuUtQ6=FjabG5ZQ@mail.gmail.com>
 <CAMuHMdUxkFDA4mOZ76Sx6_mJ5Nqs6cvxBAAA5hJa65LkAnx09Q@mail.gmail.com>
In-Reply-To: <CAMuHMdUxkFDA4mOZ76Sx6_mJ5Nqs6cvxBAAA5hJa65LkAnx09Q@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:64a2:c8a4:9548:6c30]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b6aefed5-8892-49e4-bdfa-08d855ea90a8
x-ms-traffictypediagnostic: OSAPR01MB1857:
x-microsoft-antispam-prvs: <OSAPR01MB1857526963D14513BCC8B8BDD8240@OSAPR01MB1857.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uQnC18RKrW8joduG3qzUNQ1vfEs1jGlXJagrx/sPAMgd4mN/6Lz8WkdCs3t3ttzPyOooRHf0Z38R37l5JFCqUnDeaA8H3XFQ603dzbmrAGHutucBgKCIoHEuzj9TMpgUbNTAyjzuJXAXo4K+aY7FzNQDweUCMDcb7RVvxcvXT0exiukn0PmImEpE05A7guLpma/OpdtW2EdEZe6KmfnAr2pD/7PeAOQR41AcJi0wUGbxsS1T6jjk0jHFLoP1FHDY09DEArrONOkcTj0kN4hEkaV0ZMcxTdFJ4eKnTJ5+S1TJqK/kJqUDZfVZLYC/UQv7MzmWzHBWnIlKyFzb6l3LWpO+FKrmIq4+csTQ4wHiWJlbXxVsRqvrHn6eiNPUWpjEAYoqkKRADG00ZNE6DyLtXA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB3683.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(39860400002)(366004)(376002)(54906003)(7696005)(52536014)(9686003)(966005)(186003)(316002)(55016002)(6916009)(4326008)(8936002)(2906002)(83380400001)(66946007)(86362001)(66556008)(66446008)(64756008)(8676002)(6506007)(66476007)(5660300002)(53546011)(33656002)(76116006)(71200400001)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: /kHSQDQ6nehZDkg+F4GdUdI+z8c/qYkv7seKjvbzxkzKrfO8Voms2+e/nphYhvzDtbj3hWaB3GDrnm1SBdBa+1kGCN1JULjmZiifGFqye5VEikRneHYCK/PrS7/lqgXrwShXfRA8AA+a7aIIvnx61a4qEQGaYV7VP82LzdwVBhv5dhaXRE7RfoaXM0S6mtj8wXszCUYy8sBjuOnPjvX7aAT6zyEQfsh/4sG6j2V3Tizf2oZWAolLSRp3CHEcLf4NbZHXO2biIfuQLqm+augv7lmdHrbxU4jypC6wdLe2qgHvrnbuPsdI3YChe50zoSdwr0l7ICH9GgXbMsXbxoP9dpG1v1J1ZbLHDXwJ8xt4ufJ9uPdO5q6bi4cW/Y0Imk1HmWAo353H5iZkJMM9/AFEHypmEBXi9cwFTDaxdLJoFuI9FHAb6mViNi2KBcjd0YHXQkpQYd15DDClD66Gl9F9WfZmAhvpRucSK43i7DuOqIZfHayUNZ/ODWGt4Rqa/IXYLC3ENQQN/uWIbZzeCcef1fcEyYHMWir/fgWXQAEn8ewaAo7jZCDHvAdt+mWKu2NbBIKP5371xSVcbTVED1faYwtLgSxvpjSHkKiE60dkjUTUHXe1wl5ov5/ykS7Qch6QBUuf7Eu56u5dwp4Jc5H7bD98B7L8PNiBsf9NBUPQhF1vd2y0VRgMPUuIq2f19lCuA7NbbiGxXtHVXlV08amXMw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB3683.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6aefed5-8892-49e4-bdfa-08d855ea90a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2020 00:35:20.9441
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tkzMyPGYDVPph77emud+Zv4tpsiezEdyXoEqnJXOJu0p2fMA+6UC7rIyyL+ThnSR6wr7hA5dGJJdaf2UJsiUf6n94pY+NiZm1rUhS/kxx+CQMCaU91V6A/oCVQoXiNY0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB1857
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVGh1cnNk
YXksIFNlcHRlbWJlciAxMCwgMjAyMCAxMDowNyBQTQ0KPiANCj4gT24gVGh1LCBTZXAgMTAsIDIw
MjAgYXQgMzowNiBQTSBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiB3
cm90ZToNCj4gPiBPbiBXZWQsIFNlcCA5LCAyMDIwIGF0IDM6MTMgUE0gWW9zaGloaXJvIFNoaW1v
ZGENCj4gPiA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4g
R2VlcnQgc3VnZ2VzdGVkIGRlZmluaW5nIG11bHRpcGxlIHJlZ2lzdGVycyBsYXlvdXQgdmFyaWFu
dHMgdXNpbmcNCj4gPiA+IGFuIGVudW0gWzFdIHRvIHN1cHBvcnQgZnVydGhlciBkZXZpY2VzIGxp
a2UgUi1DYXIgVjNVLiBTbywgdXNlIGVudW0NCj4gPiA+IGNsa19yZWdfbGF5b3V0IGluc3RlYWQg
b2YgYSBib29sZWFuIC5zdGJ5Y3RybCBmbGFnLiBObyBiZWhhdmlvciBjaGFuZ2UuDQo+ID4gPg0K
PiA+ID4gWzFdDQo+ID4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yZW5lc2FzLXNv
Yy9DQU11SE1kVkFnTjY5cDlGRm5RZE80aUhrMkNIa2VOYVZ1aTJRLUZPWTZfQkZWalEtTndAbWFp
bC5nbWFpbC5jb20vDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogWW9zaGloaXJvIFNoaW1v
ZGEgPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPg0KPiA+DQo+ID4gPiAtLS0gYS9k
cml2ZXJzL2Nsay9yZW5lc2FzL3JlbmVzYXMtY3BnLW1zc3IuaA0KPiA+ID4gKysrIGIvZHJpdmVy
cy9jbGsvcmVuZXNhcy9yZW5lc2FzLWNwZy1tc3NyLmgNCj4gPg0KPiA+ID4gQEAgLTEzMCw3ICsx
MzUsNyBAQCBzdHJ1Y3QgY3BnX21zc3JfaW5mbyB7DQo+ID4gPiAgICAgICAgIHVuc2lnbmVkIGlu
dCBudW1fY29yZV9jbGtzOw0KPiA+ID4gICAgICAgICB1bnNpZ25lZCBpbnQgbGFzdF9kdF9jb3Jl
X2NsazsNCj4gPiA+ICAgICAgICAgdW5zaWduZWQgaW50IG51bV90b3RhbF9jb3JlX2Nsa3M7DQo+
ID4gPiAtICAgICAgIGJvb2wgc3RieWN0cmw7DQo+ID4gPiArICAgICAgIGVudW0gY2xrX3JlZ19s
YXlvdXQgcmVnX2xheW91dDsNCj4gPg0KPiA+IFNlZW1zIGxpa2UgeW91IGZvcmdvdCB0byB1cGRh
dGUgdGhlIHN0cnVjdCdzIGtlcm5lbGRvYyBmb3IgdGhpcyByZW5hbWU/DQoNCk9vcHMuIEknbGwg
dXBkYXRlIGl0Lg0KDQo+IFdpdGggdGhhdCBmaXhlZDoNCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5
dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQoNClRoYW5rIHlvdSBmb3IgeW91
ciByZXZpZXchDQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCg==
