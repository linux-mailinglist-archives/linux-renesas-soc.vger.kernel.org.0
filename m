Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3E996CC6AF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Mar 2023 17:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234074AbjC1PiU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Mar 2023 11:38:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232877AbjC1Phf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Mar 2023 11:37:35 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2091.outbound.protection.outlook.com [40.107.113.91])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85A09F765;
        Tue, 28 Mar 2023 08:36:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/fLvmYZbF7R8qstFNRs/YI9Z5CGz1vzTUuw4qdH+hREtGCPVoUhfkrq+5pRemRlSjrFDeL0cEn8NnqUWsIYDshXcTjEnwp1aZlpzMBOXJ9qDSQTRHbelrJ1p5xMg3JMo5NytjmcdujiMYWNzLEN1KI8fwA8HBEMUqtkflRwMuZeb2ugZOMTL6W7z+C7D+xaj/R+OyaRxV4p8yk+fapm6ad5X2m1j95WlefCKvPtPSyPMU6dg72a6nxC9evB9qfQPbwPOYaxUoAOunbDexqIsP6K8VDWu1wigChRqIxLIRsKQFiBslNMsIH5HKUmhOlAAMi1E9k4bgiLGYoCxj8OyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1JxIOB7zqw3PWrfo8lh044IjjwXUSX2MWsfK3k/qscs=;
 b=mXusLMCAfUiUXW9PZBPY3CdKNCcjrpmENaZeAX9V1EvAsvK7zVPB12wHBwl258HGZzaBLASRLPu/0VJLqvjP9LmPttVBR+fjeVyCfV7ttBHHure9QqmUz3w+9Oz6POCZZBQnAyAQ5eUHBRWjA44Kk4WWOO3oTMwU8hoW4DIljlHRJOcgXnXbp8eeGHXPwbisB5kLPurRIFTpAASdHK3ClT0Hl2xE7VzpVVHfmRttCb5TULX8dg0+rP1y/yTr2rCtnC8zD/Goz9bZVQLTYporqRUghMdN5gN+YSOYEyxar9SOPGUCIKw5V5ft0VIGQNGg3OmyZ20/iECEKuS8UDeWUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1JxIOB7zqw3PWrfo8lh044IjjwXUSX2MWsfK3k/qscs=;
 b=tf5ZavefdZmfNRSU690gM4b5WEhluDxA1q9mG2XoboS/ABAfqNoGBNdIerZnOWmI6Ua4W5C9ti0N++mjkzhSCToQ7ylzufZpCdFC85s7Z9kp9kg9S4dhJLVba/sukV20sPZWUcUMoJnrdYFnmpeasG0oYp/MbcDvJ3dloWZ8WxU=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB11173.jpnprd01.prod.outlook.com (2603:1096:400:3bf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.34; Tue, 28 Mar
 2023 15:36:28 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::e521:994c:bb0e:9bf6]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::e521:994c:bb0e:9bf6%8]) with mapi id 15.20.6222.033; Tue, 28 Mar 2023
 15:36:28 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 3/3] tty: serial: sh-sci: Add RZ/G2L SCIF DMA rx
 support
Thread-Topic: [PATCH v2 3/3] tty: serial: sh-sci: Add RZ/G2L SCIF DMA rx
 support
Thread-Index: AQHZXjfFkDWucMhIe0CqNoSmOxwIYq8ObESAgAHpwzA=
Date:   Tue, 28 Mar 2023 15:36:28 +0000
Message-ID: <OS0PR01MB59224361222866394841AB4B86889@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230324100222.116666-1-biju.das.jz@bp.renesas.com>
 <20230324100222.116666-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdWQQrjOZk4CHyhMgK0BJjHiRjraDxLtHxx+Ugn10O9ZPA@mail.gmail.com>
