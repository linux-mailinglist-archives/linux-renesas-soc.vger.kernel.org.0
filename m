Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F6403E9F1D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Aug 2021 08:59:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234153AbhHLHAV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Aug 2021 03:00:21 -0400
Received: from mail-eopbgr1410128.outbound.protection.outlook.com ([40.107.141.128]:6752
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230147AbhHLHAV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Aug 2021 03:00:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bJPQGD4aIHHwP0B6yxRXltpHlFrKeTe+sIzkL3iRHpjuxsRtRmWjhuzOYgZmEvqr0LA81UfUK7fMeA4deWTLJWUvUwoHAxP/4mvXpLZEijzgwMc963K5UE3zP8WS02yNfJsgcUip+UO1AJHVPps8mJ3bV5cth3EwrpaEn+88TcKLl/4toMnfhZ329EARUPwbM/Y9YRuhWgVpr4pYQ2WzX5j1XUpJYjn2KSFleggfapZg+Z3H49WS3qCZwgs7iI/KtYXxnUuQB0RpsM5wDcKp+fcWN0vSX/JIW9t//R2l3wyX/Va3oEehgRJeVtmGZUFbpq52+ybc/cD/xSHSgjIuGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pWJ2ngUC4j9+u/dcap6PC7UwAC8rFqdSoAorRwDBanQ=;
 b=LEz0pWtqDqFbJrPBn/UITdAgbpWw2H7H1VAbsJz8MXRVMzNlUuJBdCO8YJqjWpWJvxjyP6/FqCFpE90kSZWUiWB1vbLiTXHg8ockkq33u/mhbsBKvHk82UdpZTACmZcEZNItaNFRElOoye9/r8hwG8DQRlUcXY5DP0UjoJjFs+s5CidjIwkvO2eMrAcpMx4/nJOmqr/PTFsJ2ObIahMh39CHL4tDeUJ8MMKeXeveMbOPefYwf/tMk1uYOG/GnIIXi+ZgXvBFTTXWDHdI6ydPfDEFOKzI2SXImKlUufujIfnyJmT3FVoYVctGDlcYLPCmrO0x0IJGaSU0fbJ1DHTYbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pWJ2ngUC4j9+u/dcap6PC7UwAC8rFqdSoAorRwDBanQ=;
 b=Z+3GfSJuBGaBXSRHRowmAuCIlDmYU1uDn1CpDN/4s4bspXnSKjCPBR2lwNQQLT1rJ5PGQu3ESL7oH+/UoYavsNrHfcpTd0qOHWvh8zMxGZRKLQ2SeKQfGdwzqH1nzOExDBzn/sAVoRfMly3QGyh2he8VZvZobqfR6h0w0kKFRVQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB4625.jpnprd01.prod.outlook.com (2603:1096:604:69::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Thu, 12 Aug
 2021 06:59:52 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%9]) with mapi id 15.20.4415.017; Thu, 12 Aug 2021
 06:59:50 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 3/4] drivers: clk: renesas: rzg2l-cpg: Add support to
 handle coupled clocks
Thread-Topic: [PATCH v2 3/4] drivers: clk: renesas: rzg2l-cpg: Add support to
 handle coupled clocks
Thread-Index: AQHXgvI2g+77GqWYgE+LlXgC8Po5JatuLqGAgAFYXcA=
Date:   Thu, 12 Aug 2021 06:59:50 +0000
Message-ID: <OS0PR01MB5922E8535729D5AF997B33E986F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210727141749.17783-1-biju.das.jz@bp.renesas.com>
 <20210727141749.17783-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdUyiarunEWaQPyR+R+7RbMBXm-xaE1HpuyTwCcNymVS2g@mail.gmail.com>
