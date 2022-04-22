Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE5650B2E3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Apr 2022 10:28:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353044AbiDVIb3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Apr 2022 04:31:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352644AbiDVIb2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Apr 2022 04:31:28 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2091.outbound.protection.outlook.com [40.107.113.91])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDB3952E71;
        Fri, 22 Apr 2022 01:28:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V5LPscml4/p6LFkW+0bCHD4OuUcmt+B1FDeXxBxLfunk90cYM1DLebdtbzUunAMhiUKOjj8HYCX3b5DSB3In8ZWEhNx1Lf5fYIL2QrNfZFkpbgyvVQzAtFJ0+H57U6b4O5p4kognQSuhUzk0Eem7VagwjeiNaHBBnCzu/QoUj1/TbGdRKMRTTSM4WTubWcw/P7T8NuSvPkMj4siL7Tf+Id8tnN5fiivlKZhxZJbJrTXNdHL/oj6NxfdZrabWQXdOoyZgKW23RVjcCS8E5tsNdfbUW0SaI3j6sL0v+/43iKVVycwQbTxQpl5XUsOZtd6vdUYviJgye3ncbSz/D6XpPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=88BORK0qdSP7MTYPRVQ4T6vyAk6EpJs+Ciw7hcjTMPs=;
 b=asqqrWFBC83ZT5EkJEeFPeVCRaonZ3AB/JChGLpsXBnXpgB0wNQJAxCpcWIuxdNN6wHfXoIQ0Adtg8DNtQjeEMUvnHfAc3tDUTSdecKT/ybOyxRWtJ5BbrirAJANs3diabFFd4r8/IbUJuAaNc/r+c+6DeL61oZXI6JxAMvULWW2vflH2TI1Q2jCsn8sUYWhTdv/6iZrWCcT+yLT5NNPnNGEorMqcceXihlyI7LRJrYeevKYhimshvVnsOgjTVsZ0rmW/i60qMixzv1RodhXw3+zHWiJEGGHtpIFSRj7yT1A0dAZ9qsThBziiGHkwZ+5w3CZItUrmaP6yX/z18MNJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88BORK0qdSP7MTYPRVQ4T6vyAk6EpJs+Ciw7hcjTMPs=;
 b=QI0+TU5oY+qWJQB/H5Etk1yba4E8mDnhKdfPQ/CnGDGS8WVyyIBBGxCXkNGVqzt8AbnnLZyidqH5lL3Ne7UiQgW6ciTLfb/j9kL2gBdsPMSLLv4PTTICKQyUFTpomjgySpTx0puzUWAc1VFKyXjcMHghHs+/KeLN2PBTpR81LqI=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by OSZPR01MB8848.jpnprd01.prod.outlook.com (2603:1096:604:15d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 22 Apr
 2022 08:28:33 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244%6]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 08:28:33 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
Subject: RE: [PATCH v2 02/13] dt-bindings: serial: renesas,em-uart: Document
 r9a09g011 bindings
Thread-Topic: [PATCH v2 02/13] dt-bindings: serial: renesas,em-uart: Document
 r9a09g011 bindings
Thread-Index: AQHYREyO+qhJgDbUCEGZVAv5++WRHqz5cfsAgAI33IA=
Date:   Fri, 22 Apr 2022 08:28:33 +0000
Message-ID: <TYYPR01MB7086BD705F91E855F0D3FD45F5F79@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220330154024.112270-1-phil.edworthy@renesas.com>
 <20220330154024.112270-3-phil.edworthy@renesas.com>
 <CAMuHMdWaiAZNWmU5itJWJy3fEMmR1hQc7QRWpe6mi3AYkSewgw@mail.gmail.com>
