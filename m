Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 165C9709CE2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 May 2023 18:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbjESQvB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 May 2023 12:51:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230414AbjESQvA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 May 2023 12:51:00 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2124.outbound.protection.outlook.com [40.107.114.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97316E56
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 May 2023 09:50:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V13Gd5+iFrAoWz5EAVCtvtncnjQQrUnakl8mnta0v+PC9sam15eyNguUtAPRGjgH6g7gzQYra8msqlfJYvf7oHUbDytJfdPoSLiIzEHb/7WZAfWDFIN5nP6dIhava5gHx/IYyBlQ0gVKngJDdsn4swK1SQRME/0xCzn/dUPSnYMfZuMNAs2+RF99wSqayewfcbitJCEP7E+Akk/wveBzUolOO3n8aONKyxpPHB7hg3SnS6c/F4PgUflJFNQx31UBjJvKdMEabzkImLQD3V0Em0K1ttzUk+R29pug3/NqFh9GhZiPHZ6g7XsJnsWUZLs3fkS6dprVEHJixW8njpjztg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URibnmkOuhj5tn2ZvoWHgbyWabPBbWEA9fZx6mL4Td8=;
 b=mECTxEcjajPWRq84oGwOWjOVVRwaf0hQZKo90Tm7PCX/uY5oCc+kO/O5U/vJr987nUGkBr+Ne34EN7gWFB5i4ChsZ30nHNY5pSNVTPCmt2DeuSd1gDxt/bMhANcogG6FSlJvvbI7TzbO75dxq7a6BazIPVU6yuduz9JoD76yCFcNMUYhO2RaGKD9qkVq2804bRd6AHQgUSfx7eigAr5ciUTWII1zsxc1FUZgjMRqHNfnejy3pUt45yKFKs5khPn19JUls58R6zG+jIzIhuvTXf+Xe4pw38Pd5pVX9kWGW/aQwbPjNLrl+zILyRfIw3bUZpeWYAt65OI/zio7c2C8zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URibnmkOuhj5tn2ZvoWHgbyWabPBbWEA9fZx6mL4Td8=;
 b=u6f37DOvPgH+zOtcI+lXwR7eH1rjyHRb4vYaG05lY+FTIiHw7tAS/o5UWzQtBvKyk3zOayI6dI2lhvXVSGU/dXQuaFIG0wrStNdiKTWu9jIg7pfcFOTWHTo5Hy88O3/X+lGYeDFhus4boyKNfHE+2XPoI89LfUCZLTFGBENk80Q=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB5895.jpnprd01.prod.outlook.com (2603:1096:604:c7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Fri, 19 May
 2023 16:50:00 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 16:50:00 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH v4 10/11] regulator: Add Renesas PMIC RAA215300 driver
Thread-Topic: [PATCH v4 10/11] regulator: Add Renesas PMIC RAA215300 driver
Thread-Index: AQHZiX0hDygYjj8rtUC7JFGsWIspRq9hkToAgAA/foA=
Date:   Fri, 19 May 2023 16:50:00 +0000
Message-ID: <OS0PR01MB592268698F558A0D4FFFCACA867C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230518113643.420806-1-biju.das.jz@bp.renesas.com>
 <20230518113643.420806-11-biju.das.jz@bp.renesas.com>
 <CAMuHMdX3p5O_LpSGNm342XjFZYfE3DavpXUJRrrnYp62gpLxiQ@mail.gmail.com>
In-Reply-To: <CAMuHMdX3p5O_LpSGNm342XjFZYfE3DavpXUJRrrnYp62gpLxiQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB5895:EE_
x-ms-office365-filtering-correlation-id: 60ae5ffc-7028-4463-5629-08db588915bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uid4Duj8NHzRHwZHpKABaPxHD+lNwTQhR7U4Aq8JzDDCiPLLcydfY2rlHtn2Fy86f3+xZ4VAPiA/WN6YpXNZG/Vz/7OSfxNZpvSj2B7d/vIpppRRsWFMtgS485GpqMsWnIKdJsuzTECHFeOZNWbwnTZ7bKEeZQ32po4VeDHe63x8tqhAosbPEoyI6Fun64vaiPd4D0fAVEBGoyZWQY9noNgF+6nEtA8tAdaHyVPzf5gJEpTnDn4duw8qOVTaJ2tl0+5dWOnPtH+udx/uWWxxM+fQap1ZUIVOmUj0kHzAAY3EKBjd+TpgAnM19AY52sVz0A7fLZXd8smt5llZzVYnjjEmUHp0F5fV0kaOixhoipBUhITL4cjqzpmq5x5sE2FiK55lo+3ojsdnHvfbrgk16oHV2mFsV+95K1dmkp7JQZ9L6A41lTF/EFAhRldgNRMxPr3sMrQEjaRbHkP5odtdfw840R5KOLX0O+HcXNraUYRDj96tNzWg0hSe+ePQm6PXKANvcPUES09JcKQOg64o60If71VvS166C1jelwoB9OVxpf7kkrqccoafwWozBRd9IQmPjvLVFe7237nb37q7yyN0PM4MpcstdlnJnUpCs13xPkId4LHxmh/gYTvJSjkm
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(451199021)(4326008)(66446008)(478600001)(66946007)(64756008)(66476007)(76116006)(66556008)(6916009)(54906003)(316002)(33656002)(38070700005)(86362001)(83380400001)(26005)(6506007)(107886003)(53546011)(9686003)(186003)(7696005)(71200400001)(5660300002)(8676002)(52536014)(55016003)(2906002)(8936002)(41300700001)(122000001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUREc1FuUjlZQ29kTXRpcU5oTVBQWE8weXMwK1FDVzB2L3FQN3Uyb0g4MkUx?=
 =?utf-8?B?b3RIU29KNkR3bWZzRnRKQTZtNWs0ZWlFeGFhcCtPdnVKMXJGWTNsZTQxZHZD?=
 =?utf-8?B?Zkw2TWFxSUd1OXhVdHpWVnZuZk9LK3BYK0pDN29ZZGQ3YVI4dHg2RDVFTm9N?=
 =?utf-8?B?WUw0TzZPWnlFVExLdGtrNFNqVGp1Tm8vV3BvcEpJbnMwSytzZllwR0lvbUVE?=
 =?utf-8?B?RmVyRUpIdm16T3pqemc4WUxKL0tIeS94VEJWNEh0R3Jna1JYMnF3UHdIVy9v?=
 =?utf-8?B?Vzd2aTI4K1lMckczTllod2hremk0ay9LTHp1STVUNGpCWkx1TEJiSlNFaWJm?=
 =?utf-8?B?OUIxT2VVbG9yT2lFN0lvMmo1b3lPREh6cXYvU0pQc1VzenlocStMcU10bUto?=
 =?utf-8?B?elhJd0Y4WnBDbmJta2drMmwvblNUYW5URkJLdWdOSytQemtLaDJlY0tkdkVh?=
 =?utf-8?B?VkUxRTBlOUpWdktjc3hMb0tYMlY0U1grYWcvUE9HdUtMUE0xLy9kWHhISzRp?=
 =?utf-8?B?c1VzTUJBVDBzOVNYZTJKQVV6UFVoOUcyRElnZWM0dUkxT3RHRDlseWlrbUNJ?=
 =?utf-8?B?L2QxNDFnc0pkWDFYMkVqUGh1Ky8xczlMN2tNRDhuLzlkanFER2thQ0hnVGxq?=
 =?utf-8?B?MXBPTGVqelJ4WlZseG1VZ0hXd0VpRUo1Q3pTK3hFeWdhOW5kbnFJRmRRMFdO?=
 =?utf-8?B?a1p5d1NpdllXSUgrMVpockxUSW1vVEpzZ0dUTjRvdmtuWnRMQ2lHMHFPaFRG?=
 =?utf-8?B?ME5nRW1GNTBFK1B6VWR3TWQrbzZJNXpYVHBhOUszNDhMOWQ0Ukkwa25XN3dP?=
 =?utf-8?B?N1VjbXBIcW9kSW9yUzQxYVM4elAvcTFGc2lHQXRBOHI3aTUvWU55VmJqOE9z?=
 =?utf-8?B?NkpMcnZZSEcvT0RITzI3RHJLQUp3c003WnUxd094ZHBZUDFGYWF4R1gwb1Rz?=
 =?utf-8?B?bjg3MklSMHRWdDZNQmRwSjRSV1E5Y1IrSGQrQ3c4V3REbGtCT2FOUGlkVlJM?=
 =?utf-8?B?d1ZVNWhlZGZ2ZXNnVTZPRE5kYWgwSE9UOUYwWTRiZFUwRG0ySnEweWdNUVdh?=
 =?utf-8?B?UkFVZlh1enFtSVhSZlRZNGFyeUNaOUJheE9HNEM4aVUzQ1o5UTJ3eFpMZVBT?=
 =?utf-8?B?M0ZuMDM1cFpLT1FMbGxxemhtK3l6ZW1NQzVYNGx5RXJkL0o2UHhDc1ptbDh0?=
 =?utf-8?B?M2FHeFhsaTJQNVVVQWZPby8yOHRnUndQOWFPRFlYUTl1ZGpMdkpCaExPVTI0?=
 =?utf-8?B?Q1Yrc0xQcFNsY3NUMUJFWTdvNktRZ1pCV1Erc292OWRGSnNvQ0JPZ3JZOGlY?=
 =?utf-8?B?d3FqbUczOWxnZm9Ec3Ywc3NHMGxiQm9SWHRPNWNCYnJOMENPMlFwUThhYmdL?=
 =?utf-8?B?Y1lhUmNENWRxZ1c4K3ppcUlyZXpJMXJ3T0gwdmc0djBtODNhdmtydTNVNHR6?=
 =?utf-8?B?ZDNxT0RFYzJZbVdRUExJYmpRMXYxQUY3MDhrNWVCTmdvVlBxVUU1SjVrMEhu?=
 =?utf-8?B?dUo3SDZCalp3R09EcFVkeFRYaytoNE9JNWNDRzdKRkJ5MG1NNTgvak1KbGtI?=
 =?utf-8?B?NkFJTFVUZlhIMDZpNkluTlBXTlZUOWpRRWJFK21tUjJsc3JzVTdlOGdCT3Jk?=
 =?utf-8?B?dENsZ1huMUYzbG1lbFJmTk91bzBsVjhCNHFRQnh2anE3WDZmSUZGTS9xSXBP?=
 =?utf-8?B?VXgwZmJDbEVBT3Q1bXd5ZWhsVTQ0aHV3aWJaT1B2dHY1eHVZdXJhRHFtbGV3?=
 =?utf-8?B?SkwvU0VJRlFkWjdRTGV2QUdlVGtLQ0lLVlVvSUYzbTdyQ0orQUhia2dXQ2x3?=
 =?utf-8?B?MFhRbFJ3MVZlbTQwaHZXN3cydllHM1R3Q1VtdXdJdThjL1FvazRSVHlwajBM?=
 =?utf-8?B?WHZ2MUdkWm5GdUhyem9UQ3BIQ3BpRExCdzNKMXI3NkZTYTFiMzNUN2l2N1p0?=
 =?utf-8?B?d0lEQXFSRzF4NWtxRHNxdnZubmk3YnNjZUhUNVltelVwUitlWlYwRGw4K09H?=
 =?utf-8?B?dSt3d0JRQkxlMmRYamNEZXl6eTJRZmVzRkV0ZmhJdzVXSmNrVnI2RFBBaHZR?=
 =?utf-8?B?NmxRcjdEamtRb1pzQndSMFplc1hoMXVCengwR3E5MFdCNGZUb0RvNGkvRVhV?=
 =?utf-8?Q?g02rTadUnS/4kjEKOYsaxIbKC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60ae5ffc-7028-4463-5629-08db588915bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2023 16:50:00.1190
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TFkIXwRsL49TNquVSdCFRtJB7IE8jXhPC7nNxav54nYd8Ytut630R1NBcJrEB8qGiggtFbh9g8KHvsZYauiTPD+9k4wLxfyEeug0/FWDzS4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5895
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjQgMTAvMTFdIHJlZ3VsYXRvcjogQWRkIFJlbmVzYXMgUE1JQyBSQUEyMTUzMDANCj4g
ZHJpdmVyDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVGh1LCBNYXkgMTgsIDIwMjMgYXQgMToz
N+KAr1BNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+
ID4NCj4gPiBUaGUgUkFBMjE1MzAwIGlzIGEgOS1jaGFubmVsIFBNSUMgdGhhdCBjb25zaXN0cyBv
Zg0KPiA+ICAqIEludGVybmFsbHkgY29tcGVuc2F0ZWQgcmVndWxhdG9ycw0KPiA+ICAqIGJ1aWx0
LWluIFJlYWwgVGltZSBDbG9jayAoUlRDKQ0KPiA+ICAqIDMya0h6IGNyeXN0YWwgb3NjaWxsYXRv
cg0KPiA+ICAqIGNvaW4gY2VsbCBiYXR0ZXJ5IGNoYXJnZXINCj4gPg0KPiA+IFRoZSBSVEMgb24g
UkFBMjE1MzAwIGlzIHNpbWlsYXIgdG8gdGhlIElQIGZvdW5kIGluIHRoZSBJU0wxMjA4Lg0KPiA+
IFRoZSBleGlzdGluZyBkcml2ZXIgZm9yIHRoZSBJU0wxMjA4IHdvcmtzIGZvciB0aGlzIFBNSUMg
dG9vLCBob3dldmVyDQo+ID4gdGhlIFJBQTIxNTMwMCBleHBvc2VzIHR3byBkZXZpY2VzIHZpYSBJ
MkMsIG9uZSBmb3IgdGhlIFJUQyBJUCwgYW5kIG9uZQ0KPiA+IGZvciBldmVyeXRoaW5nIGVsc2Uu
IFRoZSBSVEMgSVAgaGFzIHRvIGJlIGVuYWJsZWQgYnkgdGhlIG90aGVyIEkyQw0KPiA+IGRldmlj
ZSwgdGhlcmVmb3JlIHRoaXMgZHJpdmVyIGlzIG5lY2Vzc2FyeSB0byBnZXQgdGhlIFJUQyB0byB3
b3JrLg0KPiA+DQo+ID4gVGhlIGV4dGVybmFsIG9zY2lsbGF0b3IgYml0IGlzIGludmVydGVkIG9u
IFBNSUMgdmVyc2lvbiAweDExLg0KPiA+DQo+ID4gQWRkIFBNSUMgUkFBMjE1MzAwIGRyaXZlciBm
b3IgZW5hYmxpbmcgUlRDIGJsb2NrIGFuZCBpbnN0YW50aWF0aW5nIFJUQw0KPiA+IGRldmljZSBi
YXNlZCBvbiBQTUlDIHZlcnNpb24uDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8
YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gdjMtPnY0Og0KPiA+ICAq
IE1vdmVkIGZyb20gbWZkLT5yZWd1bGF0b3IgYXMgaXQgZG9lc24ndCB1c2UgTUZEIEFQSXMNCj4g
PiAgKiBEcm9wcGVkIGhhbmRsaW5nICJyZW5lc2FzLHJ0Yy1lbmFibGVkIiBwcm9wZXJ0eSBhbmQg
aW5zdGVhZCB1c2VkDQo+ID4gICAgY2xvY2stbmFtZXMgdG8gZGV0ZXJtaW5lIFJUQyBpcyBlbmFi
bGVkIG9yIG5vdCBhbmQgdGhlbg0KPiBpbnN0YW50aWF0aW5nDQo+ID4gICAgUlRDIGRldmljZS4N
Cj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+
ICsrKyBiL2RyaXZlcnMvcmVndWxhdG9yL3JhYTIxNTMwMC5jDQo+IA0KPiA+ICsgICAgICAgeGlu
ID0gZGV2bV9jbGtfZ2V0X29wdGlvbmFsKCZjbGllbnQtPmRldiwgInhpbiIpOw0KPiA+ICsgICAg
ICAgaWYgKElTX0VSUl9PUl9OVUxMKHhpbikpIHsNCj4gPiArICAgICAgICAgICAgICAgY2xraW4g
PSBkZXZtX2Nsa19nZXQoJmNsaWVudC0+ZGV2LCAiY2xraW4iKTsNCj4gPiArICAgICAgICAgICAg
ICAgaWYgKElTX0VSUihjbGtpbikpDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJu
IFBUUl9FUlIoY2xraW4pOw0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgaW50X29zY19lbiA9
IGZhbHNlOw0KPiA+ICsgICAgICAgICAgICAgICB4aW4gPSBOVUxMOw0KPiA+ICsgICAgICAgfSBl
bHNlIHsNCj4gPiArICAgICAgICAgICAgICAgY2xraW4gPSBOVUxMOw0KPiA+ICsgICAgICAgfQ0K
PiA+ICsNCj4gPiArICAgICAgIGlmICh4aW4gfHwgY2xraW4pICB7DQo+IA0KPiBQZXJoYXBzIGp1
c3QgImlmIChvZl9wcm9wZXJ0eV9wcmVzZW50KG5wLCAiY2xvY2tzIikpIj8NCg0KQWdyZWVkLg0K
DQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+ID4gKyAgICAgICAgICAgICAgIHN0cnVjdCBpMmNfY2xp
ZW50ICpydGNfY2xpZW50Ow0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgLyogRW5hYmxlIFJU
QyBibG9jayAqLw0KPiA+ICsgICAgICAgICAgICAgICByZWdtYXBfdXBkYXRlX2JpdHMocmVnbWFw
LCBSQUEyMTUzMDBfUkVHX0JMT0NLX0VOLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgUkFBMjE1MzAwX1JFR19CTE9DS19FTl9SVENfRU4sDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBSQUEyMTUzMDBfUkVHX0JMT0NLX0VOX1JUQ19FTik7DQo+
ID4gKw0KPiA+ICsgICAgICAgICAgICAgICBydGNfY2xpZW50ID0gaTJjX25ld19hbmNpbGxhcnlf
ZGV2aWNlKGNsaWVudCwgInJ0YyIsDQo+ID4gKw0KPiBSQUEyMTUzMDBfUlRDX0RFRkFVTFRfQURE
UiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBwbWljX3ZlcnNpb24gPj0NCj4gMHgxMiA/DQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImlzbDEyMDgiIDoNCj4gInJhYTIxNTMw
MF9hMCIpOw0KPiA+ICsgICAgICAgICAgICAgICBpZiAoSVNfRVJSKHJ0Y19jbGllbnQpKQ0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKHJ0Y19jbGllbnQpOw0KPiA+
ICsNCj4gPiArICAgICAgICAgICAgICAgcmV0ID0gZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KGRl
diwNCj4gPiArDQo+IHJhYTIxNTMwMF9ydGNfdW5yZWdpc3Rlcl9kZXZpY2UsDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBydGNfY2xpZW50KTsNCj4g
PiArICAgICAgICAgICAgICAgaWYgKHJldCA8IDApDQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgcmV0dXJuIHJldDsNCj4gPiArICAgICAgIH0NCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0K
PiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5
dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRA
bGludXgtDQo+IG02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGgg
dGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4NCj4gQnV0IHdoZW4gSSdt
IHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRo
aW5nDQo+IGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBM
aW51cyBUb3J2YWxkcw0K