In-Reply-To: <CAMuHMdUyiarunEWaQPyR+R+7RbMBXm-xaE1HpuyTwCcNymVS2g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 503ee6ce-422a-4c46-714a-08d95d5ec798
x-ms-traffictypediagnostic: OSAPR01MB4625:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB46253A33A6BAD3293028824F86F99@OSAPR01MB4625.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2lSkIBDq7kz4+uOFyiEGLp2c37yAqSoG0g7CdSC/TSPgFL0oM9l7zW6hCctl9lxFF09Gwc7OluXA/lI0sMn5Srei2vQFoebDqoN34rPC9qkgf7EWM2J4tm1MPmPfcuQqTAB8PwxJBSfgLcrp5FpDFeN8kSkQaxuXM83gafeoXM52Lo1ZWBIlT21r2J5pj/wCzG1eTD6X0syoS2hzu2MlyNgCOquoUnhTpQI563M6I/RplVARtZ1HiNVfybmK4FZ2ESrbaR006kLCtrjCmdoCheWqHvhI342AOesc/2DrK3dQoXzMUcCwKNtR6yR/K5oDbnmiAT+Cvc7UePcthyZ1/F0FcMtLhHrxVEN3wQAX1dUvQfSdFqhiNUJ1ZDTFpmWJkjRnAr2OHeXX8V60GyTAfqR3bIv8DikgUOCT19tjjBSkuIpHyoHwDxcT7aU9ksgozCbGPS8+i7eUCLVOjvZ4dEEiNGIXUmYzPANc2cb4erYN3rjpehBNb1fVsUmmv8IZHqVifFijZvEiv7RzJK7a9b/5k9d36jiQWVuUnWsYVj5UpFLmVRNCXcmipAU/XsA5mE1i25N1aswGuHLSMiODSEyPOzmb/3puSaueJ6owfhbRDrkr3mnVE6YPt9opOwdKpCiAn1xQzkbOx+IBukIGHUhTIc21hxNhOhRRxRA6lw4PMRPDiYTbiU561gv/odh8f/2WcVGUNavbDcH8a8NPwg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(366004)(346002)(39860400002)(2906002)(33656002)(86362001)(83380400001)(52536014)(122000001)(26005)(7696005)(55016002)(107886003)(5660300002)(71200400001)(53546011)(6506007)(38100700002)(186003)(38070700005)(9686003)(54906003)(478600001)(66476007)(8936002)(66556008)(64756008)(66946007)(76116006)(6916009)(4326008)(8676002)(66446008)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K0NSY2tGTlJhRm8rcEFET2R2UjV5WjM1alBSb1N5bUIxSU5XcVFxeHlNTVZ1?=
 =?utf-8?B?MFdkNGI2aHFHV2owdkpoOTVwT3NLSmZMTEgyQW02dVppSHgwb1lHYzB5YWJl?=
 =?utf-8?B?cHhUNTlDSVA0SVV6Tk9PbTdsWUNublpXSTl6T08rUTNQaTJsZklqZ1hnM0M0?=
 =?utf-8?B?em4vdGJPeC8yZzRQWmVjdWF4MkU1UTBUVG56V0xubnpXNGRVNWFqVlFNWlpk?=
 =?utf-8?B?ZUJ2SkwvS3o0Y1pJTjBKSkM5Z20vZURQOWNwMGEvZ0Jod1hHMW9hdVRLQm4v?=
 =?utf-8?B?Y1FSVWpLMXgvQ1B4WHROM2tGdysyZTJoSzdEK3MzQ3U1b2pFNVFnN29vdjFk?=
 =?utf-8?B?b0wzaStpSmIrNmNHL2lCVUtLZi9iRkFXdVZ4dUVLVGhkK21iL1hMeWp2bVB2?=
 =?utf-8?B?blFGSFE5d1d1T2wxNVZHcC9OSnduQWJ3YTZkbmJhN1YvNVZYdjBSQm43bUlI?=
 =?utf-8?B?Yk9hN2huMStxTFBoYVFucE9vMjRwU0djeXN4SmlqM2tNV2grUjVibElsbzhI?=
 =?utf-8?B?SXc3ZEl4R0Z6c3dWei9ycmdJZHFtelFwSVk4WUFaYXJlRTNJZVBZN2NkbS9t?=
 =?utf-8?B?dVJnOXBiZUFSbFB4cXZNYXlOVDFwMzZqSDRiYjJ3NVk4REdWTExsNW5rT2NV?=
 =?utf-8?B?d3A1VG5hVzR0dThQMmJ3U0NPRFYzRkwvV0h1aEdBVThDdExZQmxzYmh1aUtM?=
 =?utf-8?B?SXN6bXRNNTNYUXY3UTkzYUVTQm5nSFNVVENydXFhYU1LMjRRdmlkLzFicnpp?=
 =?utf-8?B?aFVnREJxOVdUOHRsMlFHdGZEY1lRS24wU3FrNCs1anlVdW05bWxjSzJnTmdq?=
 =?utf-8?B?QVRzbDRBNVlacmVUdU1vOXJMTDhXYTg5M24wZGhkTmlJQnpiK1AxbHNtM2U2?=
 =?utf-8?B?TzV5QkdBcGdqQ2FqWlJYSXNmTmZoUm8yMlczbm1xN29Cbm9uV3ozcjRvSDNB?=
 =?utf-8?B?dVlwcDFLaG1oVldXRTFKMzZONnZXcXRMZW9wQ1dlTWtRd0pzQjM2MXNWaTla?=
 =?utf-8?B?eTExOGhXbTFXajUzRWlsY0RNU0YvZ2RxUFdNU3ZFeGZ3L3ppSUtEU08weFZZ?=
 =?utf-8?B?bTB3SHpsVDNVajFWdW1yZjdpR0owZTZFaU1rNXRlZUxLS1ZQSHhsOWxacWdB?=
 =?utf-8?B?VTYxSkZrQ0dNWFRsZmtwMHNLRGwwWGhJR0o3aTIvRTRsZ0M0RGVHSlF2aGpi?=
 =?utf-8?B?cCtsRXJyRE1mTXhhY0w3L2k1aGY5ZWJWYmx2WEQ3Tzh0cTlHeXhoZ2t0Yk00?=
 =?utf-8?B?RTg1VEVLNXF4cG85YlZLbXd3RDRJaUpGYjZzamdYQ2xmdTdGcjhmRUhYdVM1?=
 =?utf-8?B?bmRCZk5NcDJibCs3cEdMcVgweWs0elRuK2Z3L1k3SStYNW9zdGREWjNIbjhB?=
 =?utf-8?B?Zk5oRW1PQ29wcVlsZmxzWWxneExTT0huL3czdmU2Ym1PamoxQktkandObERj?=
 =?utf-8?B?dlNubURwTzIrQjJBQUFMZitaTEY1Rk44MWFDY3hBcnorY1d4M2xCaVUyUjUv?=
 =?utf-8?B?MU1JZWgrQktHUExuWldhLy80MENMdWVUdll5aFhDdTgzQ3lKcVJGTHNjckFQ?=
 =?utf-8?B?S284RDhveGRzVElzN084NFZuWTZSMWZTWnoxWWdJcytYNkZLMk04YmFqR0pk?=
 =?utf-8?B?OWdjK2x3eVpQTXlLMCs1ZnkzZjVwMUMwUGtTU3pOS004ekZFYjhRTml6cTNF?=
 =?utf-8?B?L0hWb2JaN0NHVXNHOERmSEs0RXlYSk9JUm1yT3RicGorUWJobXZ1enB3Q2Jp?=
 =?utf-8?Q?Mb5YFXv0X9ibb6MPN4gQNbQNUSxwcbqnRnKOi2t?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 503ee6ce-422a-4c46-714a-08d95d5ec798
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2021 06:59:50.4196
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YE5Qr96bAkmN7nE0JaxDQmgwCNZogXPkkvlFBJtYd5HIjnI6UtoHn9vN2LQLMDhnU79YaqZv0IQ+cTlbVU8X8A/nIxjGnCC00vmsdD/BSpA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4625
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgMy80XSBkcml2ZXJzOiBjbGs6IHJlbmVzYXM6IHJ6ZzJsLWNwZzogQWRkIHN1cHBv
cnQNCj4gdG8gaGFuZGxlIGNvdXBsZWQgY2xvY2tzDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24g
VHVlLCBKdWwgMjcsIDIwMjEgYXQgNDoxOCBQTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+IFRoZSBBWEkgYW5kIENISSBjbG9ja3MgdXNlIHRoZSBz
YW1lIHJlZ2lzdGVyIGJpdCBmb3IgY29udHJvbGxpbmcgY2xvY2sNCj4gPiBvdXRwdXQuIEFkZCBh
IG5ldyBjbG9jayB0eXBlIGZvciBjb3VwbGVkIGNsb2Nrcywgd2hpY2ggc2V0cyB0aGUNCj4gPiBD
UEdfQ0xLT05fRVRILkNMS1swMV1fT04gYml0IHdoZW4gYXQgbGVhc3Qgb25lIGNsb2NrIGlzIGVu
YWJsZWQsIGFuZA0KPiA+IGNsZWFycyB0aGUgYml0IG9ubHkgd2hlbiBib3RoIGNsb2NrcyBhcmUg
ZGlzYWJsZWQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpA
YnAucmVuZXNhcy5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWth
ci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBw
YXRjaCENCj4gDQo+ID4gLS0tIGEvZHJpdmVycy9jbGsvcmVuZXNhcy9yemcybC1jcGcuYw0KPiA+
ICsrKyBiL2RyaXZlcnMvY2xrL3JlbmVzYXMvcnpnMmwtY3BnLmMNCj4gPiBAQCAtMzMzLDEyICsz
MzMsMTYgQEAgcnpnMmxfY3BnX3JlZ2lzdGVyX2NvcmVfY2xrKGNvbnN0IHN0cnVjdA0KPiBjcGdf
Y29yZV9jbGsgKmNvcmUsDQo+ID4gICAqIEBodzogaGFuZGxlIGJldHdlZW4gY29tbW9uIGFuZCBo
YXJkd2FyZS1zcGVjaWZpYyBpbnRlcmZhY2VzDQo+ID4gICAqIEBvZmY6IHJlZ2lzdGVyIG9mZnNl
dA0KPiA+ICAgKiBAYml0OiBPTi9NT04gYml0DQo+ID4gKyAqIEBpc19jb3VwbGVkOiBmbGFnIHRv
IGluZGljYXRlIGNvdXBsZWQgY2xvY2sNCj4gPiArICogQG9uX2NudDogT04gY291bnQgZm9yIGNv
dXBsZWQgY2xvY2tzDQo+ID4gICAqIEBwcml2OiBDUEcvTVNUUCBwcml2YXRlIGRhdGENCj4gPiAg
ICovDQo+ID4gIHN0cnVjdCBtc3RwX2Nsb2NrIHsNCj4gPiAgICAgICAgIHN0cnVjdCBjbGtfaHcg
aHc7DQo+ID4gICAgICAgICB1MTYgb2ZmOw0KPiA+ICAgICAgICAgdTggYml0Ow0KPiA+ICsgICAg
ICAgYm9vbCBpc19jb3VwbGVkOw0KPiA+ICsgICAgICAgdTggb25fY250Ow0KPiANCj4gV2hpbGUg
dTggaXMgcHJvYmFibHkgc3VmZmljaWVudCwgeW91IG1heSB3YW50IHRvIHVzZSB1bnNpZ25lZCBp
bnQsIGFzDQo+IHRoZXJlIHdpbGwgYmUgYSBnYXAgYW55d2F5IGR1ZSB0byBhbGlnbm1lbnQgcnVs
ZXMuDQo+IA0KPiA+ICAgICAgICAgc3RydWN0IHJ6ZzJsX2NwZ19wcml2ICpwcml2Ow0KPiA+ICB9
Ow0KPiA+DQo+ID4gQEAgLTM5MiwxMSArMzk2LDM3IEBAIHN0YXRpYyBpbnQgcnpnMmxfbW9kX2Ns
b2NrX2VuZGlzYWJsZShzdHJ1Y3QNCj4gPiBjbGtfaHcgKmh3LCBib29sIGVuYWJsZSkNCj4gPg0K
PiA+ICBzdGF0aWMgaW50IHJ6ZzJsX21vZF9jbG9ja19lbmFibGUoc3RydWN0IGNsa19odyAqaHcp
ICB7DQo+ID4gKyAgICAgICBzdHJ1Y3QgbXN0cF9jbG9jayAqY2xvY2sgPSB0b19tb2RfY2xvY2so
aHcpOw0KPiA+ICsgICAgICAgc3RydWN0IHJ6ZzJsX2NwZ19wcml2ICpwcml2ID0gY2xvY2stPnBy
aXY7DQo+ID4gKyAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOw0KPiA+ICsNCj4gPiArICAgICAg
IHNwaW5fbG9ja19pcnFzYXZlKCZwcml2LT5ybXdfbG9jaywgZmxhZ3MpOw0KPiA+ICsgICAgICAg
Y2xvY2stPm9uX2NudCsrOw0KPiA+ICsgICAgICAgaWYgKGNsb2NrLT5pc19jb3VwbGVkICYmIGNs
b2NrLT5vbl9jbnQgPiAxKSB7DQo+ID4gKyAgICAgICAgICAgICAgIHNwaW5fdW5sb2NrX2lycXJl
c3RvcmUoJnByaXYtPnJtd19sb2NrLCBmbGFncyk7DQo+ID4gKyAgICAgICAgICAgICAgIHJldHVy
biAxOw0KPiA+ICsgICAgICAgfQ0KPiA+ICsNCj4gPiArICAgICAgIHNwaW5fdW5sb2NrX2lycXJl
c3RvcmUoJnByaXYtPnJtd19sb2NrLCBmbGFncyk7DQo+IA0KPiBJIHRoaW5rIHlvdSBjYW4gYXZv
aWQgdGFraW5nIHRoZSBzcGlubG9jayBhbmQgdG91Y2hpbmcgdGhlIGNvdW50ZXIgaWYgdGhlDQo+
IGlzX2NvdXBsZWQgZmxhZyBpcyBub3Qgc2V0Lg0KDQpPSy4NCg0KPiANCj4gPiArDQo+ID4gICAg
ICAgICByZXR1cm4gcnpnMmxfbW9kX2Nsb2NrX2VuZGlzYWJsZShodywgdHJ1ZSk7ICB9DQo+IA0K
PiBIb3dldmVyLCBJJ20gd29uZGVyaW5nIGhvdyB0aGlzIGNhbiB3b3JrPw0KPiANCj4gICAgICAg
REVGX0NPVVBMRUQoImV0aDBfYXhpIiwgUjlBMDdHMDQ0X0VUSDBfQ0xLX0FYSSwgUjlBMDdHMDQ0
X0NMS19NMCwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHg1N2MsIDApLA0KPiAg
ICAgICBERUZfQ09VUExFRCgiZXRoMF9jaGkiLCBSOUEwN0cwNDRfRVRIMF9DTEtfQ0hJLCBSOUEw
N0cwNDRfQ0xLX1pULA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDU3YywgMCks
DQo+IA0KPiBUaGlzIHdpbGwgY3JlYXRlIDIgaW5kZXBlbmRlbnQgY2xvY2tzLCBlYWNoIHdpdGgg
dGhlaXIgb3duIG1zdHBfY2xvY2sNCj4gc3RydWN0dXJlIHRoYXQgaGFzIHRoZSBpc19jb3VwbGVk
IGZsYWcgc2V0LiAgSGVuY2UgZWFjaCBjbG9jayBoYXMgaXRzIG93bg0KPiBjb3VudGVyLiBTaG91
bGRuJ3QgdGhlIGNvdW50ZXIgYmUgc2hhcmVkPw0KPiBBbSBJIG1pc3Npbmcgc29tZXRoaW5nPw0K
DQpPb3BzLiBZb3UgYXJlIGNvcnJlY3QuIEkgbmVlZCB0byBhZGQgdGhpcyBjb3VudGVyIHRvIHBy
aXYgaW5zdGVhZCBvZiBtc3RwX2Nsb2Nrcy4NCg0KPiANCj4gQW5kIHdoYXQgYWJvdXQgcnpnMmxf
bW9kX2Nsb2NrX2lzX2VuYWJsZWQoKT8NCj4gU2hvdWxkbid0IGl0IHJlZmxlY3QgdGhlIHNvZnQg
c3RhdGUgaW5zdGVhZCBvZiB0aGUgc2hhcmVkIGhhcmR3YXJlIHN0YXRlPw0KDQpPSywgd2lsbCBy
ZXR1cm4gU29mdCBzdGF0ZSBmb3IgY291cGxlZCBjbG9ja3MuDQoNCkNoZWVycywNCkJpanUNCg==
