Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B637050D6CD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 04:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238869AbiDYCHI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 24 Apr 2022 22:07:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237076AbiDYCHH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 24 Apr 2022 22:07:07 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2092.outbound.protection.outlook.com [40.107.113.92])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B45D31E3E2;
        Sun, 24 Apr 2022 19:03:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cwAMwKdOA9C27DV2VZl7KxVzleKwd17IdxYGlLH2N+M+4Watk09qgkc7IcwAiZxInatbGoC4JCc+puOYc3gKMBY+KGcPL61evlzjoZ2RsVmcWBwqdpPYK9Mqpb6VC38LBFM8tsTscXhtyVC67LXVfKz52xMP4uaWR9F5MXMNrRtMjtZmcFAl7sWylxHvTjhTx/6KfHZr3WvbxRGpOnYDHY+aX76m9xcWJZu05QuxV3AB83yIwbF+4lSt+e8pEc5YIMAr2FkDCCSiJ9B6URDzDoiDshLMpJiAk22tQbx8fZpObiIIYHvKC4PKadUjyBpqkb0tIcYc6pykT61WgPKSPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ByMmvKB13x5Wxg2BRa20ljfrQsQtHIQmlzZn+NyZXVE=;
 b=EZ1R4pT/iI8pCtiYCkdZ31aDGx/NblwpfiveLOHEb3xsv+9wPBG5tOCBok2cisyHQMNQBCmlVrLeQ/gZ370pXB/Xh+UW839TLZs9DrWGedFiJQJMpXbpauGTmLhoU+coxv06YNNqXT80JMTzt9uUXT/DUH4jgUjdHcTnScQX/bz2JNeAPrJdTc4/9VizmG34PTFRyuBo5fDSX0hP5Ds330G7b0gb8MZepbk58VW+hGLTWbvxtVO9Jyn044LBsrVs2RvEVoie9TVNLWOM+5nHXrY7WoYV9z68MaBsjGuybYVQPe1EMyKe0qn1FrcbmMAOLsDzT8niLvOPAM2+oMjczA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByMmvKB13x5Wxg2BRa20ljfrQsQtHIQmlzZn+NyZXVE=;
 b=BTNGH3ewJWLwkKKaDYutg69t24QPaQeB0aFlqKV0ZFDfQ6072h7eO3QlNrRgxPv6/y/qjnyCXVEjfNSiENNny9YorspvIC7O4MYetlhNitazF2AtYPP4n6901KXnAUHHco5TPC71uTfav3r63lhuRWPeAurk+7ZoIcJMcjqLHa4=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OSAPR01MB1778.jpnprd01.prod.outlook.com
 (2603:1096:603:2f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Mon, 25 Apr
 2022 02:03:56 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::205e:c981:34d8:dbcf]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::205e:c981:34d8:dbcf%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 02:03:56 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Subject: RE: [PATCH 08/15] dt-bindings: serial: renesas,hscif: Document
 r8a779g0 bindings
Thread-Topic: [PATCH 08/15] dt-bindings: serial: renesas,hscif: Document
 r8a779g0 bindings
Thread-Index: AQHYVJKktSg+Ihn+L0yQFinMHfjtCaz6H+CAgAHCJYCABAYIEA==
Date:   Mon, 25 Apr 2022 02:03:56 +0000
Message-ID: <TYBPR01MB53412A6A7C2B753F6A655762D8F89@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com>
 <20220420084255.375700-9-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdUjhdvsNFqJU+9p=BEq_Jnek=MT5RKu0Dg89nMB2gpMgw@mail.gmail.com>
 <CAMuHMdUZGhPrJuHHJVNKufRH0G_S1v_eHV8qaWqsMq_cwvtL1A@mail.gmail.com>
