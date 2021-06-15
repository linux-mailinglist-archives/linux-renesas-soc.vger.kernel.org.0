Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57B453A78D6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Jun 2021 10:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230497AbhFOIO2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Jun 2021 04:14:28 -0400
Received: from mail-eopbgr1400092.outbound.protection.outlook.com ([40.107.140.92]:47856
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231165AbhFOIO1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Jun 2021 04:14:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nTCSwgOebjP15G+NN2YGbjy00KyONzwRMSeXuxJ0k1YBThob8/4a7R86EPIqTj8910E3Er4Rmy50BAMDaD5BablbDYhT4dNkvAnQPd+KXSQ8gUrFo964oTa5PoWr4GbBGEImyIkp4Oj5B4XAiGJ0yJWl205dBiZswaVPbmTd4N8jKtofB/aaL7niK5b9MusFHFK1tB7tv5HXxywyGIYaZ63IHc+cFPSFBtMfBp/ip/n7zzR3YF1hYLMgmBIdAwTlXMWt2kuWpehbzoZ6e+oaeSzh3bZgjuzL3aYfNljtmdfj0Ns/Vnd9g6gUbPHs2bbxhP50BLtaL35Xf7c+fZzJ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YHO1SkXVSLz069zskf7Fs4jgNJwUkaxDcDoIaW/AJnk=;
 b=GOGOZ85QVOWA4VUE6gv/jNq6wCD/blsvCeMuHcsO9XK0oEnWQjZUXraM1cr78NtfnPwZoN6kCoglEjjCkUdCzjqNpI2mkPWq7lUGSpc+b9G7sNT6JtzwiSWNBsWXhd8VfNcoFRlk/ZxowQmTtkLt0avikyITr1mYUyb84liz8zuhBU7KJDXfoYCggaipbGegzKp6/UvsJk1vXwuX/2KxGvi0zDjoE9iSic8fMBdKHaLaK1vFiE1F1GtMWKq0Vt6q6xBYMs+8GXW19ecjXWWwnz06ZdAT+6rMNTMt2qRdTrHiaEJjmpa+DelPk9NHFVp2j396zVRV0hp4TR7rl1vn7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YHO1SkXVSLz069zskf7Fs4jgNJwUkaxDcDoIaW/AJnk=;
 b=GrPTY6JRitSNdqvOjZiB2M7VbGxCxSCRZoGYnVrSQ28ijxsxVkwmAmPvCVaIykPtZw1OcYngiqI84TXlQcWwAKDhULy2+Eg+W+/JVWlx8Z6CGDBx342RXkLN1sQ9n9IzeLuYciSVkaH8Zbh9hwQB7709xMgmMFD08RylcwTzeUs=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB6616.jpnprd01.prod.outlook.com (2603:1096:604:fe::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Tue, 15 Jun
 2021 08:12:20 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0%3]) with mapi id 15.20.4219.025; Tue, 15 Jun 2021
 08:12:20 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: RE: [PATCH 4/5] arm64: dts: renesas: r9a07g044: Add DMAC support
Thread-Topic: [PATCH 4/5] arm64: dts: renesas: r9a07g044: Add DMAC support
Thread-Index: AQHXXrYYZ8Bj5roVmEW5XFhdZ1mt8KsTcJeAgAAL9YCAAA3SgIABM8vg
Date:   Tue, 15 Jun 2021 08:12:19 +0000
Message-ID: <OS0PR01MB5922D9B6D0DC133CB5BDB64386309@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210611113642.18457-1-biju.das.jz@bp.renesas.com>
 <20210611113642.18457-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdUthmAbwNrBKeEBzqBUN6HYR=Fuz5ALpK+iGY_kUQpV1A@mail.gmail.com>
 <OS0PR01MB59227529257477835867FEFA86319@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdX2CR=3wpQbAXsmCBw=jWy7OQG7ur0MhTxaoVkz413Jcg@mail.gmail.com>
