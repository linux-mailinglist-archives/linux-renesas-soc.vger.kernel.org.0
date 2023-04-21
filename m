Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B2AB6EA88D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Apr 2023 12:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231451AbjDUKqw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Apr 2023 06:46:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231450AbjDUKqu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Apr 2023 06:46:50 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2110.outbound.protection.outlook.com [40.107.113.110])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D157AC148;
        Fri, 21 Apr 2023 03:46:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jinpOa+RsfKV1zgEOPYe3tiwJU9nys10R7zbvJbkQ+IU8tDINWp6cZYZI6uM13aRHR+VVqGwwlXyz71ESdVPsDEFYu9p2Z067fIqWXsTFzQ5OwPY7NFVPePuByHFVmqLd7/m82dkXkqMEQXknRyMlF23sD2TuiNrWW9n2xaDNWFGbLIyr6CDcevGThsgB4T60TP5Vt5vDTvjUG9h6lXWLgVsmpE3vAlexAahxv0sRMfYrJb44Dx190BQwTH4qCKAxAwcufBw6yA7SOBJHzQ3eEcPk7hPYhTan+e1w7UksDasmAr4kN7NXbNvloCtVP2dhWEYx75g5pzz6LV+c73CIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5r+PTNrapTB8x15H4jRehW8ZS8LsRWwyUZO0GkrlXbk=;
 b=FZEYbAXpEMY5wAVKZmk1zqF8tkcE91FQ2XVoqiN08pMc5090H4affLMjGoRHLdk/Rn5JoyX+9pNeoPyY0tuz9PmIFfmPWaDrAlLRTYJrjjfvyo7qKfX2y9CSIA11aBVOcfJOUttr0IGPU6oDkDmmm3adBTK4dpYIccj1QwzHihNjrwdAdBHutRFeI0C5CyYYTx1TuPkM0SMNS5Jx/zF7mhW1ENigfTBWUSHjxTrmd72gFWn+JJZOqdVFyXGHCVMIGRB8xnpV2aNQEA8HAAinsB2dLBcWAyBigxSzdtIZXtTAOUbiuCzzHLQFw2P44z4Mlkwt3ehEeC11b2y+DB7UGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5r+PTNrapTB8x15H4jRehW8ZS8LsRWwyUZO0GkrlXbk=;
 b=c1xMxcwvjGzlSfgbW3/sVRNbtRTxjm+N9r3uiqiTyCquZHaKgS5wJNVe+wOxdKoF4JujnaBU5s0EVXcVZX3Mo/PVMtKj0bndEe8L4YuilC6OgF1FYnTOKtdwFcnUkR40Bc02lXzcKfNbfvuPOOGmtXSNoZRYNKHrYGLIetzUPv4=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB10678.jpnprd01.prod.outlook.com (2603:1096:400:2a6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 10:46:45 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6319.022; Fri, 21 Apr 2023
 10:46:45 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 4/5] tty: serial: sh-sci: Add support for tx end
 interrupt handling
Thread-Topic: [PATCH v4 4/5] tty: serial: sh-sci: Add support for tx end
 interrupt handling
Thread-Index: AQHZbU44grRabWcBFE6IrVTwi9UfXq81jy4AgAAS8PA=
Date:   Fri, 21 Apr 2023 10:46:45 +0000
Message-ID: <OS0PR01MB592254B61AD61DFB89120B0E86609@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230412145053.114847-1-biju.das.jz@bp.renesas.com>
 <20230412145053.114847-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdUa9W3y0uXtKJYBeK57UoD9hz=6c3frXXswpqV16-5mbg@mail.gmail.com>
