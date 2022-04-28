Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFE38512CBE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Apr 2022 09:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233545AbiD1Hap (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Apr 2022 03:30:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245306AbiD1Ham (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 03:30:42 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2137.outbound.protection.outlook.com [40.107.114.137])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F11733881;
        Thu, 28 Apr 2022 00:27:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mRK5GLVWLM6xzJNd5+TFKwgrxlAQ65hY9HcKb2eyS7g7dg66OufWa8zKiefUnNgIQApFKk/mLOj/5mJTJqmCWfwZEyOFZFQKN3vJh/lYzMUl7NaYy95WPbTQejLGk5FMTgOuU42nfwoHDlACwKvc98gROfhPDV8SJAwpCjPyGGPhE8073rE06A9hONUZYc0rovP3FNCV/sUoPfjX0+937WOoz50cohLTFF+3FlihooaXM4bztOla2fJx/Mk8xFw6uB9eAEqgi87iuYbn7KToymqcl+5W6xMe6GhkFekwKtAFca19ODBcceOxsisK51ZxJKsQOinq1RZPZXSYbc8nFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDOl8JkxqFiy0DLwCFoZoR9P2ZidJeVlOmbL2UwOomc=;
 b=jv7NkO6At6dZCeQ49EeY2yHHCv6t1xtA+Ppeb3eSNg28KQBSzUkti4viss0XivVy7frvz9CJ96OEH0RZohd8Tuh+8VW1rEmot8RiIZDqZHmqzI+XNWctnpiR9zEu8nxPqc5G/jJzXuIbOcVg1y7srHuQBdvMOY+ZzRzgs6bL97dcuwvxJ9SqXO5Stte60r/TApg1L7tCaI/O/jfTEIO4rl/q74idglOcKahhKNy4jT00SM0w0k5sEYD+GQ3kRzNtysy5OuQZwMjCnuyljB9XUI7445kN0mWPgySmUFeCN+u9xBH2o/1jbJhI9Fv1tSrJtKUyuf+J7o6E+xvgLjj6gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDOl8JkxqFiy0DLwCFoZoR9P2ZidJeVlOmbL2UwOomc=;
 b=Zwh6LLOczOzNQyz0G9qK6Yjoh7cf7DkU2Q1NOR5+taPefjezYeU7RXUis11Qjgx/93s0viCUhvo8BFb62TsoTUo9c59KryYa2dd9AFjvi/1/vnmjsybEXHw/Lq46dwvjUBidpsmON9SPE7wulBw7IkTPqzPwqC/8+HBbqGbrlJk=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OSAPR01MB3313.jpnprd01.prod.outlook.com
 (2603:1096:604:53::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Thu, 28 Apr
 2022 07:27:14 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::205e:c981:34d8:dbcf]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::205e:c981:34d8:dbcf%9]) with mapi id 15.20.5206.014; Thu, 28 Apr 2022
 07:27:14 +0000
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
Subject: RE: [PATCH v2 6/7] arm64: dts: renesas: Add Renesas R8A779G0 SoC
 support
Thread-Topic: [PATCH v2 6/7] arm64: dts: renesas: Add Renesas R8A779G0 SoC
 support
Thread-Index: AQHYWG+e7iSQqmaji025Vo7PRYlzZa0D162AgAEZ+uA=
Date:   Thu, 28 Apr 2022 07:27:14 +0000
Message-ID: <TYBPR01MB53419EA31C68FBFAD8A3CC59D8FD9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20220425064201.459633-1-yoshihiro.shimoda.uh@renesas.com>
 <20220425064201.459633-7-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdVffc4iqX6wAKwyq_eTX5c0H3-tqs_pvsec7v1_q6hS3g@mail.gmail.com>
