Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08C5650B41D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Apr 2022 11:32:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1446060AbiDVJef (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Apr 2022 05:34:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1445903AbiDVJeV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Apr 2022 05:34:21 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2120.outbound.protection.outlook.com [40.107.114.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CB3654BD4;
        Fri, 22 Apr 2022 02:31:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gg1AZAusZ1C8pUmorQN0tNLwK3bpJjQrDMwWDRND5/jk6OcO1NgT6KNml1gOPvt4a+iEpPKizUT5KB/6P4RKkwC1zF7cERMsAuZ0RqohlurxrBIB6Kf6m2416dNLshVtPABmRpTCFLaCGwHa4m6KSAs44ag7KW9i7cyX6+uh1dKvlyQm1w6Mp6A3IH3yFGv6hmwMAbQH6IU3sq7/xwCqsOyX96fsnBDp5iPapSsL7dj0YQomKLNcADId3IyxW2JG2gx6Pyxvc9r5mOzz7jNSryDB7X1XYXk8d3Oe0RVZ6LdH0+m3pvg97YcyDlYaGLYs+/F4ExZpUtsl3MicIe/F3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDHt21G+eTCk7pZHvP2jJmYm59Am9RD7hIXWg55KA3o=;
 b=KT8sWo/Rxukm8b7dtHFZuelJdFDsZmijr0k/80tK5QLkVBFVuN7FFrIEaExyu6gIDBOA3yf7FrZkwVkheCPcJGc48dhjsJcJ3Fm8X7BWkYoOYQBdrPvu1mrBsKA7OwOAdSRdA5CL4cTwhB9BuDlfz91K+WNq8Nval36ADbS5yPs0+M/VyU6XKjsktQCJm9I6XKgRjK/n3R1y9AUbu/LWWCiwSPAt2EarOcsnfe3nG7HNmvJy4CsECUMAO/uVgeK9Yq1HcmvmxJyvlsp8vfa786zbkggOQDZJQX7pLiasSdpizepT5m6Mf0DfwkmS0URFIb8xB7qEYWDaIordqwnBQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDHt21G+eTCk7pZHvP2jJmYm59Am9RD7hIXWg55KA3o=;
 b=Mm5sDfAssLiY/oSt7XV9KZhyx9PqOvYZqXeytmV3IAambgQ6xSWkqZqd0HeFtWzNZ43/1UVwhusx32g+s1CU6kCkBtK9fSTfavKcerGRRmubxWMeZBM+z65wJDB7ru4CwO5cmJr7lZxNjFhXOGsPeR7GOMDU7lTBZhCNHyzmm4w=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by TYCPR01MB10180.jpnprd01.prod.outlook.com (2603:1096:400:1ec::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Fri, 22 Apr
 2022 09:31:17 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244%6]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 09:31:17 +0000
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
Thread-Index: AQHYREyO+qhJgDbUCEGZVAv5++WRHqz5cfsAgAI33ICAABgdgIAACVbg
Date:   Fri, 22 Apr 2022 09:31:17 +0000
Message-ID: <TYYPR01MB708615E7E58B7833184B5CDFF5F79@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220330154024.112270-1-phil.edworthy@renesas.com>
 <20220330154024.112270-3-phil.edworthy@renesas.com>
 <CAMuHMdWaiAZNWmU5itJWJy3fEMmR1hQc7QRWpe6mi3AYkSewgw@mail.gmail.com>
 <TYYPR01MB7086BD705F91E855F0D3FD45F5F79@TYYPR01MB7086.jpnprd01.prod.outlook.com>
 <CAMuHMdWtLxdXztfLxSvb57WOO46qTW6c+fD=P0O5qicop=b+3g@mail.gmail.com>
In-Reply-To: <CAMuHMdWtLxdXztfLxSvb57WOO46qTW6c+fD=P0O5qicop=b+3g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97dbe151-de3a-40ad-cd62-08da2442da07
x-ms-traffictypediagnostic: TYCPR01MB10180:EE_
x-microsoft-antispam-prvs: <TYCPR01MB10180019DE1013B6DF697CF7EF5F79@TYCPR01MB10180.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3vZKUwS6Qq5b1N9TcWq/n6iFGKTYUfWqg9zyykYNkf5ewrDtD6a6o1TeHY7i7Dgaliq29DcpspGOaUFzDnsAGnZ6ts2r4ah9UGWGJv2Izcv0EaVWaszchAVGL3fJ/AmHdGXbRtpU54fOpFPLKyli+GwID51WRYc5oe6iKxJd4ehLTZ2lYvAl7cEnAQfYgtD3AvLGamYYWR5drEV5VWdtdtr6hZ38XItKAmhrg8y23XSc5n3p35+gNfxO+x2CXsf2QwFTBBRgHPU5TBEAE2l0Z18L2Vi9GyIxKv9J9pI7lgrWr2QhiG+vbUWGRuXDwSkoOS6K7Y+YL2iZcJN9v+eNxDULHxR+664DwJ+vAxlSxD8goiZX4GDa2UhgpaGGUOhoQgCrvJlOD6L17dt7fBfbAOGNocsF/i3zQ4qIvk0GnRrMzqWi+xVvOJ0N4Ud4mMfIMn24jt5O1O/72KUwfuMUi7quDt42Bllq/jczObPY6aoM9kGRaKOzk90BbROFbz2hGCEL5xQkp8Sc4FB+WMo4uikcaQ6BffKCJPWJciEIPvIE+70LUQP0UyOgbAG4rpjUljo2nACgyyKh+BAjGtxdm7TnKGU2/B7LcN+7tQDiGwzwJXL/iCM8pk+wrMC3F36VsxATu6ezwWx9Wz0tN1fqnh0jLVe4iCbfG9yjQ0/vUQTGKzV/PVjBymKYymw9jkZDdRgk4EDV6KQA2nBH+KOFNQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(44832011)(55016003)(33656002)(186003)(8676002)(26005)(66446008)(66946007)(8936002)(9686003)(5660300002)(2906002)(83380400001)(86362001)(76116006)(66556008)(53546011)(66476007)(54906003)(316002)(38070700005)(508600001)(38100700002)(122000001)(6506007)(4326008)(107886003)(52536014)(64756008)(6916009)(71200400001)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZHhxMW0wa1hONHpydUFvZmFBS1d2OXErdndlUUhGU25USXU0aDgydFhnMmV1?=
 =?utf-8?B?SUIxTWJ1aFNmejhPV1BOc2oyV25COFVrVjA0NEZFVDB5NmRNWWtJMW11R1pk?=
 =?utf-8?B?bmxpOHRydUFNbXJDQk1kbC9FWjduMTZYcnFWbTFGdmVwZko5RU56YUxkYTEv?=
 =?utf-8?B?VnI1bUJRdEtjWksrMEtBM3ZmZ3pxb0NlWUYrTCt5UE1MbzdtanhtY2V6bktj?=
 =?utf-8?B?TitpN1o2cVg3MWdZcndQMnJVdXZQS2VweVU3aGEyUFY3cWl2M3hDQm9DUk9q?=
 =?utf-8?B?M1N5aDBQRU1uNjlEK051RUM0TnVKQm9tK0dhVGN3NW9iY0M3cG96OXhRelFM?=
 =?utf-8?B?OXFvSzBNVWVxZExXbkg1QVprZFJLUWdpdmtGMmxsZ0JtMVAxaVFhcUJZQmRM?=
 =?utf-8?B?dVVBeUQ0Wm1TZEJ4YVJSbjFKZzR1ejVoaWUzeE5LU0xsekZwM3ZKcjZrSGQw?=
 =?utf-8?B?K1Z5aWFMSmNIcmM1YWYzV2tJbTJwbXdWY2RTYUh5cFM1TS9mejFyZk5hU0pw?=
 =?utf-8?B?bTIyM0l2alZrSmxhQzdDWVdSWjg0WHIwSjBxbFgzanAwU3BTMkR2N0x6bTVI?=
 =?utf-8?B?eDFBMThnenVScVVtWDNYWU5lVDNOS3pGcityZCtHSU5LRWpseVNqYXdwNU9z?=
 =?utf-8?B?RjVaUVlTMERYSlB1MFVxcWNiMklwOHkvdGVxakZoWXBRTEdoYWE2RFFYVUxW?=
 =?utf-8?B?RmgvT05xSXNLMkFyMVN5R1E3bnh1YTdwaDBqUnh5aTBNSTNDTFpsbEs5TC9O?=
 =?utf-8?B?UHh3MXVKbkVVdGpMeTJVc1pOcGduSG5SOTFFZndOei9GNFZhTnV1NkY0enov?=
 =?utf-8?B?V0tKbkdrS1oyNWlIeHRYSFNqc2dIY2Z3ZFJrMU5rWWs4ck9yZ0hnZEpGZ1kx?=
 =?utf-8?B?WkZMM0N5MEdML3ZjelZ5NHRwZFZjayt6SEM1aUVySDdVU2NPdE5KQWh5UHlj?=
 =?utf-8?B?Z2ZPUGNXQ2g0a1VHS0RzbXNSY1dWZXo2cUl4eHR4R2t6b3dMMGtwSmJKQkVr?=
 =?utf-8?B?OXVuZTZ4b0lPaGxVRitiS29Vd1dWalQ1NmFxWTVmc2ZoSVR2bVhBZEdtV3p2?=
 =?utf-8?B?T3dOQUI4bFBrSXF2L1JCVHVXeTY1d0pEdVBsYzFhZUFUQ0x4cmJVRnAweTZj?=
 =?utf-8?B?QjgwUnNVUEVHWFdDbmhFV2wyU3dnWTZUMXkyTGVlSUw3QjR0azVtbWgrVjJI?=
 =?utf-8?B?VEpFcHNUUVlObUxGWi9YTHhLbEVDRHQ2QUhFbVY3emNHaEpIbVhteURlcUc2?=
 =?utf-8?B?Q21FeUJJR29BSVB4Q0xqYjhPc05wbE5HWUV4ZWh2TDNlZ1B2bkJrOWI4RWdN?=
 =?utf-8?B?Y1BMRnpaaGJqdWUzY25hM00yS1NSWDVpQWVkTnNUd21lRG91QTd2dVgyZUJs?=
 =?utf-8?B?K2NtMmRJeDNpZUJVUCtDUGNQOTd0VTJicDVqRmoza1E3UEVIWXFONDlWQlBm?=
 =?utf-8?B?Mmo4anUzOUZlVWpTbHlrZDE3RXoxU293MDlTZkQxZmV6aDNaMDVOR1UzK1Qx?=
 =?utf-8?B?Y1E5aHJSN0xwbEw5YkxyQ3JyT0xXTnR4UDltNU9qNDRuNDZHS0pWZklqRmd0?=
 =?utf-8?B?TS9RYnJ2RWgrUXNZeDNxaEhZTFl2SEkzWno1Q0ZQZGFCbU8rQjU5V1NvNHpR?=
 =?utf-8?B?SDlNOHNEd2JHSzUwVHB4bENWS05xYXp3WEpjd2ozeXQ1Ni9yNmFaQ3A0bVVq?=
 =?utf-8?B?WVVyQU5iOEw0YkpHdW14bFg2WTduUStGV283b1VOZHI5azRLTERtdndCL3FN?=
 =?utf-8?B?bFMvV1pDaG1rWDdBTGhqdFRVMnZ6cUtZSEZUcnN6T2RMMjVrNVdkNjNyTWxj?=
 =?utf-8?B?V1p6T1haaEVwMFFmL1FnV3lzUUtiWlFGNHNoeUFKZDNMaFo2S2VaaDhyYTZo?=
 =?utf-8?B?STg3ZmN3eXg2cDRPMm1LUVpseS9ZTFRtTHFmVkMxQlB4WmdLUTN3c0ZsV3d4?=
 =?utf-8?B?U1poNXVYaEozYUxiMDlFSS9ndTV1UWtBUi90NndoU3lGVysxSUxwcGd3VEh3?=
 =?utf-8?B?ZWFpampZN1BsUmhnQzV3amtRSEJlVkptcW5vaE1LRmMxT1ZYcWhxQjdqRThh?=
 =?utf-8?B?NmRxakJSMGNvMG5kcTJrR2ZxWGlCMGlXT3F4bDR2RnRpZGR2WlVQa01Sc0g1?=
 =?utf-8?B?VFZycmt0RGh3NjFQQVNmRk83YVVrZW5ROUVlWkRuS0tPRzZEY0Q5T1l5ZXIy?=
 =?utf-8?B?NE1haEI1dTJlMXdZTDNWNTAvOVByU21uRkRiWXZ4cGl1OG1MZ1JseXkvNkVz?=
 =?utf-8?B?MkluSlI1RW1Idnh2UWY3Zlk5UWtZRmlFSGdWWWlSYXdzQU1xMXJPTU1QVkZW?=
 =?utf-8?B?VHFEZ1JDbXVWZlBVL0paUlI2a2hCUzdGM2VTeVZEWE5QdnIveXFNR2hoeUJL?=
 =?utf-8?Q?wgzg+wBT/fSCdEkQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97dbe151-de3a-40ad-cd62-08da2442da07
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 09:31:17.0576
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2i/O1LA6heKt1MOlom3vEqqukDns9KkFRwA7JsOOz2XgWmApW0IyzBLXaFHeP0AmrZ24J5P4l4q5PNtTZmmFn1HLqL31YkG9UY15jJyPoTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10180
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCk9uIDIyIEFwcmlsIDIwMjIgMDk6NDUgR2VlcnQgVXl0dGVyaG9ldmVuIHdy
b3RlOg0KPiBPbiBGcmksIEFwciAyMiwgMjAyMiBhdCAxMDoyOCBBTSBQaGlsIEVkd29ydGh5IHdy
b3RlOg0KPiA+IE9uIDIwIEFwcmlsIDIwMjIgMjI6MjYgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3Rl
Og0KPiA+ID4gT24gV2VkLCBNYXIgMzAsIDIwMjIgYXQgNTo0MSBQTSBQaGlsIEVkd29ydGh5IHdy
b3RlOg0KPiA+ID4gPiBUaGUgUmVuZXNhcyBSWi9WMk0gKHI5YTA5ZzAxMSkgU29DIHVzZXMgYSB1
YXJ0IHRoYXQgaXMgY29tcGF0aWJsZQ0KPiB3aXRoDQo+ID4gPiB0aGUNCj4gPiA+ID4gRU1NQSBN
b2JpbGUgU29DLg0KPiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBQaGlsIEVkd29ydGh5
IDxwaGlsLmVkd29ydGh5QHJlbmVzYXMuY29tPg0KPiA+ID4gPiBSZXZpZXdlZC1ieTogQmlqdSBE
YXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gdjI6
IEZpeCBkdGJzX2NoZWNrIGJ5IGFkZGluZyBtaXNzaW5nIGFsdGVybmF0aXZlIGJpbmRpbmcNCj4g
PiA+DQo+ID4gPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2gsIHdoaWNoIGlzIG5vdyBjb21taXQgN2Ji
MzAxODEyYjYyODA5OQ0KPiA+ID4gKCJkdC1iaW5kaW5nczogc2VyaWFsOiByZW5lc2FzLGVtLXVh
cnQ6IERvY3VtZW50IHI5YTA5ZzAxMQ0KPiA+ID4gYmluZGluZ3MiKSBpbiB0dHkvdHR5LW5leHQu
DQo+ID4gPg0KPiA+ID4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
c2VyaWFsL3JlbmVzYXMsZW0tdWFydC55YW1sDQo+ID4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJpYWwvcmVuZXNhcyxlbS11YXJ0LnlhbWwNCj4gPiA+ID4g
QEAgLTE0LDcgKzE0LDE0IEBAIGFsbE9mOg0KPiA+ID4gPg0KPiA+ID4gPiAgcHJvcGVydGllczoN
Cj4gPiA+ID4gICAgY29tcGF0aWJsZToNCj4gPiA+ID4gLSAgICBjb25zdDogcmVuZXNhcyxlbS11
YXJ0DQo+ID4gPiA+ICsgICAgb25lT2Y6DQo+ID4gPiA+ICsgICAgICAtIGl0ZW1zOg0KPiA+ID4g
PiArICAgICAgICAgIC0gZW51bToNCj4gPiA+ID4gKyAgICAgICAgICAgICAgLSByZW5lc2FzLHI5
YTA5ZzAxMS11YXJ0ICAgICMgUlovVjJNDQo+ID4gPiA+ICsgICAgICAgICAgLSBjb25zdDogcmVu
ZXNhcyxlbS11YXJ0ICAgICAgICAjIGdlbmVyaWMgRU1NQSBNb2JpbGUNCj4gPiA+IGNvbXBhdGli
bGUgVUFSVA0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAgICAtIGl0ZW1zOg0KPiA+ID4gPiArICAg
ICAgICAgIC0gY29uc3Q6IHJlbmVzYXMsZW0tdWFydCAgICAgICAgIyBnZW5lcmljIEVNTUEgTW9i
aWxlDQo+ID4gPiBjb21wYXRpYmxlIFVBUlQNCj4gPiA+DQo+ID4gPiBUaGUgYWJvdmUgbG9va3Mg
Z29vZCB0byBtZS4NCj4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+ICAgIHJlZzoNCj4gPiA+ID4gICAg
ICBtYXhJdGVtczogMQ0KPiA+ID4NCj4gPiA+IEhvd2V2ZXIsIHVubGlrZSBFTUVWMiwgUlovVjJN
IGRlZmluZXMgdHdvIGNsb2NrczogcGNsayBhbmQgc2Nsay4NCj4gPiA+IEhlbmNlIHBsZWFzZSB1
cGRhdGUgdGhlIGNsb2NrcyBzZWN0aW9uIHRvIHJlZmxlY3QgdGhhdC4NCj4gPiBZb3UgYXJlIHJp
Z2h0IHRoYXQgdGhlIHVhcnQgaGFzIHR3byBjbG9ja3MuDQo+ID4NCj4gPiBOb3RlIHRob3VnaCB0
aGF0IHBjbGsgaXMgc2hhcmVkIGJ5IGJvdGggdWFydHMuIFRoZSBIVyBtYW51YWwgc2F5czoNCj4g
PiAiY2guIDEgaXMgZm9yIHVzZSB3aXRoIHRoZSBJU1Agc3VwcG9ydCBwYWNrYWdlLCBzbyBkbyBu
b3QNCj4gPiB1c2UgcmVnaXN0ZXJzIHJlbGF0ZWQgdG8gdGhpcyBjaGFubmVsLiIuIER1ZSB0byB0
aGlzLCBzZWN0aW9uDQo+ID4gNDguNS4yLjUwIENsb2NrIE9OL09GRiBDb250cm9sIFJlZ2lzdGVy
IDE1IChDUEdfQ0xLX09OMTUpIHNheXMNCj4gPiB0aGF0IGJpdCAyMCwgQ0xLNF9PTldFTiAoZW5h
YmxlIGZvciBVUlRfUENMSykgc2hvdWxkIGJlIHdyaXR0ZW4NCj4gPiBhcyAwLg0KPiA+DQo+ID4g
SSB0b29rIHRoaXMgdG8gbWVhbiB0aGF0IHRoZSBVUlRfUENMSyBpcyBlbmFibGVkIGJ5IHRoZSBJ
U1AgZmlybXdhcmUNCj4gPiBhbmQgc29mdHdhcmUgbXVzdCBub3QgdG91Y2ggaXQuIEkgYW0gbm90
IHN1cmUgaWYgdGhlIERUIGJpbmRpbmdzDQo+ID4gc2hvdWxkIGRvY3VtZW50IGEgY2xvY2sgdGhh
dCBpcyBzcGVjaWZpZWQgYXMgZG8gbm90IHRvdWNoIGluIHRoZQ0KPiA+IEhXIG1hbnVhbC4gVGhp
cyBpcyBhIGJpdCBvZiBhIGdyZXkgYXJlYS4NCj4gDQo+ICJEVCBkZXNjcmliZXMgaGFyZHdhcmUs
IG5vdCBzb2Z0d2FyZSBwb2xpY3kiLg0KPiANCj4gQnV0IEkgYWdyZWUgdGhpcyBpcyBhIGdyZXkg
YXJlYS4NCkkgd2lzaCB0aGUgSFcgbWFudWFsIGVpdGhlciBkaWRu4oCZdCBtZW50aW9uIHRoaXMg
Y2xvY2sgdGhhdCB5b3Ugc2hvdWxkDQpub3QgdG91Y2gsIG9yIGRpZG7igJl0IHNwZWNpZnkgYW55
dGhpbmcgYXMgInVzZWQgYnkgdGhlIElTUCBmaXJtd2FyZSIgOikNCg0KPiBPbmUgb3B0aW9uIHdv
dWxkIGJlIHRvIG1hcmsgVVJUX1BDTEsgY3JpdGljYWwsIHNvIGl0IHdvbid0IGJlIGRpc2FibGVk
Lg0KPiBCdXQgdGhhdCB3b3VsZCBzdGlsbCBtZWFuIGl0J3MgZW5hYmxlZCBieSBMaW51eCwgaS5l
LiBMaW51eCB3b3VsZCBzZXQNCj4gQ0xLNF9PTldFTiB0byAxIHdoaWxlIGVuYWJsaW5nIHRoZSBj
bG9jay4NCj4gDQo+IEFub3RoZXIgb3B0aW9uIHdvdWxkIGJlIHRvIGNyZWF0ZSBVUlRfUENMSyBh
cyBhIG5vbi1nYXRlYWJsZSBjbG9jaywNCj4gc28gTGludXggd29uJ3QgZXZlciB0b3VjaCB0aGUg
cmVnaXN0ZXIgYml0cy4NCj4gDQo+IE9yIGp1c3QgaWdub3JlIFVSVF9QQ0xLIGFuZCBkbyBub3Ro
aW5nLCBsaWtlIHlvdSBkaWQgOy0pDQo+IFdvdWxkIGl0IGJlIHBvc3NpYmxlIGZvciBhIHVzZXIg
dG8gbm90IHVzZSB0aGUgSVNQIGZpcm13YXJlIGF0IGFsbCwNCj4gYW5kIGdvIGZ1bGwgTGludXgs
IGhlbmNlIHVzaW5nIGJvdGggVUFSVCBjaGFubmVscyBhbmQgVVJUX1BDTEs/DQpJdCBpcyBwb3Nz
aWJsZSB0byBub3QgdXNlIHRoZSBJU1AgZmlybXdhcmUsIGJ1dCB0aGVtIHdoYXQgZG8gd2UgZG8/
DQpJZ25vcmUgZXZlcnl0aGluZyBpbiB0aGUgSFcgbWFudWFsIHRoYXQgc2F5cyAiSVNQIGZpcm13
YXJlIj8NCg0KSWRlYWxseSwgd2Ugd2FudCB0byBvbmx5IGVuYWJsZSBhIGNsb2NrIGlmIGl0J3Mg
bm90IGFscmVhZHkgZW5hYmxlZCwNCmJ1dCBub3QgdHVybiBpdCBvZmYgaWYgaXQgaXMgZW5hYmxl
ZC4gSXNuJ3QgdGhhdCBhIGNyaXRpY2FsIGNsaz8NCg0KVGhhbmtzDQpQaGlsDQo=