In-Reply-To: <CAMuHMdUa9W3y0uXtKJYBeK57UoD9hz=6c3frXXswpqV16-5mbg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB10678:EE_
x-ms-office365-filtering-correlation-id: e350a2bf-27d1-4fe9-31d2-08db4255b34d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Hy2gbE60Ohq9A8TpVsrFBhsmBxEJb/klAZd9pPzJkrDRUazSRMU9+PKm0QKWYzjLn4MGu2R+6Qj1f2MCSqd0D6/OIwoHn2c6GcnGVlwqVR7bqI5hq1PL4RA7FE1RZyHh73gTAZuYevcDFf/TrP5XXqr1MxxfnWujX5jGZ8mHSAfpJpE+uyyE0P/R3xDD2DuqJRPRRMOCijlO3aMCuEGKlt+oLbEpkbaJLZ5l8+fNS8+4fTVcPz2GjSf9oPLEbx8TGoD5RhT0tHTgrhB0rbRX3GTk0Hiy20vgcitl66beqXLkl12WmBfypYCecWb2Bsle9bs/rwMjCh52n2Z1m+K32puyvKbRXe+Gi0GE4COn+b2bUAQwKVbG7sLOeSIkrBdTQ9kisDHF3lPqEsMFXMyTTBPEg8CWhA6MEZxG/aZCfPt3O5cpMj4a3bNYDbfNGmA4jhK5xI38B9f1IrIzQ9NqaNABiOVK/WvuHNM6GnjN4hF6f0ZGyyYHPbNBakq4YuZCxIUNHXqq/tGmIsZZs0NxkPbzsbxhJ+kV23ItvmwiaErBxyxntji6DKDKzXuxVqBiNxV0diJRqJx4Swue8DWfZM3o2vxnc129RLfI/7Nw1jt55SCIbFZxEuIvbLu1Szls
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(366004)(346002)(39860400002)(136003)(451199021)(76116006)(316002)(66946007)(6916009)(64756008)(4326008)(66476007)(66556008)(83380400001)(7696005)(71200400001)(478600001)(54906003)(8936002)(8676002)(66446008)(38100700002)(41300700001)(122000001)(2906002)(38070700005)(52536014)(5660300002)(53546011)(26005)(9686003)(6506007)(186003)(86362001)(33656002)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NURQblJldktCZmhiU0ZGZUNjVlZldlF2clpEbUFUOUZ4eHlBaUJjVUFWaGxF?=
 =?utf-8?B?c3liSTNBYnJpSEdsbjhMdXMySEZhbUdWQVMxUzlrYTN3MXgyTjBiclkrSTBG?=
 =?utf-8?B?bUVZL2Y0cW5BQjkwRlZZTFltcXlxNHlIbVVKUnczaTdlRnVSZ2JJaDN1Um43?=
 =?utf-8?B?RFRoVXl2Q2FwSkYyUHZOZTRvY2k4YXV1QTBJdjZRSEluWDduaUdFZENTUTJD?=
 =?utf-8?B?TU9MUTBhNjZNYkRoaTRvaUQ0eHNiUU5kdWdxQitvUEVLN1BtMjltNnpvQ3Q0?=
 =?utf-8?B?ZWY3bEZSaGliNWh2TGVkcnhSK3djTmNSQjBWNDFBWmZxYzcvR2FONEFZZUh4?=
 =?utf-8?B?U2ErdVZrRGRWSnZjdW03RkdKc01xeWkxNUxJdVk4YlNmN2tYZzdWdG5UMVRm?=
 =?utf-8?B?L1owTFMxVndpTmxqa1djUCtRYSt6cENHTytNK1FnV0NFMGg5cVhuUU9UMVlC?=
 =?utf-8?B?Z3RubGFPZXBDdFQ1dktEOXI2cW1DRUYzeVVVNkRiM0tZeUlnRkl4em9HVXNU?=
 =?utf-8?B?QnhGS1lxVFlXWFhZek1WR3c5OUxVdnNQdk4rTXJvRFNYUEtITnhJYmNvT2pQ?=
 =?utf-8?B?N05WRHZNT3lVZFZ1VitNQ1ljUU1qbDUyTUFsNlFKcThZU3kyRWlZc0NnMnNz?=
 =?utf-8?B?QTBLY2tNYWJqY0Mvb2pSc1pOODBTdUgyck01VFRKRnlsTlJNSVBHTDRKYUZa?=
 =?utf-8?B?TUUxdi9SbWZOUnN5QURXN1ZPWkRXVHlkTURNenM4VDN3cXIxMkZDcjV4UXhX?=
 =?utf-8?B?V1o0UmQyR2dWaWNBQmlEV2ZQNWFTeEh4UGV0Zzl5QklQNW11eWw5N1ltSlR2?=
 =?utf-8?B?TlFBWnRCSjZpa2w2MkdHZ2ZDUFVtVGdvR1dNTnFxcElCRi9sQ3FaYTROdHB5?=
 =?utf-8?B?RmNoRDJxdjhPdGZoMmM1akVtOFRKRTh1UTFaMWFqTmYwMHI5bVVkU3JwM2Rv?=
 =?utf-8?B?R0x5ZGZUeDFFVVFJWFdjWnoyeENtZHE2QlFxTkYrY0dqOEZxUWhodmRXSFpX?=
 =?utf-8?B?Mk0wT2JFZHpDNE9jZHdqOHUwd3M1ZGoxRG9GdGxmQnllclZxSFk0ckJUTUVp?=
 =?utf-8?B?c05IOURDQXY0TElTTGtLdUJ0WW0vbUVkc0xRMTdZOTdSbVA4ZzVnN2locUxa?=
 =?utf-8?B?Zy9ISlp1NFhiVTkvUzBOVUlaYWNwZSsySHhXVlRROU5sVGoyeE5kKy85a3Z4?=
 =?utf-8?B?VzNOMTZPSTAzL000czhOM1lTVTBpTmV1bW5SbkFrU1pIN0V4WGxZajNqODN6?=
 =?utf-8?B?OEZrZ09tWEVMWWw0T0h3Ykx4YkpRaFJ4SHViU3ppNTBTcmozYjVuUXJ6WE1D?=
 =?utf-8?B?eFA3ckozek9RSW1rK010WnlPaDBKQkpNT3ZoYzVqMXVMbm5VUkljUlZydDdK?=
 =?utf-8?B?WWw5NTBpdGthQlVWQ2Fia1lueDgwZXEwRUVxd2Y4K1lZVCtvODVjUVgwMElX?=
 =?utf-8?B?bzJKdDJqS29HSTFYNytqd09KMCtMWmtGeTh1V0M4SHBRdndKV0l6M2RaSU8z?=
 =?utf-8?B?czZjaTJYVEFwTmJZeWM5cVBGT3dHeElKd3VGRTZDSzRFaENhQXkreFB4NmxW?=
 =?utf-8?B?dytCcTg3L3JMdFBVUGxuWUJwQlRDcXBDYXR4MUIzWkxCRlBoN0ZFNEtvOUls?=
 =?utf-8?B?U1YvZGVKUldCTk0xT1NydnN4OEpZQ3VGNmFZN3lkOHk4UkgvZm82STNDMEZ4?=
 =?utf-8?B?UG05L0Y4M2FnRGtNTHJjcGx4VDUxaGlRZ0h5QUZTd1hJeGs2S25nY1BYRkN6?=
 =?utf-8?B?Y2FFR0d2RVJxcjRHREVzaVc3UnFNSlN5ZnJ6NDgzQWpLaTJWU3h1citBU0l6?=
 =?utf-8?B?Nkdpdld4SFJYTEN6amY0WWFocjZvbUd5OWZDVFFqUm1UV3c1a3lUb0R3SEJU?=
 =?utf-8?B?eUFuek5mSE5jR0ZZRXcwSXplQlZucGhXSEtPTDJEdHEyQXRORG1HZGtPVVQ0?=
 =?utf-8?B?MExESDQra29rejZTYlJXOTlZck5SQ1dpdUJDS1ZDbEk0Vk1iWmxaTGJJUFZD?=
 =?utf-8?B?N1pqYnE0ekZZdFZKTEVkZmNQell1VEsvL3lDL1NXUUFSaUx3Y3Jaa0EzMjl5?=
 =?utf-8?B?MlRGOE4zSVNCMy9VWjVuVFp2Skk4aExJMzd1OXkwT3dEOFNPajZMckJlc244?=
 =?utf-8?B?VjBKb3pSVVR1RzkvU1VDNXk5WkczUmJVR3NMYmh5TFZVVW5ic0pIWEg4UmJh?=
 =?utf-8?B?V3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e350a2bf-27d1-4fe9-31d2-08db4255b34d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2023 10:46:45.0540
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nlBUt4QtoXK72Ewz3Qd6KFaVtofBsiNzmWXxG3lViNsniPbcBdSvq2wLUDGnrCnvvaeqZ/TWYsEJXbXXo9LyBMP4iyEOhBhsnsw1GrZqotE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10678
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogRnJpZGF5LCBBcHJp
bCAyMSwgMjAyMyAxMDozOCBBTQ0KPiBUbzogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVz
YXMuY29tPg0KPiBDYzogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9u
Lm9yZz47IEppcmkgU2xhYnkNCj4gPGppcmlzbGFieUBrZXJuZWwub3JnPjsgWW9zaGlub3JpIFNh
dG8gPHlzYXRvQHVzZXJzLnNvdXJjZWZvcmdlLmpwPjsgbGludXgtDQo+IHNlcmlhbEB2Z2VyLmtl
cm5lbC5vcmc7IFByYWJoYWthciBNYWhhZGV2IExhZCA8cHJhYmhha2FyLm1haGFkZXYtDQo+IGxh
ZC5yakBicC5yZW5lc2FzLmNvbT47IGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZw0K
PiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDQvNV0gdHR5OiBzZXJpYWw6IHNoLXNjaTogQWRkIHN1
cHBvcnQgZm9yIHR4IGVuZA0KPiBpbnRlcnJ1cHQgaGFuZGxpbmcNCj4gDQo+IEhpIEJpanUsDQo+
IA0KPiBPbiBXZWQsIEFwciAxMiwgMjAyMyBhdCA0OjU34oCvUE0gQmlqdSBEYXMgPGJpanUuZGFz
Lmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBBcyBwZXIgdGhlIFJaL0cyTCB1c2VycyBo
YXJkd2FyZSBtYW51YWwgKFJldi4xLjIwIFNlcCwgMjAyMiksIHNlY3Rpb24NCj4gPiAyMy4zLjcg
U2VyaWFsIERhdGEgVHJhbnNtaXNzaW9uIChBc3luY2hyb25vdXMgTW9kZSksIGl0IGlzIG1lbnRp
b25lZA0KPiA+IHRoYXQsIHNldCB0aGUgU0NSLlRJRSBiaXQgdG8gMCBhbmQgU0NSLlRFSUUgYml0
IHRvIDEsIGFmdGVyIHRoZSBsYXN0DQo+ID4gZGF0YSB0byBiZSB0cmFuc21pdHRlZCBhcmUgd3Jp
dHRlbiB0byB0aGUgVERSLg0KPiA+DQo+ID4gVGhpcyB3aWxsIGdlbmVyYXRlIHR4IGVuZCBpbnRl
cnJ1cHQgYW5kIGluIHRoZSBoYW5kbGVyIHNldCBTQ1IuVEUgYW5kDQo+ID4gU0NSLlRFSUUgdG8g
MC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5l
c2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvZHJp
dmVycy90dHkvc2VyaWFsL3NoLXNjaS5jDQo+ID4gKysrIGIvZHJpdmVycy90dHkvc2VyaWFsL3No
LXNjaS5jDQo+ID4gQEAgLTg2MCw5ICs4NjAsMTYgQEAgc3RhdGljIHZvaWQgc2NpX3RyYW5zbWl0
X2NoYXJzKHN0cnVjdCB1YXJ0X3BvcnQNCj4gPiAqcG9ydCkNCj4gPg0KPiA+ICAgICAgICAgaWYg
KHVhcnRfY2lyY19jaGFyc19wZW5kaW5nKHhtaXQpIDwgV0FLRVVQX0NIQVJTKQ0KPiA+ICAgICAg
ICAgICAgICAgICB1YXJ0X3dyaXRlX3dha2V1cChwb3J0KTsNCj4gPiAtICAgICAgIGlmICh1YXJ0
X2NpcmNfZW1wdHkoeG1pdCkpDQo+ID4gLSAgICAgICAgICAgICAgIHNjaV9zdG9wX3R4KHBvcnQp
Ow0KPiA+ICsgICAgICAgaWYgKHVhcnRfY2lyY19lbXB0eSh4bWl0KSkgew0KPiA+ICsgICAgICAg
ICAgICAgICBpZiAocG9ydC0+dHlwZSA9PSBQT1JUX1NDSSkgew0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGN0cmwgPSBzZXJpYWxfcG9ydF9pbihwb3J0LCBTQ1NDUik7DQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgY3RybCAmPSB+U0NTQ1JfVElFOw0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGN0cmwgfD0gU0NTQ1JfVEVJRTsNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICBzZXJpYWxfcG9ydF9vdXQocG9ydCwgU0NTQ1IsIGN0cmwpOw0KPiANCj4gQ2xlYXJpbmcgU0NT
Q1JfVElFIGlzIGFscmVhZHkgZG9uZSBpbiBzY2lfc3RvcF90eCgpIGJlbG93LCBzbyBJIHRoaW5r
IGl0DQo+IHdvdWxkIGJlIGJldHRlciB0byBqdXN0IGFkZA0KPiANCj4gICAgIGlmIChwb3J0LT50
eXBlID09IFBPUlRfU0NJKQ0KPiAgICAgICAgICAgICBjdHJsIHw9IFNDU0NSX1RFSUUNCj4gDQo+
IHRvIHNjaV9zdG9wX3R4KCkgaW5zdGVhZC4NCg0KSSBoYXZlIHRlc3RlZCB0aGlzIGNoYW5nZSBh
bmQgaXQgd29ya3Mgb2suDQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4gPiArICAgICAgICAgICAg
ICAgfQ0KPiA+DQo+ID4gKyAgICAgICAgICAgICAgIHNjaV9zdG9wX3R4KHBvcnQpOw0KPiA+ICsg
ICAgICAgfQ0KPiA+ICB9DQo+IA0KPiBUaGUgcmVzdCBMR1RNLg0KPiANCj4gR3J7b2V0amUsZWV0
aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4g
R2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAt
LSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlv
bnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4g
d2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBv
ciBzb21ldGhpbmcgbGlrZQ0KPiB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