In-Reply-To: <CAMuHMdWQQrjOZk4CHyhMgK0BJjHiRjraDxLtHxx+Ugn10O9ZPA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB11173:EE_
x-ms-office365-filtering-correlation-id: c92a3ba5-094e-4973-171b-08db2fa232c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F0P7A2Vxlri/6m6bOnFnysr0XnQxJVZstUlA4cn+flaEs3Qeealp9qIeyDUtHlqFiSTQCZOkCBo5aSwzpgfMQpwdntPnuOSj/AoIk45/AE6hQ43KFWUSMt92z/8lKEzfjbtWScRl404/ZNweerdPvm0o2QrywN9GfNVfb3z0YRIiGsfdg7jdbk1Qcn8Wk0nKY5uC2Q+CJBSE5iM34AjOaEQELhetaskN39zzea3Ejf85OEw2jm3MCma7pak/qf2+PbutWAJRLdiez8xsxieDGGWaa+VCKgBlE0tuOQQF+ofyLndex41nxpE682bAPXZPjkJGxbZyV7fedFRO/4CJNwQRZgY+z4x4EbIyp4w7Sv8wYSI7pRbdBfNrL84uQHfid5o/CxCb+NpjC5fqBsJaSxPdyI5stw40xips7a/PN978R1JoXOOtLDiKowUU/MCYX6esftca2l7+DCYKpsECHsiEQLGnvsDnErFSZhNDFX9IIdZIrm9pg+/uyFpr6KEKHMVXfPi0/YspmExiMcdtR2mxySpM8sswEl9cNbp50yAq3rNUOG4e7hY/e5Lys1QUMsNqbwZNQnVojxHWCl4XAg/SzcibnZTrflo22JhFJc+kxYlig6p+nF5jpHv4yyrD
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(366004)(396003)(346002)(39860400002)(451199021)(316002)(54906003)(66556008)(66476007)(66446008)(64756008)(41300700001)(6916009)(4326008)(8676002)(186003)(76116006)(66946007)(53546011)(6506007)(9686003)(26005)(478600001)(5660300002)(83380400001)(52536014)(8936002)(2906002)(122000001)(55016003)(33656002)(7696005)(38070700005)(71200400001)(86362001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T05acy9jYUF6SkNwdllkS1YrS1pvbzA0ZWlEWHlPOWxtMXBJUnZqb1VZTis4?=
 =?utf-8?B?S0F6YnhIM1N5cFowNkZVZjAyU2JQN2ZXZHJrUnlVVlRyeUFrenJydkN5K0Qx?=
 =?utf-8?B?L2Vldml5VjhMZktha2FTTWJUcmsvaDN4RnRsOVRnKzgwQ3VQOWlNR0djd1Jv?=
 =?utf-8?B?M0hBUFlYOExoUFNWQ3UrUk1aWjFKZFhiNytzU054MEJMdDE1MFpnL1N2WGtO?=
 =?utf-8?B?NjgxSlVqazZJVGFySEFRR0xSK2FnQlRaTGNKRnZ6cWJybXN4cWtoU3NnRDVr?=
 =?utf-8?B?Q3MxLytIY2dKcVNOZW9XbDZjTllDK09qRUxseHA5cE1GU24xcDNwbjhrYzdX?=
 =?utf-8?B?VzFEK1kyMGVNM2FXTXoxd0dFd2M0RzV6eGF1dGgvaUtDcnpvcDJRN0p0VGh3?=
 =?utf-8?B?WFVpVEQ1enNoK3U2ZUg0bitwM3p5M1FHZ0VzVk01SXlpY1EvbUJaemVMcmFk?=
 =?utf-8?B?MmhvWE5zUTJMclo3dHVoRFl2dGxEM3Y4Uno4NzAwbXRER25qVjE4c2xVWVRp?=
 =?utf-8?B?amtwTzh2NDE0MVRpSDJYVnNvaG9DY0JBU0FzRDdZNmlSOERWK0daMGUrWEVQ?=
 =?utf-8?B?Yng4K2haLzJCekk2TXNHeFdlUWIvTG5hZzVYYUcwRE9YdklFV1BsYmJTWVYx?=
 =?utf-8?B?dzhkOVE2V0ttVVZhVS94Nmw0U3JLdmdsL0wwYnMyTDRiRnFPMTVobG1VR0M5?=
 =?utf-8?B?bTErT2NGVVlMckFRbE41dnJodU5IMElDdDl6M0o1VTREWkpkZEF0dGJqaGVp?=
 =?utf-8?B?ZTd4aWJ3V1JnVEZic1lkeTBLYlNEWHcxa1pEaDJaNWRLUGhiTUNJV2pOM1Rl?=
 =?utf-8?B?dHVDRFJpZXlhRDlyM2RsYjVBTlphMnl6NW4wQnJsTi8wMFVrWUJIYVRKOVFr?=
 =?utf-8?B?bSs2bmxVVE5yeFVwbG9TRzhNSnUzWStOemQzZ0M2L29uNFFXOHYwRW1qTGFx?=
 =?utf-8?B?bjczZFJYZm9YRzlTWkhLeFNjNHcrZWlZU2RIMWlJUTNYTVh0MUJvY3Qva3Q3?=
 =?utf-8?B?RzJxNzVzT3JyTjBndlBiZjhzQzF3MEpBREVCSitmL2JYWmN6SHNPRTByMlc1?=
 =?utf-8?B?dUxUN3A1NXBBVlVJUnJPV2NaTzZaa1laRWI4bThybzZValpza0U3SkhSOXZa?=
 =?utf-8?B?WUhqdjlsdVhuNGxoMVBPSEZueVFYZU9rczQ4dG1kcGk3a1BKV1JQWlJSNFhk?=
 =?utf-8?B?M3prZk4rbjQ3clkxQXppcFpDTXBuYm9iQWxHVFVGL0JNSSsyRGpUSDdxeko3?=
 =?utf-8?B?K0R4RWdpVHpXQzVsd0ZPVjdyaXBGRTJZbmtKMnRsdW4vVGlpd3c5djNrQ3dO?=
 =?utf-8?B?MXZZckxZMkpuN25OU3dMTjhaYk90MkE5ZEU4VTkwREUzS0RzMVVUM1hsd1Jr?=
 =?utf-8?B?eFpFSi9JeXR4NDA2RncyS20rNGhlQlBKcjVtVTI0WklHNWl4eDl2U0RFclp6?=
 =?utf-8?B?Vml3VUwwS1pTNzZpTE9MV1c2UzJRanFtbWNXbnd4bnp5ekF5ZSsxdEMyTVVz?=
 =?utf-8?B?QkRpVVFEZDQ0bGcwZHd1a0YwTUdwSktKd3pBT1Z0NHVpODBkLzU4NE9jbC9a?=
 =?utf-8?B?d1V2ZUFMUXRmb2c3MTJ1Sk5mQUUwSUZpQ1FQWEZSMDNEbEhndjNEY0kvdWt4?=
 =?utf-8?B?dWNLUHBKMVhhUUpSQ0hPSmRHYUZ1R0RJczQ3TXQ1bFdFb3cwdFBIcHpEWE1j?=
 =?utf-8?B?ZjdFV3pDU0N4RmlLRElxNnNuYU1IdGtYTUFqMTVtaEJCOFZ5L0xmT0lWMDlK?=
 =?utf-8?B?RmxRRGp3eERYK3BZUWRSK28zUmw5SGNNSDNvdEw3N3VEY0ZBR2JVK1hTQzZ5?=
 =?utf-8?B?aXVBV0hVZzMvRmUxVVZpT2k1MUlLWTdzdXdLMFpnRU5pWkZDSHRmL3Jsb2pN?=
 =?utf-8?B?YVQ2cEErTUtFS1FDNmJobUtGUWxTVmNXUnZseVZwcHNWRmJQYWt5QlVRTkF6?=
 =?utf-8?B?dlFVbEhxZ29ZYms1L0ZwK0Q3bmN6YXVIUmFyQnhVNld2T0tvT0FEcjlaWVRJ?=
 =?utf-8?B?R3E5d21pUVB3RVFaUGV5Tm9SODBzR3lMMGJuZE9mNERtYXlYT3dpUWpLakhC?=
 =?utf-8?B?YVowWjhKUnFqZC9pZjAvWkRlKzVNWEM0d2t5UzRCM25nNHZ4R2xTQVhhclZQ?=
 =?utf-8?Q?llVxsIRihVj/mhcgPEztoty/J?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c92a3ba5-094e-4973-171b-08db2fa232c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2023 15:36:28.5543
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AZlyDJFwriJng1h1by4hkeL4vfTCluzqJpTcWdx/y57TvmVoU2FLEWi+kCWHQcXJwF2ZTklMqUdrdxpaEtM2W5wYO4580m7MBopU5QWUuBw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11173
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQoNCj4gU3ViamVjdDogUmU6
IFtQQVRDSCB2MiAzLzNdIHR0eTogc2VyaWFsOiBzaC1zY2k6IEFkZCBSWi9HMkwgU0NJRiBETUEg
cngNCj4gc3VwcG9ydA0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIEZyaSwgTWFyIDI0LCAyMDIz
IGF0IDExOjAy4oCvQU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3
cm90ZToNCj4gPiBBZGQgU0NJRiBETUEgcnggc3VwcG9ydCBmb3IgUlovRzJMIGFsaWtlIFNvQ3Mu
DQo+ID4NCj4gPiBSWi9HMkwgYWxpa2UgU29DcyB1c2UgdGhlIHNhbWUgc2lnbmFsIGZvciBib3Ro
IGludGVycnVwdCBhbmQgRE1BDQo+ID4gdHJhbnNmZXIgcmVxdWVzdHMsIHNvIHdlIG11c3QgZGlz
YWJsZSBsaW5lIGludGVycnVwdCB3aGlsZSB0cmFuc2ZlcnJpbmcNCj4gRE1BLg0KPiA+DQo+ID4g
V2UgbXVzdCBzZXQgRklGTyB0cmlnZ2VyIHRvIDEgc28gdGhhdCBTQ0lGIHdpbGwgcmVxdWVzdCBE
TUEgd2hlbiB0aGVyZQ0KPiA+IGlzIGEgY2hhcmFjdGVyIGFzIFNDSUYgRE1BIHJlcXVlc3QgaXMg
YmFzZWQgb24gRklGTyBkYXRhIGZ1bGwgUkRGLg0KPiA+DQo+ID4gQmFzZWQgb24gYSBwYXRjaCBp
biB0aGUgQlNQIGJ5IExvbmcgTHV1IDxsb25nLmx1dS51ckByZW5lc2FzLmNvbT4NCj4gPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4g
DQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvZHJpdmVycy90dHkvc2Vy
aWFsL3NoLXNjaS5jDQo+ID4gKysrIGIvZHJpdmVycy90dHkvc2VyaWFsL3NoLXNjaS5jDQo+ID4g
QEAgLTEzMTIsOSArMTMxMiwxMyBAQCBzdGF0aWMgdm9pZCBzY2lfZG1hX3J4X3JlZW5hYmxlX2ly
cShzdHJ1Y3QNCj4gPiBzY2lfcG9ydCAqcykNCj4gPg0KPiA+ICAgICAgICAgLyogRGlyZWN0IG5l
dyBzZXJpYWwgcG9ydCBpbnRlcnJ1cHRzIGJhY2sgdG8gQ1BVICovDQo+ID4gICAgICAgICBzY3Ig
PSBzZXJpYWxfcG9ydF9pbihwb3J0LCBTQ1NDUik7DQo+ID4gLSAgICAgICBpZiAocG9ydC0+dHlw
ZSA9PSBQT1JUX1NDSUZBIHx8IHBvcnQtPnR5cGUgPT0gUE9SVF9TQ0lGQikgew0KPiA+IC0gICAg
ICAgICAgICAgICBzY3IgJj0gflNDU0NSX1JEUlFFOw0KPiA+ICsgICAgICAgaWYgKHBvcnQtPnR5
cGUgPT0gUE9SVF9TQ0lGQSB8fCBwb3J0LT50eXBlID09IFBPUlRfU0NJRkIgfHwNCj4gPiArICAg
ICAgICAgICBpc19yel9zY2lmX3BvcnQocG9ydCwgcykpIHsNCj4gPiAgICAgICAgICAgICAgICAg
ZW5hYmxlX2lycShzLT5pcnFzW1NDSXhfUlhJX0lSUV0pOw0KPiA+ICsgICAgICAgICAgICAgICBp
ZiAocG9ydC0+dHlwZSA9PSBQT1JUX1NDSUYpDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
c2NpZl9zZXRfcnRyZyhwb3J0LCBzLT5yeF90cmlnZ2VyKTsNCj4gPiArICAgICAgICAgICAgICAg
ZWxzZQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHNjciAmPSB+U0NTQ1JfUkRSUUU7DQo+
ID4gICAgICAgICB9DQo+ID4gICAgICAgICBzZXJpYWxfcG9ydF9vdXQocG9ydCwgU0NTQ1IsIHNj
ciB8IFNDU0NSX1JJRSk7ICB9IEBAIC0xNzM1LDcNCj4gPiArMTczOSwxNSBAQCBzdGF0aWMgaXJx
cmV0dXJuX3Qgc2NpX3J4X2ludGVycnVwdChpbnQgaXJxLCB2b2lkICpwdHIpDQo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgaWYgKHNjaV9kbWFfcnhfc3VibWl0KHMsIGZhbHNlKSA8IDApDQo+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGhhbmRsZV9waW87DQo+ID4N
Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgICBzY3IgJj0gflNDU0NSX1JJRTsNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICBpZiAoaXNfcnpfc2NpZl9wb3J0KHBvcnQsIHMpKSB7DQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBTd2l0Y2ggaXJxIGZyb20gU0NJRiB0
byBETUEgKi8NCj4gPiArDQo+ID4gKyBkaXNhYmxlX2lycV9ub3N5bmMocy0+aXJxc1tTQ0l4X1JY
SV9JUlFdKTsNCj4gDQo+IFBlcmhhcHMgdGhpcyBjYW4gYmUgY29tYmluZWQgd2l0aCB0aGUgZGlz
YWJsZV9pcnFfbm9zeW5jKCkgYWJvdmU/DQoNCk9LLCB3aWxsIGRvLCBBcyBwZXIgVGFibGUgMjIu
MTkgU0NJRkEgSW50ZXJydXB0IFNvdXJjZXMsIERNQUMgYWN0aXZhdGlvbg0KT25seSBwb3NzaWJs
ZSB3aXRoIFJYSSBpbnRlcnJ1cHQuDQoNClNvIHdlIG5lZWQgdG8gdXNlICJzLT5pcnFzW1NDSXhf
UlhJX0lSUV0iIGluc3RlYWQgb2YgImlycSIgZm9yIFJaL0cyTCBTQ0lGQS4NCg0KDQo+IA0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2NpZl9zZXRfcnRyZyhwb3J0LCAxKTsN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIERNQSBuZWVkIFJJRSBlbmFi
bGUgKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNjciB8PSBTQ1NDUl9S
SUU7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgfSBlbHNlIHsNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHNjciAmPSB+U0NTQ1JfUklFOw0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIH0NCj4gDQo+IC4uLiBhbmQgdGhpcyB3aXRoIHNvbWUgb3RoZXIgU0NJRkEg
Y29kZSBwYXRoPw0KDQpPSy4NCg0KPiANCj4gTG9va3MgbGlrZSBSWi9BMiBhbmQgUlovRzJMICJT
Q0lGQSIgZG9lcyBoYXZlIHNvbWUgcmVzZW1ibGFuY2Ugd2l0aCBTQ0lGQSwNCj4gY29udHJhcnkg
dG8gZWFybGllciBzdGF0ZW1lbnRzPw0KPiBQZXJoYXBzIHRoZSBjb2RlIGNhbiBiZSBzaW1wbGlm
aWVkIGJ5IHRyZWF0aW5nIGl0IGV2ZW4gbW9yZSBsaWtlIGEgU0NJRkE/DQoNClllcywgbmV3IHBh
dGNoIGxvb2tzIGxpa2UNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvdHR5L3NlcmlhbC9zaC1zY2ku
YyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9zaC1zY2kuYw0KaW5kZXggMzY3YmRiOTEzZDRhLi4xNDY0
MDllNDQ1NTYgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwvc2gtc2NpLmMNCisrKyBi
L2RyaXZlcnMvdHR5L3NlcmlhbC9zaC1zY2kuYw0KQEAgLTEyOTksOSArMTI5OSwxMyBAQCBzdGF0
aWMgdm9pZCBzY2lfZG1hX3J4X3JlZW5hYmxlX2lycShzdHJ1Y3Qgc2NpX3BvcnQgKnMpDQogDQog
CS8qIERpcmVjdCBuZXcgc2VyaWFsIHBvcnQgaW50ZXJydXB0cyBiYWNrIHRvIENQVSAqLw0KIAlz
Y3IgPSBzZXJpYWxfcG9ydF9pbihwb3J0LCBTQ1NDUik7DQotCWlmIChwb3J0LT50eXBlID09IFBP
UlRfU0NJRkEgfHwgcG9ydC0+dHlwZSA9PSBQT1JUX1NDSUZCKSB7DQotCQlzY3IgJj0gflNDU0NS
X1JEUlFFOw0KKwlpZiAocG9ydC0+dHlwZSA9PSBQT1JUX1NDSUZBIHx8IHBvcnQtPnR5cGUgPT0g
UE9SVF9TQ0lGQiB8fA0KKwkgICAgcy0+Y2ZnLT5yZWd0eXBlID09IFNDSXhfUlpfU0NJRkFfUkVH
VFlQRSkgew0KIAkJZW5hYmxlX2lycShzLT5pcnFzW1NDSXhfUlhJX0lSUV0pOw0KKwkJaWYgKHMt
PmNmZy0+cmVndHlwZSA9PSBTQ0l4X1JaX1NDSUZBX1JFR1RZUEUpDQorCQkJc2NpZl9zZXRfcnRy
Zyhwb3J0LCBzLT5yeF90cmlnZ2VyKTsNCisJCWVsc2UNCisJCQlzY3IgJj0gflNDU0NSX1JEUlFF
Ow0KIAl9DQogCXNlcmlhbF9wb3J0X291dChwb3J0LCBTQ1NDUiwgc2NyIHwgU0NTQ1JfUklFKTsN
CiB9DQpAQCAtMTUzOCw3ICsxNTQyLDggQEAgc3RhdGljIGVudW0gaHJ0aW1lcl9yZXN0YXJ0IHNj
aV9kbWFfcnhfdGltZXJfZm4oc3RydWN0IGhydGltZXIgKnQpDQogCQkJdHR5X2ZsaXBfYnVmZmVy
X3B1c2goJnBvcnQtPnN0YXRlLT5wb3J0KTsNCiAJfQ0KIA0KLQlpZiAocG9ydC0+dHlwZSA9PSBQ
T1JUX1NDSUZBIHx8IHBvcnQtPnR5cGUgPT0gUE9SVF9TQ0lGQikNCisJaWYgKHBvcnQtPnR5cGUg
PT0gUE9SVF9TQ0lGQSB8fCBwb3J0LT50eXBlID09IFBPUlRfU0NJRkIgfHwNCisJICAgIHMtPmNm
Zy0+cmVndHlwZSA9PSBTQ0l4X1JaX1NDSUZBX1JFR1RZUEUpDQogCQlzY2lfZG1hX3J4X3N1Ym1p
dChzLCB0cnVlKTsNCiANCiAJc2NpX2RtYV9yeF9yZWVuYWJsZV9pcnEocyk7DQpAQCAtMTY2Miw3
ICsxNjY3LDggQEAgc3RhdGljIHZvaWQgc2NpX3JlcXVlc3RfZG1hKHN0cnVjdCB1YXJ0X3BvcnQg
KnBvcnQpDQogDQogCQlzLT5jaGFuX3J4X3NhdmVkID0gcy0+Y2hhbl9yeCA9IGNoYW47DQogDQot
CQlpZiAocG9ydC0+dHlwZSA9PSBQT1JUX1NDSUZBIHx8IHBvcnQtPnR5cGUgPT0gUE9SVF9TQ0lG
QikNCisJCWlmIChwb3J0LT50eXBlID09IFBPUlRfU0NJRkEgfHwgcG9ydC0+dHlwZSA9PSBQT1JU
X1NDSUZCIHx8DQorCQkgICAgcy0+Y2ZnLT5yZWd0eXBlID09IFNDSXhfUlpfU0NJRkFfUkVHVFlQ
RSkNCiAJCQlzY2lfZG1hX3J4X3N1Ym1pdChzLCBmYWxzZSk7DQogCX0NCiB9DQpAQCAtMTcxNSw5
ICsxNzIxLDE2IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBzY2lfcnhfaW50ZXJydXB0KGludCBpcnEs
IHZvaWQgKnB0cikNCiAJCXUxNiBzc3IgPSBzZXJpYWxfcG9ydF9pbihwb3J0LCBTQ3hTUik7DQog
DQogCQkvKiBEaXNhYmxlIGZ1dHVyZSBSeCBpbnRlcnJ1cHRzICovDQotCQlpZiAocG9ydC0+dHlw
ZSA9PSBQT1JUX1NDSUZBIHx8IHBvcnQtPnR5cGUgPT0gUE9SVF9TQ0lGQikgew0KLQkJCWRpc2Fi
bGVfaXJxX25vc3luYyhpcnEpOw0KLQkJCXNjciB8PSBTQ1NDUl9SRFJRRTsNCisJCWlmIChwb3J0
LT50eXBlID09IFBPUlRfU0NJRkEgfHwgcG9ydC0+dHlwZSA9PSBQT1JUX1NDSUZCIHx8DQorCQkg
ICAgcy0+Y2ZnLT5yZWd0eXBlID09IFNDSXhfUlpfU0NJRkFfUkVHVFlQRSkgew0KKwkJCWlmIChz
LT5jZmctPnJlZ3R5cGUgIT0gU0NJeF9SWl9TQ0lGQV9SRUdUWVBFKSB7DQorCQkJCWRpc2FibGVf
aXJxX25vc3luYyhpcnEpOw0KKwkJCQlzY3IgfD0gU0NTQ1JfUkRSUUU7DQorCQkJfSBlbHNlIHsN
CisJCQkJZGlzYWJsZV9pcnFfbm9zeW5jKHMtPmlycXNbU0NJeF9SWElfSVJRXSk7DQorCQkJCXNj
aWZfc2V0X3J0cmcocG9ydCwgMSk7DQorCQkJCXNjciB8PSBTQ1NDUl9SSUU7DQorCQkJfQ0KCQl9
IGVsc2Ugew0KIAkJCWlmIChzY2lfZG1hX3J4X3N1Ym1pdChzLCBmYWxzZSkgPCAwKQ0KIAkJCQln
b3RvIGhhbmRsZV9waW87DQoNCkNoZWVycywNCkJpanUNCj4gDQo+ID4gICAgICAgICAgICAgICAg
IH0NCj4gPiAgICAgICAgICAgICAgICAgc2VyaWFsX3BvcnRfb3V0KHBvcnQsIFNDU0NSLCBzY3Ip
Ow0KPiA+ICAgICAgICAgICAgICAgICAvKiBDbGVhciBjdXJyZW50IGludGVycnVwdCAqLw0KPiAN
Cj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVy
dA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51
eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNv
bmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEg
aGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5
ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZQ0KPiB0aGF0Lg0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
