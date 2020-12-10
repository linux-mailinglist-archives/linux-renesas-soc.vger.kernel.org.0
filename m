Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7C302D52A7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 05:13:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732306AbgLJEKw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Dec 2020 23:10:52 -0500
Received: from mail-eopbgr1400109.outbound.protection.outlook.com ([40.107.140.109]:61504
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730328AbgLJEKp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Dec 2020 23:10:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O0qdCCIWT0a7Zxn69qdjjPIbhAqjAtZv2HxkPX+irPdpwHVvNLFpUFciFwFsyoniyA3ukisRMdDAszgWDIupwDLK0SJo9p6xIPn9+iVdiqBLCb8JPe4+e47RsXn4Or/G3uZ1HeGDR4Mz/bXNYpE7UMRCWAtLZqQwLS2SmIAyuxs3yr+Gg58D5QPjyvq2L+tGxasioBz3wlkXDesRhD95gvgDxk2A+wR5J9KEw1GVeL6rs8nxJb+ITfyhhXZmBeLFHJxMK2sYCvZs7MowI/UvcvMtT6uoZT8O8uXyRq1lXC5RNUPz23r8ZVRw63rWTO2ePtJr8uCSILSzuuVy1UTu/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x4a9dOKAlaNSR6gEOhIphNxXBnSgQhD7PDXHAAqJ44Y=;
 b=Bb6vlwTiRiWnV0fGnzWvjZfNJoWhhkNBQf6ZLOY7kMBqd+x+8AJ3VVEu3uMhLsT0OVJM5xJ7dGXHpWMGFus+P5nDuvLNM766bfKkGTHV/61yDyLzCLA7xbQrL7kVqcMXphpqVupCHYDqdiZ9RoPdRZKap1rbSq2wm7s0MxgiPp2hi2CmEjp14uDbjtlhm6ua4QIzvegaZBS+HcrOAT7qAwVBOsmt+DlH0t/hx6e6hU90Jbr7xVbNKhG7YtLmGq2sgbbMeX0HTzMXWMzxDSiW6Z0cex+AEogaaHGwwS1U04K3+4uvf1yEr0Eqas8eXZvPDzSW8BJLxa6sbG9mts0U3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x4a9dOKAlaNSR6gEOhIphNxXBnSgQhD7PDXHAAqJ44Y=;
 b=SfsegKpEkra6kF8kvMTYkdOSC1PPXlvDvA9QmGCm+wIN/JWV3VwOic5uHyAOnH6j8QDveOmgGiCWuO0YXqDDciraxpbW3zErKK2OSifLTVl3cx6k3+fyhZajORbDFZKnvmYgoJvpIs1UGk9+pRjGD3hDbrMoAbNj3WkYp7ersEk=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB4670.jpnprd01.prod.outlook.com (2603:1096:404:12e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Thu, 10 Dec
 2020 04:09:55 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037%5]) with mapi id 15.20.3654.015; Thu, 10 Dec 2020
 04:09:55 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/3] mfd: bd9571mwv: Make the driver more generic