In-Reply-To: <CAMuHMdX2CR=3wpQbAXsmCBw=jWy7OQG7ur0MhTxaoVkz413Jcg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [86.139.26.177]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 68202e82-7303-49cd-e4f7-08d92fd54c2a
x-ms-traffictypediagnostic: OSZPR01MB6616:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSZPR01MB6616122903003B67EAF5232186309@OSZPR01MB6616.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +sJP0cJ6ePCdU56jNn1TzzJRDyojRtWJYghXcc4GnY2tc8YKQQe5n4SAWFEOkrOCxtLvpoV6NdgFFYSAF/Eu3eNgFCyfRmEyI15z8exUuFgjQToYFDcpVacqFpsM2DrImAEKJPDao8dL76iSvzLlGfru9xcbsMcksbw/rzQplJ+UyUUYvy2gL9TOHNIkmUkDBuKTo3Hjd7yRFH15mxXr7bK/dO0cWRLJemnj1lM2FexRJHKT5cZvINaWbyBcfTG0xCB9NHq87o6PZUsk4JTR788clyHfBeGwcNrQfdrWBh1JIB2wM601Rs4wQntv79FnVPU+1kdDlCUHFTC2L1OG76QQnxfhhrZyuR6KT1KPKV92Uss6ROhSJYHz2VbWVxXSt+hIeMr96bEPmS6IkOfyg0ytZlCTQ1N+kw6zN3Yh+GOSh5eXoNZC0fYL8qUUyX3er96O3nb8m7s9qp6Z0fxY8G1A/Moe6nDgLCQ39q0sQvXFPtR4fnU8Pk9ss0Hu0isJJeKpria9NVqsIsvvKKk3CCGkyqDyCc6eQVshgSOOlGl/EqdGxgb67q9l2kZAnAM1ZmG9KwgpnpV1Jcr906ZXoS7Uh88xV4tiCXvSy9kTF1E=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(376002)(39860400002)(136003)(6916009)(9686003)(66946007)(53546011)(55016002)(33656002)(38100700002)(83380400001)(86362001)(5660300002)(7696005)(71200400001)(478600001)(76116006)(4326008)(8676002)(54906003)(66476007)(186003)(66556008)(122000001)(6506007)(52536014)(26005)(8936002)(66446008)(64756008)(2906002)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3RiMUpjeXk0emlWSzFNK3RDNGNvcHVXVkpHR2hyR2NZREk2T1MwaERIbXlP?=
 =?utf-8?B?UTI3VFlLVTZtVnRBTzhyOXd2bTU4UjJRdGRKTDlYYTJJUk1WQXlpbjFEWS9N?=
 =?utf-8?B?WmVjS1VDTkwwVUNsWVNtMXlEVVFHYU0zclJrT1V3ckhSZDZLUUkwNXRURnFW?=
 =?utf-8?B?MHZGSU54VG9LVnYvWGxtWnZBOHhGeWlPRFVBYXFLT3dqVGZDRVFxblF6WE5Y?=
 =?utf-8?B?bmpxZkxiVlkwNHluM0Y2VDc2OEJTZTk0V2VZbkJTeVBRNHYzQ0JGWEdwTWVa?=
 =?utf-8?B?UDBxN0hzVTJocVpKYUM1YXJyUXg2bnFrdUV0MjVUeTNJcDFNQTJJMmgyUHBX?=
 =?utf-8?B?QWwzWjE3TWluMDlnQ3R3NkpIdjNjdE1zOVRmTnN2SHV4U2FyU3V4K082L2E3?=
 =?utf-8?B?MlhuWnhBOVNHUTJRQTZHRzV3cTByMnFRODlHM2tudXpreVhNNk5TQ0ZUNzRS?=
 =?utf-8?B?OVpXaVNES2VabXlFRFBrbHJuNUZxMGlZVVFNS2ZjSUxhZlBLam9xeGR0VWt2?=
 =?utf-8?B?U09KL1JrM0xXS25pVUdPdDdmanA3WVVXSHBIS205NjBLU1ErRTMwOXF6YjZP?=
 =?utf-8?B?WkI4RkRkQWN3RTVGUlcrVjQxKzRISTJOaEV5a1BGLzd1Mms0MFdpK1ZtVE82?=
 =?utf-8?B?OFdGb3hJNE0zRXVYcXBwb01oSk1sM1dJM0ZKSWRHVGVpa1F1SUFBZVhSMEFm?=
 =?utf-8?B?eVN6SFNFbnFlRGl3dWtOTXRUVXlYS29nOEdBNzNHVlZKeFpKZW9xdW1zU1Fp?=
 =?utf-8?B?cVlGeVZweENKdDhIL2V0M0psZW5DdE1mZjJlRWx5NThiSTFMRHllbEZJRlRD?=
 =?utf-8?B?eHFwbG01cVVzQmNybTk4clF4bnRsR1AxNHVDMzkxRHJrNWpaMWhvelg0MitP?=
 =?utf-8?B?eDgydmh2SWVVWHA4OVF2aEEzTzlWeDlUM3JGcitRMTJCaFl0RE93ZVIwS3Ex?=
 =?utf-8?B?SGFFZDN3OVdGNk5tQWtGQTBjMDllZEg2T1NxT3I3SzZPamdvQUMrRmpBcFJD?=
 =?utf-8?B?dm1xYS9oTmZuMHE2TGZZTm9rVkRWZEdQck5NRjZiRXFqUzQzY2xoTzBMd2Vt?=
 =?utf-8?B?VmErSjhvSGoyNUhBc3BkNlVNdVVBczZabExVNURZQ2RvZU5hN1JzaGt0ZDdX?=
 =?utf-8?B?WEhtMlZKaGppUS8wcmd2aHV6QlhaUGNkcEZ4anQyeWpOd0ZRaUZCYVgyWG1S?=
 =?utf-8?B?MGJ0Ri9JajJJV0FqNGRwVTZGWHp0ajFqb085QXdqZklUZkRwYThPdVpZa1dx?=
 =?utf-8?B?bmZvdEpYZ1dYSEZkaEF5V2pFNDB3L1M4UXpZMmNvelg5ckR3bHVSa251Y1Ev?=
 =?utf-8?B?TDAyck9Mei9KLzlTbmtOSDdKM25uQUxwNFpqVUJLZ1duQkNDazRKSFNOajFN?=
 =?utf-8?B?L1JzbWthZmR1d2g3ZFlIdkRuME95VWFpclNDQktZVHJwcUpVc01hb1FvOEtC?=
 =?utf-8?B?clV2ZTk2emJBM1BmRENTVng4ZjYvWmpPR3hrNitIZG04aHhuOUVqZStFMExK?=
 =?utf-8?B?dXNybFduOHlaMzA2QitGQ2xYYmJEcEFhMTl5cWRVekdFUVZKbXh5TzlZa0lS?=
 =?utf-8?B?VnpzK1pmUEpMb01qRFpyVGhiQ1I2bVhZZzJ0Sy9TU1U2ZmxTUXdKYjFibTEx?=
 =?utf-8?B?clBFd0VMSmUwQUdWdG0wQ3g3a2hxSjZQeDN5ekk2Tk40OUNkMkpLaWl6VSsz?=
 =?utf-8?B?djVXclFldlhSVTFDL0d4eFo2ekFqbWx3Szc2Zmp2MG80ZUVDU3hsQTBhTndE?=
 =?utf-8?Q?6xdFQiWw0ZzsjNsgrMrIj1LDkEXswZyyVfJFIdh?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68202e82-7303-49cd-e4f7-08d92fd54c2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2021 08:12:20.0232
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5bFtucZMbmcqxNCNn6888NG/rMhqrXuF2ICbUUglpB0EI5fqjBxk1Q+iqse3TbXcterso1Lr9ySyv1+gByasb2IuJpluBGbyE5vrCzr+kWQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6616
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggNC81XSBhcm02NDogZHRzOiByZW5lc2FzOiByOWEwN2cwNDQ6IEFkZCBETUFDIHN1cHBv
cnQNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBNb24sIEp1biAxNCwgMjAyMSBhdCAzOjAyIFBN
IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gPiBT
dWJqZWN0OiBSZTogW1BBVENIIDQvNV0gYXJtNjQ6IGR0czogcmVuZXNhczogcjlhMDdnMDQ0OiBB
ZGQgRE1BQw0KPiA+ID4gc3VwcG9ydCBPbiBGcmksIEp1biAxMSwgMjAyMSBhdCAxOjM2IFBNIEJp
anUgRGFzDQo+ID4gPiA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiB3cm90ZToN
Cj4gPiA+ID4gQWRkIERNQUMgc3VwcG9ydCB0byBSWi9HMkwgU29DIERULg0KPiA+ID4gPg0KPiA+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
DQo+ID4gPiA+IFJldmlld2VkLWJ5OiBMYWQgUHJhYmhha2FyDQo+ID4gPiA+IDxwcmFiaGFrYXIu
bWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+ID4gPg0KPiA+ID4gVGhhbmtzIGZvciB5
b3VyIHBhdGNoIQ0KPiA+ID4NCj4gPiA+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5l
c2FzL3I5YTA3ZzA0NC5kdHNpDQo+ID4gPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVu
ZXNhcy9yOWEwN2cwNDQuZHRzaQ0KPiA+ID4gPiBAQCAtOCw2ICs4LDEwIEBADQo+ID4gPiA+ICAj
aW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPg0KPiA+
ID4gPiAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL3I5YTA3ZzA0NC1jcGcuaD4NCj4gPiA+
ID4NCj4gPiA+ID4gKyNkZWZpbmUgQ0hfQ0ZHKHJlcWQsIGxvZW4sIGhpZW4sIGx2bCwgYW0sIHNk
cywgZGRzLCB0bSkgXA0KPiA+ID4gPiArICAgICAgICgoKCh0bSkgPDwgMjIpIHwgKChkZHMpIDw8
IDE2KSB8ICgoc2RzKSA8PCAxMikgfCAoKGFtKSA8PCA4KQ0KPiB8IFwNCj4gPiA+ID4gKyAgICAg
ICAoKGx2bCkgPDwgNikgfCAoKGhpZW4pIDw8IDUpIHwgKChsb2VuKSA8PCA0KSB8ICgocmVxZCkg
PDwNCj4gPiA+ID4gKzMpKSAmIDB4MDA0RkY3NzgpDQo+ID4gPiA+ICsNCj4gPiA+DQo+ID4gPiBJ
IGFzc3VtZSB0aGUgYWJvdmUgd2lsbCBiZSByZW1vdmVkPw0KPiA+DQo+ID4gQmFzaWNhbGx5IHRo
ZSBtYWNybyBzaW1wbGlmaWVzIHRoZSBjaGFubmVsIGNvbmZpZ3VyYXRpb24gdmFsdWVzIGluIFRh
YmxlDQo+IDE2LjQgcGFnZSA1Njkgb2YgdGhlIGhhcmR3YXJlIG1hbnVhbC4NCj4gPg0KPiA+IENs
aWVudCBkcml2ZXIgd2lsbCB1c2UgTUlEK1JJRCwgYW5kIHBhc3MgKFNyYyBhZGRyZXNzIG9yIGRl
c3QgYWRkcmVzcw0KPiA+IGFsb25nIHdpdGggdGhlIGNoYW5uZWwgY29uZmlndXJhdGlvbiB2YWx1
ZXMgRm9yIGNvbmZpZ3VyaW5nIERNQSBjaGFubmVsLg0KPiA+DQo+ID4gRm9yIGVnOi0NCj4gPg0K
PiA+ICAgICAgICAgICAgICAgICBzc2kwOiBzc2lAMTAwNDljMDAgew0KPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicmVuZXNhcyxyOWEwN2cwNDQtc3NpIiwNCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInJlbmVzYXMscnotc3NpIjsNCj4g
PiAgICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MCAweDEwMDQ5YzAwIDAgMHg0MDA+Ow0K
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSAzMjYgSVJR
X1RZUEVfTEVWRUxfSElHSD4sDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIDxHSUNfU1BJIDMyNyBJUlFfVFlQRV9FREdFX1JJU0lORz4sDQo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIDxHSUNfU1BJIDMyOCBJUlFfVFlQRV9FREdFX1JJU0lO
Rz47DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0LW5hbWVzID0gImludCIs
ICJyeCIsICJ0eCI7DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZjcGcg
Q1BHX01PRCBSOUEwN0cwNDRfQ0xLX1NTSTA+LA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDwmYXVkaW9fY2xrMT4sDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgPCZhdWRpb19jbGsyPjsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBjbG9jay1u
YW1lcyA9ICJzc2kiLCAiYXVkaW9fY2xrMSIsICJhdWRpb19jbGsyIjsNCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICByZXNldHMgPSA8JmNwZyBSOUEwN0cwNDRfQ0xLX1NTSTA+Ow0KPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgIGRtYXMgPSA8JmRtYWMgMHgyNTUgMHgxMDA0OWMxOA0KPiBD
SF9DRkcoMHgxLDB4MCwweDEsMHgwLDB4MiwweDEsMHgxLDB4MCk+LA0KPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICA8JmRtYWMgMHgyNTYgMHgxMDA0OWMxYw0KPiBDSF9DRkcoMHgw
LDB4MCwweDEsMHgwLDB4MiwweDEsMHgxLDB4MCk+Ow0KPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgIGRtYS1uYW1lcyA9ICJ0eCIsICJyeCI7DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
cG93ZXItZG9tYWlucyA9IDwmY3BnPjsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAjc291
bmQtZGFpLWNlbGxzID0gPDA+Ow0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9
ICJkaXNhYmxlZCI7DQo+ID4gICAgICAgICAgICAgICAgIH07DQo+ID4NCj4gPiBQbGVhc2UgbGV0
IG1lIGtub3cgeW91ciB0aG91Z2h0cyBvbiB0aGlzLg0KPiANCj4gSG93IHdpbGwgdGhpcyB3b3Jr
IHdpdGggKGV4aXN0aW5nKSBkcml2ZXJzPw0KPiBFLmcuIGRyaXZlcnMvdHR5L3NlcmlhbC9zaC1z
Y2kuYzpzY2lfcmVxdWVzdF9kbWFfY2hhbigpIGFscmVhZHkga25vd3MgdGhlDQo+IHNvdXJjZSBh
bmQgZGVzdGluYXRpb24gYWRkcmVzc2VzLg0KPiBUaGUgb3RoZXIgQ0hDRkcgYml0cyBtYXkgYmUg
bmV3LCB0aG91Z2guDQoNCk9LIHdpbGwgdXNlIG9ubHkgTUlEK1JJRCBmb3IgdGhlIG5leHQgdmVy
c2lvbiBhbmQgd2lsbCBkcm9wIENIX0NGRyBNYWNyby4NCkNIX0NGRyB2YWx1ZXMgY2FuIGJlIHN1
cHBsaWVkIHRocm91Z2ggRE1BIGFwaSdzLg0KDQpSZWdhcmRzLA0KQmlqdQ0K