In-Reply-To: <CAMuHMdVffc4iqX6wAKwyq_eTX5c0H3-tqs_pvsec7v1_q6hS3g@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1c73e051-3a4e-4004-b971-08da28e88447
x-ms-traffictypediagnostic: OSAPR01MB3313:EE_
x-microsoft-antispam-prvs: <OSAPR01MB33132C8DA8AE6D04F6704C53D8FD9@OSAPR01MB3313.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uNbicASyImTiNlh0yHK6TthhVfMf3rv9OtaPMThmYe3UluPf+w36FYRQW7fQBwOZ6SffslB76SE+qAzARppJ8yFuDolibSbf3upGf8FKkBUdPvj/sRbWmG9n/NGV9rkEIhlOrvfezEwnrBMfcuEQVomvTDNMOQfXyxwxBZJB9Vgz8ESDFb0j3+r+bnfyA8E2oAuu/4TVJXEJADuP/5PgqAm+2NK++SHVTUzW5+xYXVFjxa21z5wbtlTmQtgcu51ge8WHq8plIpivolGhB2o+iYA6aatGP9kfy3xXZz51PLRNXoSMVDuW2ReEnQYMDCvYLAU/GQS5LiwS0y7nnPkhz9i9kdkXrqlhdmP/fKeCnO3dphp/wW36ugk9d2LWrxRfaHtNN/lcvFePm6Xkgk1aj3hzRkHV3eZC8TzALcxEBhFRqq+J6WfkIHz0wjnC9LVHkg4saWcyrOqqwpZouq4SEISYc02a3DMNwWPTFqw2QRdYSiOk0kh1hvEsscrgadQXaU/2YXa2p1Y//TU8UXZDymJXRR96eyx9s0GowRDAuPHpjg5bnz+ZPAM1W/f0WVcU/8+KduA9OeI9EU0Ie2CFgOX871Sg22ZTlNBXFyEPEgqKGg3llVF/59U6waG5mK01bESSXwz2kMhwnJeONVD2OBORfUEGic8ys/wkIqlmY5rpTWgRG5Ndqr2Xxv/EOpKEQ/ctgYNSLm12OzD2mVbfbA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(71200400001)(55016003)(6916009)(4326008)(54906003)(316002)(8676002)(64756008)(2906002)(508600001)(6506007)(7696005)(9686003)(83380400001)(186003)(66446008)(66556008)(66946007)(66476007)(8936002)(52536014)(38100700002)(33656002)(86362001)(5660300002)(122000001)(38070700005)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NTRvRHFWZURPY2RVWjBrNDdxK0Y4SnJ3Z1dXbk1PNk50WmY1eGd4cXg5aDRE?=
 =?utf-8?B?OTR1MXFFQ2Z5ZWNGK2hPSWlwb0pBSXRQWVIyVXZwTkhkQjZlVFJpQVFGbVB1?=
 =?utf-8?B?Qk5ZSDIySTgvenRuZk50ZnE3cXBWRU5EVVJkZG55Y0lwVklTQ2ErWWtaZkh2?=
 =?utf-8?B?WDNBL05PQWhaNDhuRmtybmdyNlJjK3BmdEJDSEYrWWU1L0p1c3pvb29hUFVY?=
 =?utf-8?B?SW9oSWdocFg4NlBmNFJuYTRYM0xNQjhYWEJMTzRndnhVai9pZE02aEdCTy9a?=
 =?utf-8?B?dUpnQU5QWmxESisyNHpjeTY3eGpGaEpXOStZeW9UbXA5MGZuLzJ0dkVmT3A4?=
 =?utf-8?B?RUtDcjczcGdSM3BYcWRycWNOLzg4MlhxNFB6bXBuSG13Ky82NnU2QWZ0aTdW?=
 =?utf-8?B?dno3SHgvR2xUOFFyZmFaZTFiam16UVgva3k2TVhtU3pqRUpBbWZWdHZCbkFw?=
 =?utf-8?B?WEdzelNyT3NzZFlueTd5Q2NOR2tpV0ljYnFrZlJNWUlRd1AyVDNxa2Foc3or?=
 =?utf-8?B?ZjBMMWE5VTB0SFhyRHNocllMd2Z6bU5wM0czVDJBRFRsbC8wcUdZeDU0RG5M?=
 =?utf-8?B?WFA5RVd1SE1NeGxXL3grRmJ6LzFVcVFkaTRYSzQ1b0x4aFNKWXZEd1dIRFdl?=
 =?utf-8?B?cjFzc01XVDNoM3lwTGM4YTY4VVRYekRPWlZGdGNIb05nNjRkdkRVR09EaFhT?=
 =?utf-8?B?ZWdQOHM3enZ2Z2dJNEl1REF3TENLbXVWc0VrTGU0M2ZvNlpGemlnaURWeTh2?=
 =?utf-8?B?aTVsYVdOTG1XSlNwN0xjWlc4QkRvZTlwYjJjZHJyLy9IWHM1dkR2UC9mb2hp?=
 =?utf-8?B?b2h5aXBjSlRrdUJQTUlNRGlWN0V5UlFBYk1PWVV5NVRxR210YXU3YmhkWnJG?=
 =?utf-8?B?ajlndDNJK005Wm1wTENtaHBaL1kxSEFxWGh3ZlVVQWZPOXhjRU43SE9iY01J?=
 =?utf-8?B?QmZwK25IaGVUcHFObURDNFY4NXB4ZlY3NE1wbGZLOUJuOFhhQWtiY1NFbTRS?=
 =?utf-8?B?RUxTSU1ZeEI4ejlXZEw4ZFJ2cDZwNXF5UG5PeCtJbkFFR3p4M2R2VjE5YU9t?=
 =?utf-8?B?cEg0Q2JXdVdYelEyWmtBbVlZWnY2TTJ2eUFMQVhVNHAzaFVBOWtPZ3lCYlg0?=
 =?utf-8?B?ZWRibVRCM2xaT3VEaExIakZBSGVrVWRLWjVVYThVTjdHK1Vka1NIQ3NRQmhm?=
 =?utf-8?B?TFp1TjJqZXRPcHBnMEo5Q0F4N09Pa0J6cW9ZRFhUSjc1VDFwcEY1SlF3T1lm?=
 =?utf-8?B?MUZvZ1VOR2JhMXZrWElEWllHNGtMenp4VXlLRE5rNTJyWWU5Z2hmT1Z5cElm?=
 =?utf-8?B?ZklOZGJ3RGVwdS9RaEJTNW9hVnU2RVlQdVBkNXZNaEQrUDR6QVV6VVZtejI0?=
 =?utf-8?B?VXhOOExWTTUzbkpjeGNsTUp2N25wUEZTVU55a2I2TCt0bHY5UUFPdldReSsz?=
 =?utf-8?B?andtRDQ2YU9VYVRFTkpLbjNBd1BCbW5FVUpiMkpiRkE4MGpudDRLcWx3Tjd1?=
 =?utf-8?B?MWJpemRySFhDVDBldkFLSVIvQnFIL09xUGRKVGFNdjU3V1pVWjV2TFhlbG0z?=
 =?utf-8?B?RHdETS80cUhDemVLWUFsRk9Yejk1THFsTXVxaWQvL0hQMmorb05yTWFRNUda?=
 =?utf-8?B?WDVaODF6K2pTTVUzSFZZSEhZVDBNSGdYdFFiQTUweDJjcU9kSHl4aXJEcGRW?=
 =?utf-8?B?dzhzd1JDMHJyWHcyRFRyYjFIOHNEa0ROSGZnTEhvUisveUpNT1UwT3NNRzlT?=
 =?utf-8?B?eFVZUDJ1UktvVTVwbWVQUG9JRlBVRTFqRzd2bGl6di9tdC91VkRDQlNQSnR0?=
 =?utf-8?B?dU9tbXdMdlpHT0RnODQ4ZHlBeXV5d2ZqV0xaY0w5ZXFyZXF2cmtoTStSanJw?=
 =?utf-8?B?R3kxOFFsR283RkxUbnZ6WUR5ZmIwNDhSS2NwZkhZUGdpbVpuSExwYmI1TlYr?=
 =?utf-8?B?Nm8rUkdrMXY0bXViUzhqSSthaU82QXVmWmVxYW45TlZ2MTFSMnlQd0ZTT0Zj?=
 =?utf-8?B?VmR1WExuMjA2WUFOMlZQSFN4NURMK2N2Z0RmYlVKVzc3Tk1TSjZMZUJlQW9X?=
 =?utf-8?B?Mjl0bHJoNUpjcjgyZnRvc3crNzJleWU1S2g4Rkg5Z2RkWURIbGpBRmZ1T0Zj?=
 =?utf-8?B?RlRVV1hNZTB0bndiV09yL2V0ZFpqUk56a0txZ2pDa1ozVUpDdzNmTU9qVXE1?=
 =?utf-8?B?VVBadHNRbmpTQW1yRENhajRZT3JCNGZPY1JtOU1NQnovb2RBVlR2cnlJYWFR?=
 =?utf-8?B?RnFBRHJBQmdyRkJncGsyOUdhN3M0OTVEbnN5VzJTRkhUaFV5S05MbFNLWFNK?=
 =?utf-8?B?NzgvOCt6U0NzeThXY094Yzlid096eWFHTnN3cFBxWWlBZDVlTkNPLzV3elBK?=
 =?utf-8?Q?Zp69TjRfCo/Rn4LzHP9SRm5fmd7kTYWI5YXCKl9FCW5LA?=