In-Reply-To: <CAMuHMdWaiAZNWmU5itJWJy3fEMmR1hQc7QRWpe6mi3AYkSewgw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 467146d3-138f-46fe-1787-08da243a16f2
x-ms-traffictypediagnostic: OSZPR01MB8848:EE_
x-microsoft-antispam-prvs: <OSZPR01MB8848FDAB161215D9CDA9A98CF5F79@OSZPR01MB8848.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IJC9fcE7q4bWp8UHTAYmI64PRsqYRHpvCNWsu9MwEa0xj4Jwf94Hptrx4XTec13tL5Fn0KpUr/IxriDTIlb222JwZknMZgBuGrmsT8SXzSalzDEI94MyEMxjtUZHFSqp1U4xJdUfN2hS0shfSaVFPClPLu1qGAd99MgWGPvRnE+x86Oveo+WlBquuL2nivkMNlCtC4BlfdSxmKdngyWI2SoRvSbBC0kYvSd1ExF/uxQs36Z00gucFlINkFpi5if35bOVjb5i8hs03SIFAcOOGa1oKLNXUV1cMU00t1HQbtm5roCd1fGJxxEm5O+e4eKWQYkcNhrFs6OXQgVfz6JAayc8NoaFrTfMApcRZ/chSYk4cB9RduQRy1P7bW3VxEPgmt8gKooL+O/1QXoUpOcA35GctPZR8/GCveE9y8pW8WabZ3Tr+YNSPTrXxM7DKQCMA+BlaWNQ+4JbJxRK3Z/Y8i512rGqoB6co/U3nVGeRpU+eK+GwqFuFx1RDVkqPSPJJwkdiSe6NwO90O5ELYoT0IQFdSbzxto7bLNUarP0Bz70lTXsYY5O05f52c9x17Nw1Cj68+iH02FY9MYQVkH/RkXIThBC1ukmD610xp6LrV9R3d/dx60YYf66arFIvnR7cVRd5yH6S967QSvi01CnVvthJ5c0RjK4DFNBdpDCfORBkFL1nEG+TIXEmKGwPBcKUBj8G0S2mwOH3BmO63EShQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(316002)(6916009)(6506007)(71200400001)(54906003)(83380400001)(107886003)(508600001)(5660300002)(33656002)(7696005)(9686003)(53546011)(2906002)(26005)(8936002)(52536014)(44832011)(55016003)(38100700002)(86362001)(38070700005)(122000001)(66476007)(66556008)(66446008)(64756008)(8676002)(76116006)(4326008)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bHdCWUNYKzRzWlJyeTBzdTVKVDhNdkFuUk4raEk0VW9WdkdMZHlwdEExa2l4?=
 =?utf-8?B?cWRiZ085a21LbjA0TndGcnRDUHVRREM0SjFDaW9tVWRlam5Yd1ZwVDRrRTUw?=
 =?utf-8?B?SjNBUVVCa3poTmp4MDY3KzZvMkFGT3E4OWlWbU9aZklvTTQyQlhGSTlyRm1T?=
 =?utf-8?B?c1hZRGNoYkVJWFB6ZGRmWFhGTmlmNzZLYjZoVnRBWjNjK1VuUnpyWlUvMmVY?=
 =?utf-8?B?M0h4WDFuSjhhcEYwT1ZSeDI5ZHorR3hIam54blkrN3JFNmJOMjY5eGNxTkU4?=
 =?utf-8?B?QjYrQzB1WWFMVGtsc2h6dW0rYUdDQ2h6Y3p2R3I5RlZybzJkSTUvTHBxV0hE?=
 =?utf-8?B?WXBMbDZMWGp3TnN4NFBBQTgya29WVDh4YXlhWjlGWmpBL3V6d2lsTllZczIw?=
 =?utf-8?B?dGh0OVJDNnRlSjZvSzRCTkt0eHRMb1RQbCtPZEtFbVErbE5zQ1hPM2c5eXVE?=
 =?utf-8?B?UUY1SHhYL0RrNW03K09pdC9rTkNEdlZuMDF4UnFBOXc0VW81U3BNK000Sjcr?=
 =?utf-8?B?MFF4YXFGZS9NNGhsZnlBZUdpd3VDTmxlaStVSHpsaXNiQXFFUEpIMVhLamRE?=
 =?utf-8?B?eEhlSjh4SzFNckNjbTg5dWcvRHlXY2NyNTFLMUpCaUxvc2o1QmJPeG91MFY5?=
 =?utf-8?B?UFZZV1FrbXFwaHBweGpVWGpvcHN6Q1hJd3RhTmJmRGYwWVFUSFZ0Y0dJN01R?=
 =?utf-8?B?Y1VvREs2bithOGxBcC9HSEdReEQ2MG5SOHI4R0kzS1NiNFFrR0dUZDVMTGEw?=
 =?utf-8?B?WDhIRUQxOVJBVFJZc1FVVmt2ZTZ6M2I3WG9EY2JsSG9LeElCRG1YWmdXWHVI?=
 =?utf-8?B?aGFiSFBRNkRQNU91eitiQm1rS05IdG1ZWEMzVkNIMmRmaUt5dnNxeFB6dWdr?=
 =?utf-8?B?Vkltc3FiNlBiVEc1RDNtQUc4SWprbUVRa1lSeS9SZUgzTDNUYlBaZGZOVTJY?=
 =?utf-8?B?SmxYNDloK2tuV1BuSS9rQ2t1TGdmRWgwTUcyWTZ4Q1MyRjF4MzJiV01CQ000?=
 =?utf-8?B?dm1kdUtkbDNmLzN6L3Y0V2VpUkpkZ3ZpNVBRcHhXMUJlY2FiRHFmUnFUYk5C?=
 =?utf-8?B?YUhtVHROQ3ZucG5DdlFkTjdXY0hnUmRibFFUdDlDb3huT3pkTndKWlhubUVr?=
 =?utf-8?B?d1ZxK2oza3F0TENQenQ5ZGFqcEhGQ2lMamgweHk2eDNMMkE5N1BQa01rYy9H?=
 =?utf-8?B?NHRYTzhHZmh1dk0rTzhEbFo2TUVvbnFSYXlHcExHV1gzcm45NkRYTDVHVFVL?=
 =?utf-8?B?YTM1UVVqQ1A1UTlrcURVdUpXenliOW5Qa2h6dnFwYm9pQkFMRDFOZlRzb1NH?=
 =?utf-8?B?TFhra2JSaGFOdnFpWXJWOHZ3b3JqTnhWaS9iOTJYMnFSUVZhV3I3WmV5R0c3?=
 =?utf-8?B?L213VmhrNUZ3Zm8xckx4NitpNTRyRDdXaWVnMERjTzhDRk1qOFhiYlRnM2JZ?=
 =?utf-8?B?MG52UGZ0Rjd4K2xGMUpGS09FNGw5NlhMWFNmbU4vOThOYU9Ha3YyZEZ2bk1u?=
 =?utf-8?B?N1pqa2l5V2hiOEtTUjY2YnFwNXVHL0xtUWY4U2FocEhEN2pDQmVjUFJuTXBD?=
 =?utf-8?B?aXhnekh3bFZYQkFtdkFDQzQ3ZU4rOE1qU05BNWVLdW1QM2ZnUnlGNHpsVk9w?=
 =?utf-8?B?T0V4UzJUc3NUYzF1elB0am50d2diMHdUUFZ5cStacWVUZFBLQXU5dU9MTzdJ?=
 =?utf-8?B?eUdhdHpqNWllZFNpYlFPYTJ5aDRmT2ZEMnJtbzVScVhENmM2ZTl2azBsZkFa?=
 =?utf-8?B?T0VUN1VrRld5cStpUlp1bzdVVTJNVTYyUW1OV0hYaTcrUmtPcjV6YU5CSncz?=
 =?utf-8?B?bVBSQW9oaVYvbiswN1hyK1RxeExaVUZGcUlSdFV6TElRcnh1dXgrb1ZSS25M?=
 =?utf-8?B?SUlEMTRtNWlocURaaitpcndIK3JiYlcyZEc2eDBpL0Y1UzhCdWcwdnlCUUpy?=
 =?utf-8?B?UzlPWFlaSXhwdzVXclZkZmd0Ni95RWpKUUZra0tBUmFQNm1Ec2JQWTl6NVJ3?=
 =?utf-8?B?VUd4TlowaWdCOVlyODZZcXQ4amdsdWl1V2t3OXh1K25TMGFUanZ2Q1loTklB?=
 =?utf-8?B?TTM4ZW8zLzdLRGExaWhDSC9DWW85dGhiSzg0YWx2WHhaM0FwY3pSVDJCbGN5?=
 =?utf-8?B?c3pEdjgyeFR4NXZGMkJ6aGpuL3RsWjFOd29lT2ZwaWJGbi9vYk1hVkFuanBJ?=
 =?utf-8?B?T1ZNQkpiT09vQ0Mxb2dkZ20wbEFkdFIrS2lTU1IrQVRkK3JXR3JldVVuN2NW?=
 =?utf-8?B?akN2MzVhYWU2ektDTHpSTHRObUxxSWU0NkxDbjB0YjZITjhXbWlzdldqQnNs?=
 =?utf-8?B?Uk44M1NiWnc3Q1YyTVp3QlJUNyt0a2RyOXRUUlVxb2s5bkxYSFQzOE9zdDJ6?=
 =?utf-8?Q?NwUfnn9YmFheJq7A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 467146d3-138f-46fe-1787-08da243a16f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 08:28:33.7545
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QxNoNiYZbUQ0P865LEgx0A4J84kWkX6qeyUNXsNUeiLl1rcx9J6ZhsnAotF2Sdk+hDV7Ymn+V+RZQIUpxww3P+jVPUySFvGnsq1aZoJg7TE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8848
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCih1cGRhdGVkIEtyenlzenRvZidzIGVtYWlsKQ0KDQpPbiAyMCBBcHJpbCAy
MDIyIDIyOjI2IEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToNCj4gT24gV2VkLCBNYXIgMzAsIDIw
MjIgYXQgNTo0MSBQTSBQaGlsIEVkd29ydGh5IDxwaGlsLmVkd29ydGh5QHJlbmVzYXMuY29tPg0K
PiB3cm90ZToNCj4gPiBUaGUgUmVuZXNhcyBSWi9WMk0gKHI5YTA5ZzAxMSkgU29DIHVzZXMgYSB1
YXJ0IHRoYXQgaXMgY29tcGF0aWJsZSB3aXRoDQo+IHRoZQ0KPiA+IEVNTUEgTW9iaWxlIFNvQy4N
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBoaWwgRWR3b3J0aHkgPHBoaWwuZWR3b3J0aHlAcmVu
ZXNhcy5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5l
c2FzLmNvbT4NCj4gPiAtLS0NCj4gPiB2MjogRml4IGR0YnNfY2hlY2sgYnkgYWRkaW5nIG1pc3Np
bmcgYWx0ZXJuYXRpdmUgYmluZGluZw0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoLCB3aGlj
aCBpcyBub3cgY29tbWl0IDdiYjMwMTgxMmI2MjgwOTkNCj4gKCJkdC1iaW5kaW5nczogc2VyaWFs
OiByZW5lc2FzLGVtLXVhcnQ6IERvY3VtZW50IHI5YTA5ZzAxMQ0KPiBiaW5kaW5ncyIpIGluIHR0
eS90dHktbmV4dC4NCj4gDQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3NlcmlhbC9yZW5lc2FzLGVtLXVhcnQueWFtbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJpYWwvcmVuZXNhcyxlbS11YXJ0LnlhbWwNCj4gPiBAQCAt
MTQsNyArMTQsMTQgQEAgYWxsT2Y6DQo+ID4NCj4gPiAgcHJvcGVydGllczoNCj4gPiAgICBjb21w
YXRpYmxlOg0KPiA+IC0gICAgY29uc3Q6IHJlbmVzYXMsZW0tdWFydA0KPiA+ICsgICAgb25lT2Y6
DQo+ID4gKyAgICAgIC0gaXRlbXM6DQo+ID4gKyAgICAgICAgICAtIGVudW06DQo+ID4gKyAgICAg
ICAgICAgICAgLSByZW5lc2FzLHI5YTA5ZzAxMS11YXJ0ICAgICMgUlovVjJNDQo+ID4gKyAgICAg
ICAgICAtIGNvbnN0OiByZW5lc2FzLGVtLXVhcnQgICAgICAgICMgZ2VuZXJpYyBFTU1BIE1vYmls
ZQ0KPiBjb21wYXRpYmxlIFVBUlQNCj4gPiArDQo+ID4gKyAgICAgIC0gaXRlbXM6DQo+ID4gKyAg
ICAgICAgICAtIGNvbnN0OiByZW5lc2FzLGVtLXVhcnQgICAgICAgICMgZ2VuZXJpYyBFTU1BIE1v
YmlsZQ0KPiBjb21wYXRpYmxlIFVBUlQNCj4gDQo+IFRoZSBhYm92ZSBsb29rcyBnb29kIHRvIG1l
Lg0KPiANCj4gPg0KPiA+ICAgIHJlZzoNCj4gPiAgICAgIG1heEl0ZW1zOiAxDQo+IA0KPiBIb3dl
dmVyLCB1bmxpa2UgRU1FVjIsIFJaL1YyTSBkZWZpbmVzIHR3byBjbG9ja3M6IHBjbGsgYW5kIHNj
bGsuDQo+IEhlbmNlIHBsZWFzZSB1cGRhdGUgdGhlIGNsb2NrcyBzZWN0aW9uIHRvIHJlZmxlY3Qg
dGhhdC4NCllvdSBhcmUgcmlnaHQgdGhhdCB0aGUgdWFydCBoYXMgdHdvIGNsb2Nrcy4NCg0KTm90
ZSB0aG91Z2ggdGhhdCBwY2xrIGlzIHNoYXJlZCBieSBib3RoIHVhcnRzLiBUaGUgSFcgbWFudWFs
IHNheXM6DQoiY2guIDEgaXMgZm9yIHVzZSB3aXRoIHRoZSBJU1Agc3VwcG9ydCBwYWNrYWdlLCBz
byBkbyBub3QNCnVzZSByZWdpc3RlcnMgcmVsYXRlZCB0byB0aGlzIGNoYW5uZWwuIi4gRHVlIHRv
IHRoaXMsIHNlY3Rpb24NCjQ4LjUuMi41MCBDbG9jayBPTi9PRkYgQ29udHJvbCBSZWdpc3RlciAx
NSAoQ1BHX0NMS19PTjE1KSBzYXlzDQp0aGF0IGJpdCAyMCwgQ0xLNF9PTldFTiAoZW5hYmxlIGZv
ciBVUlRfUENMSykgc2hvdWxkIGJlIHdyaXR0ZW4NCmFzIDAuDQoNCkkgdG9vayB0aGlzIHRvIG1l
YW4gdGhhdCB0aGUgVVJUX1BDTEsgaXMgZW5hYmxlZCBieSB0aGUgSVNQIGZpcm13YXJlDQphbmQg
c29mdHdhcmUgbXVzdCBub3QgdG91Y2ggaXQuIEkgYW0gbm90IHN1cmUgaWYgdGhlIERUIGJpbmRp
bmdzDQpzaG91bGQgZG9jdW1lbnQgYSBjbG9jayB0aGF0IGlzIHNwZWNpZmllZCBhcyBkbyBub3Qg
dG91Y2ggaW4gdGhlDQpIVyBtYW51YWwuIFRoaXMgaXMgYSBiaXQgb2YgYSBncmV5IGFyZWEuDQoN
ClRoYW5rcw0KUGhpbA0K
