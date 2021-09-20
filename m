Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00BFB411454
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Sep 2021 14:24:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234184AbhITM0W (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Sep 2021 08:26:22 -0400
Received: from mail-eopbgr1400129.outbound.protection.outlook.com ([40.107.140.129]:29328
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235098AbhITM0V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Sep 2021 08:26:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kDpnXqyvfr3vr+IDXcBHJRL0TiIeNq+DuLa2DFGU5c6qdyqxjyOSWcXGXxxaTX0lzoKD3uNtaVi5lKf863GqYouoKz/ONGUp7XwfHEt53UUoSEOFPhA5WpQQ6iYnWGNJMhtxIrxmgmYjhZPu1I/1QlxKfCnMGgCZm0jyKeg+z3DuZR5hFxqNaAWiRf3A/SAvoUj2lPNSCmrp7lQbDg5jndmiRzOP4sll3gqUDD5JNBGv4te04dapiiI31tSB0mBoCcCTQDrwv4W6JMYIurcPotpdG5qT9gvflrDZvEI4veZNc2px0vH3P1JqGDvBzlUrGmI4eqESqP2scEOELhomWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=7y4VLcJeS7ZAvPAnPCfn8gwQPO3F3jFxnCJglUe05+8=;
 b=b+MrJ1EONgJ5CKeLdwjp/BMtRSKoT3i7Uk3fNcZhvbTICpeL1+CndX/YkOCxIkke1m5l8yTlbVWvmQYiYyaF9p1hWQN9tGzBWlDqyTXLZjXlmNw49dfEsAnU+aVQVGRXklqvnyrAm1WreMxe++5A9dI3a+kMO4NDRjNvMlvRZ/MCPMwHZyI5CxboLdsgdfIja/gR64Rzkn3EbQr2VLR6I6eukMZ/joyey1pqBDUFvqo/Fw8P1qWKnJRouQUGk6MvlqTZ4eI0JcTJ+d+0ZFemEpeDs7TuqdheafskgIjdrfR30XKuRNXy8l3GXvzCmSuwk3X9zBRALQMoyEy0jg5pHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7y4VLcJeS7ZAvPAnPCfn8gwQPO3F3jFxnCJglUe05+8=;
 b=YZY79MdIs1vHrIbJ+JBlf0u96omH6mby7ck8Iy+rV253PhYyWBiCT0m/0uFiqz3CAqFpmIiIryRF5qckdxTVEud4tzocyG8HFP5n1ts2pwF8n673m/EDrDl898iSQnpaECaT1fO53SIpBsAsVHv34QsIJxo40ocOfGcCV0WT8dY=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB2929.jpnprd01.prod.outlook.com (2603:1096:603:38::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Mon, 20 Sep
 2021 12:24:52 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::6532:19dd:dfa1:4097]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::6532:19dd:dfa1:4097%9]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 12:24:52 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?utf-8?B?R3VpZG8gR8O8bnRoZXI=?= <agx@sigxcpu.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Michael Walle <michael@walle.cc>, Nishanth Menon <nm@ti.com>,
        Douglas Anderson <dianders@chromium.org>,
        Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/2] arm64: defconfig: Enable SND_SOC_WM8978