Thread-Topic: [PATCH 2/3] mfd: bd9571mwv: Make the driver more generic
Thread-Index: AQHWzTi2+Q7ca7X5Rkq3LYc4whtPtKnuwzQAgAD0SbA=
Date:   Thu, 10 Dec 2020 04:09:55 +0000
Message-ID: <TY2PR01MB3692C55C6CDEFC83D6F8F90DD8CB0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1607414643-25498-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1607414643-25498-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXr1kDaXF7FFowq5CSVHzyima2fbF1fJUOowUEb88dOTA@mail.gmail.com>
In-Reply-To: <CAMuHMdXr1kDaXF7FFowq5CSVHzyima2fbF1fJUOowUEb88dOTA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:70b3:188b:a9ac:357d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: dee8bca2-ad32-4d6d-8e3a-08d89cc173b1
x-ms-traffictypediagnostic: TYAPR01MB4670:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB46707A50BD060BFF7100F29CD8CB0@TYAPR01MB4670.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +GxIK+xoryMLz+IPpYlI4i0tzf/Lh7jxN1wHdbYJztMp4kSg2xD8OAKLzTrvN3DceFOZ0bjNDb3JY3AHBP6ONDDyHpOx8WRgrWpMr0V10RzVkYjGksYhPbNsnl38bPIl6ZnRsnEKCpI7OiaFfoQiE4I4AP+lU7jNhlOsxFqRSi0ehKuiAAwtlE+VDfyRq0glmSGdourZgNj7pdkzj6HFpL1nQdueV5PU630Uatd/cJe3dn2982aMFlxOU547LfROuA/1D6LvRPXwWwJXQvPpNt7v05hogpHZ9GhOe4thmEVDKjpUn9gNal607K1NaHo6R8Ok0bF1c/SUax8uJL7sM7WLSn+9+5Q9vPKKeVPajYvhxihETLoTO9bR98BGb/v6
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(346002)(55016002)(76116006)(7696005)(6916009)(8936002)(71200400001)(9686003)(6506007)(53546011)(186003)(83380400001)(5660300002)(508600001)(8676002)(86362001)(54906003)(33656002)(66946007)(4326008)(66476007)(66556008)(66446008)(64756008)(52536014)(2906002)(41533002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?OTJLdlBXUW9JSWFNUDJVWFpMaUNRQjhaT0djZlk2emtTRzlhNUlWSUtFMkR6?=
 =?utf-8?B?aWdwU1BNWDdLTnB1ZTQzd3ZURlVmeCtNUHVBT0xiVnMyYktsWEE5Nmxac1U4?=
 =?utf-8?B?cTgyQURaMFhzbU1ZQVRCZTd0WHhmVTJuTytIVitpVlBzUXFVcUNXVmlSS25s?=
 =?utf-8?B?NjYvZkFiNFBSSjh0bCtFUDJtRHhLM1hrSW1LNUkrQnJyT3VSc1BlYzN4dXc2?=
 =?utf-8?B?WDBtUTVHSTJ2cDQzQjJlSjhUTm1ZVHZqVUkyalBEMnRTN2IyRW5teFV6VytL?=
 =?utf-8?B?YjRZREJrNlgvZEFJUVRpQjhxSEdadW1IWmhBS2JTbDBmeUFHWmVPN1ZQR1Fh?=
 =?utf-8?B?ZFF5eWgzU1VTaTVITUdOSEY0NEVBZDBuUkNxYmhEVWV1TjFRdXIxMm9QV2Uz?=
 =?utf-8?B?a0JVSDFUV2RNT2lNM1Zmbi9CWnRBQ3Eydm1tSFdURVZBZ1hPVS9iTEIyZWEv?=
 =?utf-8?B?ZXU4a1dVNXVJUStjYzFMWlhlb0xadlJwTDNvRnVkYXBCMlE5dHc2S0VCTzRH?=
 =?utf-8?B?SXFNVjM3U2syaVRLTjJzM0FrL2xRMmppZTdWd2tqL2FYNjRLdkwzQXhWYzMv?=
 =?utf-8?B?WXZ2Qy9NaHA0VVVydEVRbFRUNVROSWZ6UzZ6dlZvL3N5cjZuYkF5TE1aRWpo?=
 =?utf-8?B?c0orNWNEQnA4L2lFdlc1V0ZESlN0U0pjZTRNeDRTQUZlY3ZqSXRmelJHTTVO?=
 =?utf-8?B?V00zUTVTSmlRMlNsVUtoR244SjVQZFo4U3BObXF2QW9vVUdZSmRJbmFaUXdY?=
 =?utf-8?B?UHB0cjBsSWRPdkhrOVh6R0YvM0hSZzNsRVlsamw3Vmo0N0NmbFA3Z0tJUG1j?=
 =?utf-8?B?ZVgxZjJxeER5UE9SenpocXZocVZWNm0zOGpWQmJScVVhQ2lNS280Y1hvNkFj?=
 =?utf-8?B?eFNOZHB1NStQbnA3M2N3RnVSaFpNdTdRSDVJNFZEdGFPeU41bmpXeExEYTdu?=
 =?utf-8?B?OEMrQnJVVE95aUhDanJvOXRWTHdkaUF3RllXL0Y1bThvN1p2Z2dnOU83TG44?=
 =?utf-8?B?Q0RhMDNtMGk3eWJUcG96YVlvY1RZMnQrNitKK3ZvM21TVVQ4UUhrZG91NTVx?=
 =?utf-8?B?OU84S1h1SFBFSi9oWDNBckwwMEcrbjB0YWhJVUcvTGcxc0FvaEZobWJzdmY2?=
 =?utf-8?B?OVA2RjRoMkloSWZrR29Hc1Nkd093RVRRV0xhMFVoNk1yVVFYVVZXVTFHZ21S?=
 =?utf-8?B?aFNuMlVUTWdjWlV0RFBUMjBVeExXQ2M2WXVtbnZjc3VzZittYjVmQ0ZZeGV4?=
 =?utf-8?B?U3JCbXpZTUVjYkpYSGR2UXZraVZudGhQQzdaUDNXM3U1WXhmWlNlcjlmL1cw?=
 =?utf-8?B?VzBadjg0VTJ3QzlRa01jZ29yeTVHTy8rNG5kbFNpRVY4N2Nrd0tYSDhSM1ND?=
 =?utf-8?Q?CQ5f1XINuW4FZcICKeJ2+QBB8B+vDDzw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dee8bca2-ad32-4d6d-8e3a-08d89cc173b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2020 04:09:55.5722
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5+yvpQMwOvh8GBDfWdWwc4qy/H6Wb9Fhs8OX9J7UfYJTZmg8jC8hqrcckjl+CV4Yg1DG8/hX1U/vtYInibNGrDvnM6HVztjUconXJv5DOI0FDU5z0kKx8FxZWfcjbR5Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4670
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0KDQo+IEZyb206IEdl
ZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogV2VkbmVzZGF5LCBEZWNlbWJlciA5LCAyMDIwIDEwOjI2
IFBNDQo+IA0KPiBIaSBTaGltb2RhLXNhbiwNCj4gDQo+IE9uIFR1ZSwgRGVjIDgsIDIwMjAgYXQg
OTowNiBBTSBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNh
cy5jb20+IHdyb3RlOg0KPHNuaXA+DQo+ID4gaW5kZXggODBjNmVmMC4uNTdiZGI2YSAxMDA2NDQN
Cj4gPiAtLS0gYS9kcml2ZXJzL21mZC9iZDk1NzFtd3YuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWZk
L2JkOTU3MW13di5jDQo+IA0KPiA+IEBAIC0xMjcsMTMgKzEzNywxMiBAQCBzdGF0aWMgaW50IGJk
OTU3MW13dl9pZGVudGlmeShzdHJ1Y3QgYmQ5NTcxbXd2ICpiZCkNCj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICByZXQpOw0KPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiA+ICAg
ICAgICAgfQ0KPiA+IC0NCj4gPiAtICAgICAgIGlmICh2YWx1ZSAhPSBCRDk1NzFNV1ZfUFJPRFVD
VF9DT0RFX1ZBTCkgew0KPiA+ICsgICAgICAgLyogQ29uZmlybSB0aGUgcHJvZHVjdCBjb2RlICov
DQo+ID4gKyAgICAgICBpZiAodmFsdWUgIT0gYmQtPmRhdGEtPnByb2R1Y3RfY29kZV92YWwpIHsN
Cj4gPiAgICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJJbnZhbGlkIHByb2R1Y3QgY29kZSBJ
RCAlMDJ4IChleHBlY3RlZCAlMDJ4KVxuIiwNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICB2
YWx1ZSwgQkQ5NTcxTVdWX1BST0RVQ1RfQ09ERV9WQUwpOw0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgIHZhbHVlLCBiZC0+ZGF0YS0+cHJvZHVjdF9jb2RlX3ZhbCk7DQo+ID4gICAgICAgICAg
ICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ICAgICAgICAgfQ0KPiANCj4gUmVhZGluZyB0aGUg
cHJvZHVjdCBjb2RlIHJlZ2lzdGVyLCBhbmQgY2hlY2tpbmcgdGhlIHByb2R1Y3QgY29kZSB2YWx1
ZQ0KPiBjYW4gYmUgcmVtb3ZlZCwgYXMgYmQ5NTcxbXd2X3Byb2JlKCkgaGFzIHZlcmlmaWVkIGl0
IGFscmVhZHkuDQoNCkluZGVlZC4gSSdsbCByZW1vdmUgdGhpcy4NCg0KPiA+IEBAIC0xNTAsNiAr
MTYwLDcgQEAgc3RhdGljIGludCBiZDk1NzFtd3ZfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNs
aWVudCwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBpMmNfZGV2
aWNlX2lkICppZHMpDQo+ID4gIHsNCj4gPiAgICAgICAgIHN0cnVjdCBiZDk1NzFtd3YgKmJkOw0K
PiA+ICsgICAgICAgdW5zaWduZWQgaW50IHByb2R1Y3RfY29kZTsNCj4gDQo+IE5vIG5lZWQgZm9y
IGEgbmV3IHZhcmlhYmxlLi4uDQo+IA0KPiA+ICAgICAgICAgaW50IHJldDsNCj4gPg0KPiA+ICAg
ICAgICAgYmQgPSBkZXZtX2t6YWxsb2MoJmNsaWVudC0+ZGV2LCBzaXplb2YoKmJkKSwgR0ZQX0tF
Uk5FTCk7DQo+ID4gQEAgLTE2MCw3ICsxNzEsMjUgQEAgc3RhdGljIGludCBiZDk1NzFtd3ZfcHJv
YmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwNCj4gPiAgICAgICAgIGJkLT5kZXYgPSAmY2xp
ZW50LT5kZXY7DQo+ID4gICAgICAgICBiZC0+aXJxID0gY2xpZW50LT5pcnE7DQo+ID4NCj4gPiAt
ICAgICAgIGJkLT5yZWdtYXAgPSBkZXZtX3JlZ21hcF9pbml0X2kyYyhjbGllbnQsICZiZDk1NzFt
d3ZfcmVnbWFwX2NvbmZpZyk7DQo+ID4gKyAgICAgICAvKiBSZWFkIHRoZSBQTUlDIHByb2R1Y3Qg
Y29kZSAqLw0KPiA+ICsgICAgICAgcmV0ID0gaTJjX3NtYnVzX3JlYWRfYnl0ZV9kYXRhKGNsaWVu
dCwgQkQ5NTcxTVdWX1BST0RVQ1RfQ09ERSk7DQo+ID4gKyAgICAgICBpZiAocmV0IDwgMCkgew0K
PiA+ICsgICAgICAgICAgICAgICBkZXZfZXJyKCZjbGllbnQtPmRldiwgImZhaWxlZCByZWFkaW5n
IGF0IDB4JTAyeFxuIiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBCRDk1NzFNV1ZfUFJP
RFVDVF9DT0RFKTsNCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gPiArICAgICAg
IH0NCj4gPiArDQo+ID4gKyAgICAgICBwcm9kdWN0X2NvZGUgPSAodW5zaWduZWQgaW50KXJldDsN
Cj4gPiArICAgICAgIGlmIChwcm9kdWN0X2NvZGUgPT0gQkQ5NTcxTVdWX1BST0RVQ1RfQ09ERV9W
QUwpDQo+IA0KPiAuLi4gYXMgeW91IGNhbiBqdXN0IGNoZWNrIGlmIHJldCA9PSBCRDk1NzFNV1Zf
UFJPRFVDVF9DT0RFX1ZBTCBoZXJlLg0KDQpJIGdvdCBpdC4NCg0KPiA+ICsgICAgICAgICAgICAg
ICBiZC0+ZGF0YSA9ICZiZDk1NzFtd3ZfZGF0YTsNCj4gPiArDQo+ID4gKyAgICAgICBpZiAoIWJk
LT5kYXRhKSB7DQo+ID4gKyAgICAgICAgICAgICAgIGRldl9lcnIoYmQtPmRldiwgIk5vIGZvdW5k
IHN1cHBvcnRlZCBkZXZpY2UgJWRcbiIsDQo+IA0KPiAiVW5zdXBwb3J0ZWQgZGV2aWNlIDB4JXgi
Pw0KDQpJJ2xsIGZpeCBpdC4NCg0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHByb2R1Y3Rf
Y29kZSk7DQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiAtRU5PRU5UOw0KPiA+ICsgICAgICAg
fQ0KPiANCj4gVGhlIGNvbnN0cnVjdCBhYm92ZSBtYXkgYmUgZWFzaWVyIHRvIHJlYWQgYW5kIGV4
dGVuZCBieSB1c2luZyBhIHN3aXRjaCgpDQo+IHN0YXRlbWVudCwgd2l0aCBhIGRlZmF1bHQgY2Fz
ZSBmb3IgdW5zdXBwb3J0ZWQgZGV2aWNlcy4NCg0KSSB0aGluayBzby4gSSdsbCBmaXggaXQuDQoN
Cj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L21mZC9iZDk1NzFtd3YuaA0KPiA+ICsrKyBiL2luY2x1
ZGUvbGludXgvbWZkL2JkOTU3MW13di5oDQo+IA0KPiA+IEBAIC04Myw2ICs4NSw4IEBADQo+ID4N
Cj4gPiAgI2RlZmluZSBCRDk1NzFNV1ZfQUNDRVNTX0tFWSAgICAgICAgICAgICAgICAgICAweGZm
DQo+ID4NCj4gPiArI2RlZmluZSBCRDk1NzFNV1ZfUEFSVF9OVU1CRVIgICAgICAgICAgICAgICAg
ICAiQkQ5NTcxTVdWIg0KPiANCj4gQkQ5NTcxTVdWX1BBUlRfTkFNRT8NCg0KSSdsbCByZW5hbWUg
aXQuDQoNCj4gPiArDQo+ID4gIC8qIERlZmluZSB0aGUgQkQ5NTcxTVdWIElSUSBudW1iZXJzICov
DQo+ID4gIGVudW0gYmQ5NTcxbXd2X2lycXMgew0KPiA+ICAgICAgICAgQkQ5NTcxTVdWX0lSUV9N
RDEsDQo+ID4gQEAgLTk2LDYgKzEwMCwyMCBAQCBlbnVtIGJkOTU3MW13dl9pcnFzIHsNCj4gPiAg
fTsNCj4gPg0KPiA+ICAvKioNCj4gPiArICogc3RydWN0IGJkOTU3eF9kYXRhIC0gaW50ZXJuYWwg
ZGF0YSBmb3IgdGhlIGJkOTU3eCBkcml2ZXINCj4gPiArICoNCj4gPiArICogSW50ZXJuYWwgZGF0
YSB0byBkaXN0aW5ndWlzaCBiZDk1NzFtd3YgY2hpcCBhbmQgYmQ5NTc0bXdmIGNoaXANCj4gDQo+
IC4uLiBkaXN0aW5ndWlzaCBiZDk1N3ggdmFyaWFudHM/DQoNClRoYW5rcy4gSSdsbCBtb2RpZnkg
aXQuDQoNCj4gPiArICovDQo+ID4gK3N0cnVjdCBiZDk1N3hfZGF0YSB7DQo+ID4gKyAgICAgICBp
bnQgcHJvZHVjdF9jb2RlX3ZhbDsNCj4gDQo+IHVuc2lnbmVkIGludD8NCg0KV2UgY2FuIHJlbW92
ZSB0aGlzIG1lbWJlci4NCk9yLCBrZWVwaW5nIHRoaXMgbWVtYmVyIGFuZCB0aGVuIHdlIGNoZWNr
IHRoZSBwcm9kdWN0IGNvZGUgYnkgdGhpcyBtZW1iZXINCmluc3RlYWQgb2Ygc3dpdGNoKCkgbGlr
ZSBiZWxvdz8NCg0KLyogTm8gYnVpbGQgdGVzdCwgSkZZSSAqLw0Kc3RydWN0IGJkOTU3eF9kYXRh
ICpkYXRhX2FycmF5W10gPSB7DQoJJmJkOTU3MW13dl9kYXRhLA0KCSZiZDk1NzRtd2ZfZGF0YSwN
Cn07DQoNCmZvciAoaSA9IDA7IEkgPCBBUlJBWV9TSVpFKGRhdGFfYXJyYXkpOyBpKyspIHsNCglp
ZiAodmFsID09IGRhdGFfYXJyYXlbaV0ucHJvZHVjdF9jb2RlX3ZhbCkgew0KCQliZC0+ZGF0YSA9
IGRhdGFfYXJyYXlbaV07DQoJCWJyZWFrOw0KCX0NCn0NCg0KPiA+ICsgICAgICAgY2hhciAqcGFy
dF9udW1iZXI7DQo+IA0KPiBwYXJ0X25hbWU/DQoNClllcywgSSdsbCBmaXggaXQuDQoNCj4gPiAr
ICAgICAgIGNvbnN0IHN0cnVjdCByZWdtYXBfY29uZmlnICpyZWdtYXBfY29uZmlnOw0KPiA+ICsg
ICAgICAgY29uc3Qgc3RydWN0IHJlZ21hcF9pcnFfY2hpcCAqaXJxX2NoaXA7DQo+ID4gKyAgICAg
ICBjb25zdCBzdHJ1Y3QgbWZkX2NlbGwgKmNlbGxzOw0KPiA+ICsgICAgICAgaW50IG51bV9jZWxs
czsNCj4gDQo+IEknZCBzYXkgInVuc2lnbmVkIGludCIsIGJ1dCBtZmRfYWRkX2RldmljZXMoKSB0
YWtlcyBwbGFpbiAiaW50Ii4NCj4gDQo+IFBsZWFzZSBwdXQgdGhlICJwcm9kdWN0X2NvZGVfdmFs
IiBhbmQgIm51bV9jZWxscyIgZmllbGRzIG5leHQgdG8NCj4gZWFjaCBvdGhlciwgdG8gYXZvaWQg
dHdvIDQtYnl0ZSBnYXBzIG9uIDY0LWJpdCBwbGF0Zm9ybXMuDQoNCkknbGwgZml4IGl0IGlmIHdl
IGtlcHQgInByb2R1Y3RfY29kZV92YWwiLg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hp
bW9kYQ0KDQo=