x-ms-exchange-antispam-messagedata-1: 2yfgmP6RZCgPG5RN+KrefSnw2pB4yqlNrVY=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c73e051-3a4e-4004-b971-08da28e88447
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2022 07:27:14.2850
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M6DPCVP+CJb8vnNaOTt+coQh2Qq5tPDE17U78mwGh8YIfWqkt/zPmmjIVI7NP9m41QdlY3kozBW3AO6uAawxr/T34m7lxVGQVdoKXBKt1GgWMF7o5lI3kdnqJI1B8LTb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3313
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogV2VkbmVz
ZGF5LCBBcHJpbCAyNywgMjAyMiAxMTozNyBQTQ0KPiANCj4gT24gTW9uLCBBcHIgMjUsIDIwMjIg
YXQgODo0MiBBTSBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVu
ZXNhcy5jb20+IHdyb3RlOg0KPiA+IEFkZCBpbml0aWFsIHN1cHBvcnQgZm9yIHRoZSBSZW5lc2Fz
IFI4QTc3OUcwIChSLUNhciBWNEgpIFNvQy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFlvc2hp
aGlybyBTaGltb2RhIDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4NCj4gDQo+IFRo
YW5rcyBmb3IgeW91ciBwYXRjaCENCg0KVGhhbmsgeW91IGZvciB5b3VyIHJldmlldyENCg0KPiA+
IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhh
Nzc5ZzAuZHRzaQ0KPiANCj4gPiArICAgICAgIHNvYzogc29jIHsNCj4gDQo+ID4gKyAgICAgICAg
ICAgICAgIGhzY2lmMDogc2VyaWFsQGU2NTQwMDAwIHsNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICBjb21wYXRpYmxlID0gInJlbmVzYXMsaHNjaWYtcjhhNzc5ZzAiLA0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAicmVuZXNhcyxyY2FyLWdlbjQtaHNjaWYiLA0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAicmVuZXNhcyxoc2NpZiI7
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDAgMHhlNjU0MDAwMCAwIDk2PjsN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMjQ2IElS
UV9UWVBFX0xFVkVMX0hJR0g+Ow0KPiANCj4gMjQ1DQoNCk9vcHMhIEknbGwgZml4IGl0Lg0KDQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZjcGcgQ1BHX01PRCA1MTQ+LA0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmY3BnIENQR19DT1JFIFI4QTc3
OUcwX0NMS19TMEQzX1BFUj4sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
PCZzY2lmX2Nsaz47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAi
ZmNrIiwgImJyZ19pbnQiLCAic2NpZl9jbGsiOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IHBvd2VyLWRvbWFpbnMgPSA8JnN5c2MgUjhBNzc5RzBfUERfQUxXQVlTX09OPjsNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICByZXNldHMgPSA8JmNwZyA1MTQ+Ow0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4gKyAgICAgICAgICAgICAgIH07
DQo+IA0KPiBUaGUgcmVzdCBMR1RNLCBzbyB3aXRoIHRoZSBhYm92ZSBmaXhlZDoNCj4gUmV2aWV3
ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQoNClRo
YW5rIHlvdSBmb3IgeW91ciByZXZpZXchDQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGlt
b2RhDQoNCg==