Thread-Topic: [PATCH 1/2] arm64: defconfig: Enable SND_SOC_WM8978
Thread-Index: AQHXrgNhT3eSExc3EU2j+9TtTK1f4quszfMAgAAKcbA=
Date:   Mon, 20 Sep 2021 12:24:51 +0000
Message-ID: <OS0PR01MB5922C56C2E612CA39564E53A86A09@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210920093905.10878-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdWpws8uknhX00PyaAN+GjD0_Uc-zaBaVdYKkpTnqTsarw@mail.gmail.com>
In-Reply-To: <CAMuHMdWpws8uknhX00PyaAN+GjD0_Uc-zaBaVdYKkpTnqTsarw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a6ae31d-7197-48a7-1225-08d97c31a56d
x-ms-traffictypediagnostic: OSAPR01MB2929:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB29293FE8AD91893071056E3D86A09@OSAPR01MB2929.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ESZA7REvEDs/e1RIpaEnq+0n+b8OR9JK1NhjSRoU3H08r+VhkvlkfQnr04grrXDDOhnJinNGcffg7qhM70mVL3WAxzxva9Cb3/iCgLI3sqog+I1qsAklKaOMX4nqef8sJOIPDc0ZKJrWhir4mZtoJTSTmZ9wZ4eoKDmaoHglF4lMZnwk3hHwkhI5HJIUAS+nVpkCwZ89bGyDZn098QO6VTM6YGnTzfSq78iDxFItTPJDXLKSOQhY6kuh7mm1+UyKZjJI6cN1iy8Cpuueik9gqE4Ie+q/pTPx+P03B9Ds/AQOgvcIE5T02QRyQTD0pVScT+3PIF0j1ckCCrqVuAL93Bp+DzA+Al8J1OLtqWLOuMTBgu+FV4/McZUVxzZQ0Q237cURzz7DO2VqHezC+Yx9I40SIyTnLfo7TeJH3Vl/v1HOkJD3Op/nE3lXV9fEEWREOtF6RLmyPr5ygDxZS+3OsYwe+GIz370ElIYHj5wCADZNZ5GQFQtuMenZp8k4ddtE85rUNdY1jTKUs2+IPQIsDapiIR441Vw75HDFzkGkhr1Eo9FwQ8gDn50oa3U1QRwp8vtF6xxsUeLXX47hrzNxLCUrJu4vi7fpzmAlHb0m/u/OQ4DjSAu3tkS41r2f5d/pqwMleepYsRfDGV5vQw9hKqY4BFsh0zuaxqCvUz3BPQS2YM9r88xFqWI8Q+wIpdhDJa4UdEyahvjjJ0SBSbLPwQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(376002)(366004)(396003)(8936002)(52536014)(38100700002)(122000001)(7696005)(66556008)(2906002)(186003)(33656002)(66476007)(86362001)(4744005)(26005)(66946007)(7416002)(8676002)(53546011)(54906003)(4326008)(66446008)(64756008)(6506007)(38070700005)(5660300002)(6916009)(71200400001)(478600001)(76116006)(9686003)(316002)(55016002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MWwyTWNGSDJZanVlZkFTU3k0M0hDQnc4ZkpyTW01b01SU3RtdU1UTXFnaGZp?=
 =?utf-8?B?emxGV1VJWkZybnVrMmNtZzZiSi9WclNHRmdJWWNlUjNrV28zeU1sbGV2OUhl?=
 =?utf-8?B?QlozM2VnV3U5NVI4azJwVHFIVEQySjZFcUhuajZkeFRSK2ZkNmdlYlZlbmlk?=
 =?utf-8?B?Z0FvZTlIaFFiZGN4bklHbEVXWU5tNHZ5alcweEhaTlRyd2V6eTVJdEFDRGpE?=
 =?utf-8?B?UHdESklyR3NsWUhrYU9zdUJTMllxTjQwUlF4cWpGK3RkTFE3Z0M4ZTJSOXpS?=
 =?utf-8?B?ZGVtZWZ2aHBGUnVMOXpNUmNyVGVBNmdtaHNnVUh0TjNISDlNTnN6K09Ramx1?=
 =?utf-8?B?N1NZcnVuNGhVOURyazJmdjBHb0g3bmlINTJURkIrTFVSelZGMjlTV1pUOVU4?=
 =?utf-8?B?K21RWXRmK1FsQVZPQnp0MzNpbjNkMU41VWN4UGg0Y0RxOW1EMEdCMkcvdENh?=
 =?utf-8?B?NW02UGY4cEtnTU1UZ1RDNEFVM1AwNzZTVWZMV2hjSFlYSmxPTzlPNHZvK3lK?=
 =?utf-8?B?REo0djJTSjJMNUpLN2RGaHdkditrdzNwVEJBWEVqcjJ0ZGVuY1FuYVFaYlk5?=
 =?utf-8?B?UjI3dHo4Q01GbWs4ejBhc3RsMXFhSXVJemNqWTZqS3ZTcEZEWGNwcVVjc2Jp?=
 =?utf-8?B?aGxNd2JxTWttQ0ZpZUpDS3VyanlvSk9DOEhDNTJMcHV6VVpmR3NHakpFUm5x?=
 =?utf-8?B?VTVBeTdGMXIzblJZbGZFeXFyUU1YQnppOHh6b3dMZzJxZnRFb25yRU1LKzJW?=
 =?utf-8?B?Q3RHUUR6RWZLQnRsdW0rMlBnQTd0b2s1V1Z0amZnaEo4bzB6Yk9od0w3UWhE?=
 =?utf-8?B?b0RyalNMQzd6UVRtVlRabUdWT2NUQkVRcnBOQ0FqamJGdHBjTjk0cXN2YVZP?=
 =?utf-8?B?S0o4SCtrT2NwYkhKR2tWMXhITXhRMThQenhFTHBDUGxCS0RNa3htbm1vMGo3?=
 =?utf-8?B?YTFnUlE5UmV4WXA4Z2ZwUUhGVnJMdUdldTNkck1PZk1aN2QrWjV1WjJuOWFm?=
 =?utf-8?B?OVdvMndSZjdYQWpRSEh5SnpDUDRiMU9lQW44Vi9NSG9yTEdkc0pOR3VWRmFS?=
 =?utf-8?B?d3IvdWEzMVJLMlpVNnd1RitsRlVIbVJ0WE5NUExxell2Ym4wVnZJckFtTDAv?=
 =?utf-8?B?R3g3Ky9UOSsrdFhXdk8xNXFTMHdDQnZ3K01MRlVpbVc4d1hMdHhsVmZadjB0?=
 =?utf-8?B?NnVuZk5Wd3ZLMytEYWRFS0RxYkpCMmJqNzRJWmFFMFJDTzY2aTN3aUxhek9H?=
 =?utf-8?B?Z05kc0UxMTFWTk5wbExKdHliWHBJSTBjSjlIM2pVVmE5RTIvM0s2ZnB6R2h1?=
 =?utf-8?B?TUZhN2FNNk1DSFdtL3UyZHA3bytUQTJnM0tzM0VkSWNwWGZYazVKS0pnM3JF?=
 =?utf-8?B?UTl6MUVmZW9yMDJOVmpCeDFKNkRscXFiSGRTOE5iTnZJaU9TRXREcnIvaUdv?=
 =?utf-8?B?bnNNSDB4b0tWZWRGdFdUSFlaNzFTZ3RaUzVBRWQ0ajRYQkYzQWIyUUw1aDho?=
 =?utf-8?B?M09JWDlrKzVlaWE5aG1US0JGbmdSaW8wdXVkVVBUdnpBMlFPWFhkK1pKcFdx?=
 =?utf-8?B?NGg2dy9kcGk3Rkk4RHhxLzdnRVdUVFB5WE5kU0liOEJWVjJkeFczaE4zTlA2?=
 =?utf-8?B?RlZERjA1akROcnIyUFArb2Y5YzhHWHM2UnhtdWt2UjcyUklTQkdVTVlqSnVv?=
 =?utf-8?B?MHVWNXIzRE4xWjEwMzh5YkkzQ0pjL3VSZklVelV6YVRoRGJhczl5OCtERk1k?=
 =?utf-8?Q?5gPD5g/QxpZmiNQrbbu6MU8AEOYNVQ1Woae5oem?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a6ae31d-7197-48a7-1225-08d97c31a56d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2021 12:24:51.9071
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bsRBuQOYvmE7wWfBmWXpufY8/He9v63Hl5sywdrHVJ9Y+oOmjNIPp3Gtd8J/iiQ8uBJl/m4Ow6fcJNtqCWDHRRwL+xRNZinE9GTM2k2AwFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2929
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMS8yXSBhcm02NDogZGVmY29uZmlnOiBFbmFibGUgU05EX1NPQ19XTTg5NzgNCj4gDQo+
IEhpIEJpanUsDQo+IA0KPiBPbiBNb24sIFNlcCAyMCwgMjAyMSBhdCAxMTozOSBBTSBCaWp1IERh
cyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+IFdNODk3OCBhdWRp
byBDT0RFQyBpcyBzdXBwb3J0ZWQgb24gUlovRzJMIFNNQVJDIEVWSy4NCj4gPiBFbmFibGUgaXQg
b24gYXJtNjQgZGVmY29uZmlnIGFzIG1vZHVsZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91
ciBwYXRjaCENCj4gDQo+IExvb2tzIGdvb2QgdG8gbWUsIGJ1dCBJIHdvdWxkIGxpa2UgdG8gZGVm
ZXIgdGhpcyB1bnRpbCB0aGUgUlovRzJMIFNNQVJDDQo+IEVWSyBEVFMgY29udGFpbnMgYSBkZXZp
Y2Ugbm9kZSBjb21wYXRpYmxlIHdpdGggIndsZix3bTg5NzgiLg0KDQpTdXJlIC4gVGhpcyBwYXRj
aCBpcyByZWFkeSB3aXRoIHJlbmVzYXMtZGV2ZWwuIEN1cnJlbnRseSBpdCBpcyB1bmRlciBpbnRl
cm5hbCByZXZpZXcuDQpXaWxsIHBvc3QgdGhpcyBwYXRjaCB3aXRoIG4gY291cGxlIG9mIGRheXMu
DQoNClJlZ2FyZHMsDQpCaWp1DQoNCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZl
biAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+
IG02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2Fs
IHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4NCj4gQnV0IHdoZW4gSSdtIHRhbGtpbmcg
dG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nDQo+IGxp
a2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2
YWxkcw0K