In-Reply-To: <CAMuHMdUZGhPrJuHHJVNKufRH0G_S1v_eHV8qaWqsMq_cwvtL1A@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45c1e627-d249-46ef-fc13-08da265fdb1d
x-ms-traffictypediagnostic: OSAPR01MB1778:EE_
x-microsoft-antispam-prvs: <OSAPR01MB177818D0321375CE2E84F22FD8F89@OSAPR01MB1778.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 02Mdnk3ceCByYWHuv+QTt/X1m6toBpSUzFPza56OoygIUAokMq1B4YxVAgAIYCt+30DQeFrBINWtHNdJS0zZYeHINUumQLU5aH8GJenM3bFhHklwoxEKZ1qf2+zu4JKW8jJR0bsibY+1eAzU/4IJi6o93/H4FIkshzu3+t2aW0vzlDpR5I/gxZahtv9rAm2sFxuzdp3CVqgN1gVOldutuSymCBmDF8U712EQVNXHq61yRP5T8WtzuapswniWmiGohAcE5Pe8sGPwYFvOk6oFarXyjaefQRqCVIqqoOSBU0Nw9EY1o9GCPHQ+N/482Be44Q3B4eNwi6k4y8EaICEYkO4SGNlKIfcXkF3I5T4gtKkIQc7mi+UvkdClu7Xk85WT9WO9GAv7aurF4mG0jkxKSiC+yn/fElfM+WCP5U68W7t9qiFtWPX8z90XOdCvHSPYVaXv9dsF01oYol4RnZPZzFwLpmP0cWQSEPl/HMXDd6uisDJ+WkFubxFuReeIL+s5w3R1uugXw1hWG26HPXs57knVjj2nhV+QPsxUAm3lAoqLgvJ5GmUhEHnoOWnmUnocHC3y82XDJMPBJwYQsxfYUIndZpfwxHKWKAxBttOHWCc4UtGoTTO6yxe25Xnf0oqTaVJhVD7rv3jQdzoz9C2DHdVRflvxfMZOMSJKA8H3Ropq6ZjRj/DOakdyG3jgvdiUQKPwdMc+AUhxMnYkVx7nQA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(76116006)(66946007)(66556008)(64756008)(66446008)(4326008)(8676002)(66476007)(52536014)(55016003)(5660300002)(8936002)(4744005)(9686003)(6916009)(316002)(86362001)(33656002)(54906003)(71200400001)(6506007)(508600001)(53546011)(7696005)(38070700005)(38100700002)(2906002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NDl0SVJVSERMSS9rajBCNktiNk5qWHNpcE9ieTM5elA2dk1zUEFjY0I2ZTFE?=
 =?utf-8?B?QUtQeUhOR2g2Yk5DTmpUYmdSS2xHNjZGTFVDMWNQM2VpdzRiM2JRNXNrc0JZ?=
 =?utf-8?B?WXpxL0JoYmdLblNQWkloRmFuOCtleHJLWld6N0dmKzRhTGVlWlRraHVPVWU2?=
 =?utf-8?B?VGNuZXRnY3lHZ0pJdWRTcWJnYTVSS3plbUEvMnoySHpBSXZVWFU0bnhsVzNt?=
 =?utf-8?B?cXk4QnFqekN3MXhKMkJsRTh0dDJUalhRczdrRWdrYlROTVFGdFovWHNUVUZC?=
 =?utf-8?B?MFA1OGdQZk1lZVphbWR1d3VYaFZnaHZSUUswdUp6TWZRUU80MzFIQ0E0N2xn?=
 =?utf-8?B?Z2VEcHlVMHhBQ0daRW1RWmFKS0xHcytTVFY1ZmphdUtsVWYydU9yMWZJRXY1?=
 =?utf-8?B?TUl2RGZjUElzaVlaeXcxM2c0ZU1SdjJKRVU3K01hbXJ4WnlRdkJqclVSNGxN?=
 =?utf-8?B?VExtaTRtSWFZY3IrY3ByZ0p2N2s5QnlyU0J0WC92aEtBVTN0MVBRZ2hsc09z?=
 =?utf-8?B?OXNXS2JEOFVGUjZzenVlNjNoZDlyRU54TitaTlBnb0t5bHh2M1JLRC9GU1po?=
 =?utf-8?B?MTlxL3RvVjk5c3ZsTHR6NVpIazRTWmg0RmJWYzhodDVReHJtS2g2eG51aTZ6?=
 =?utf-8?B?QkttQVNieVQ2MEc0QnRQTU12WVBHUXQvUVlCVDNPNkFxUmxuK2lyZTZjV3Rl?=
 =?utf-8?B?Tnp3T09qOVRzckpBaEEwblF0STNlYmtTV3k5VkVnY0ZJQmhWdUxGMGpncnht?=
 =?utf-8?B?ZWszOStKaS9RbStsTzZQRmpmZ2txa3VoZ24vRHI5alJhSCtVTmJseWR4Z0lZ?=
 =?utf-8?B?dndXZE1RTEpCbjRDVHBPRGJoVWVQY2hoWEtKajU1eVZtQXEwVTQxeU5qSk0x?=
 =?utf-8?B?VEVmdUVuQ2djUlZ0NExvWVd1Qktnb2xtRFBBQlEwNnE0TkRxTkprUUlYeXkx?=
 =?utf-8?B?VGVyVVhOYlM3NEt4WDB3ZTlxTGU4bThWbVFLc3V3Z0NJclo3UXl6Wks0QlRK?=
 =?utf-8?B?ZDJYL0xnU3VzZXNoNVlCNHNVLzhpREloQk1PSk1hZHR0bmNKeDVuR2FGYTI0?=
 =?utf-8?B?N2Q1b0x6N3BsaXlEVytOZ3dubkVHcUc4NTd4QnJqVTlSaUFobTdsMDc5U0RK?=
 =?utf-8?B?dUFTQm5leTRoZlFiL01jblpPRVJYT01rN2E1bnlaZnNERllZZlJYVEU1S3dX?=
 =?utf-8?B?MUd5T3BZNXY5RmpFVS81bjZyZG16eGNEcEoyTSsyUS8vQUNXQ2Rpb1VKWFRM?=
 =?utf-8?B?VUpzeHJReW5DZkoxWXBUWTZhQTlraDdBQmF5UmQ0UXpTd3BXamFkUnlnSkZk?=
 =?utf-8?B?cGlhMVNJT3F4TzVFWVBhKzFBczk4TG9EZ2JSdnRENnhIWXp2U2o0QVpOZURI?=
 =?utf-8?B?YmpHQ25OU0QrRC84UjRnOFU5b0l6WmNjNU04TGFRL2hxQS9qOU9jOVBGVGg1?=
 =?utf-8?B?ZHF6NEowbXZRVHc5aUVmbjMvZmtzVTNQOWR3Y2pUcGYzSEZ5dTNxMCtPWlZa?=
 =?utf-8?B?VG5BV3VJQUpjWkNSNlRRejFPeU1BVTJwQTYyOG43eVExa3g5elZSUlN4Mk5i?=
 =?utf-8?B?ZkRiN2RsVVhRdHRjWVJ1UU9HK3ZVWUJ2NmpydjVJZ1RMOUlxTFAwRU54ZCtn?=
 =?utf-8?B?bEpnY3oyZUVvRjdVYkgzaWRoY0tzZ2VHQWdHRXFndUtNNGx1bXZ2TjBUK3l4?=
 =?utf-8?B?bjgzYnVpUTZWWTJRZjZKLy9qSEpCWVNUSGFmazBGTTQybE01OUQzRjVkcmYx?=
 =?utf-8?B?MHE3SFZabjg2UExqNGZWRjhHK1cvWnZOZ0JaSFhLc3Y1RXlDVVhvR1JhY2ov?=
 =?utf-8?B?Tm1SdVYyOHQ3dy9Ya3hId1labXdxNnBYSzhiNFZwSzNjbnZEd09HYndhNGgy?=
 =?utf-8?B?SVR2ZzVVZUpoRXgyQzJWRFgrZDlCNHFSbEtmYTRWZ3hSMUhlUlJkSEw0eVE1?=
 =?utf-8?B?ajN6VERxa29PT091QkczYzg0NXRMZ1pVc1U3ZlJmQ1VmcVU0TnpKakFQUk1q?=
 =?utf-8?B?VG9UQko0M2Y1M1ZhWjVFSnBsdzBlbHhwb1VBeS9NNythdnluWFNMSGYvV2NH?=
 =?utf-8?B?aC9jRkJVK2NEUDZCODRtMUlNK01zVmUwRXp6S0NURzlTR0U0T1dINDZUdHp0?=
 =?utf-8?B?d1J4cC9wVklQYnBkRUU5dFBtUjBoVXpwNzdxQTQ0MjM5ZGM4UEFYdk9JMVdH?=
 =?utf-8?B?eTM4MW5yR1FSMlVSeWhkRHU1cmVsOHRVd0g3ZTN3SFdYNDFyVG1LdDkrK2pP?=
 =?utf-8?B?SWVYZHVmVkNERVNweGFnbkhtSzJNTnEvN2dGOEpPNCtvMU5FeDhLdjVNeGpi?=
 =?utf-8?B?Uk4yZVBMd3l3TEhVeDVLNWhTUVI4SHBjbERxdUkvT21yeEdSVEdMeW96QzF3?=
 =?utf-8?Q?YZ5OIZ8u8SabA/fdskFvnUQV5MUp182EolC5oIikodNGJ?=
x-ms-exchange-antispam-messagedata-1: NpiM346I5JbVfhcfHU1DC+MMscdjtb155TE=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45c1e627-d249-46ef-fc13-08da265fdb1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2022 02:03:56.5801
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +qeF2tIFN4f13nOopcQWeS5aeT03IfZNxFDKzIc4GatrpWxkaVAbi/kmZDgjDDvrjEdWmgP8N/nQWem6TRF3R/ijnFZNYqNJ/Q7zvuwF4S4+gjDnOu2eazPm4/0p2mpF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB1778
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogRnJpZGF5
LCBBcHJpbCAyMiwgMjAyMiA5OjM2IFBNDQo+IA0KPiBIaSBTaGltb2RhLXNhbiwNCj4gDQo+IE9u
IFRodSwgQXByIDIxLCAyMDIyIGF0IDExOjQ1IEFNIEdlZXJ0IFV5dHRlcmhvZXZlbg0KPiA8Z2Vl
cnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOg0KPiA+IE9uIFdlZCwgQXByIDIwLCAyMDIyIGF0IDEw
OjQzIEFNIFlvc2hpaGlybyBTaGltb2RhDQo+ID4gPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVz
YXMuY29tPiB3cm90ZToNCj4gPiA+IFItQ2FyIFY0SCAoUjhBNzc5RzApIFNvQyBoYXMgdGhlIFIt
Q2FyIEdlbjQgY29tcGF0aWJsZSBIU0NJRiBwb3J0cywNCj4gPiA+IHNvIGRvY3VtZW50IHRoZSBT
b0Mgc3BlY2lmaWMgYmluZGluZ3MuDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogWW9zaGlo
aXJvIFNoaW1vZGEgPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPg0KPiA+DQo+ID4g
UmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+
DQo+IA0KPiBTb3JyeSwgSSBzcG9rZSB0b28gc29vbi4NCj4gDQo+ICJyZW5lc2FzLHJjYXItZ2Vu
NC1oc2NpZiIgc2hvdWxkIGJlIGFkZGVkIHRvIHRoZSBjb25kaXRpb25hbA0KPiBzZWN0aW9uIG1h
a2luZyAicmVzZXRzIiBhIHJlcXVpcmVkIHByb3BlcnR5Lg0KDQpUaGFuayB5b3UgZm9yIHlvdXIg
cmV2aWV3ISBJJ2xsIGZpeCBpdC4NCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGEN
Cg0K
