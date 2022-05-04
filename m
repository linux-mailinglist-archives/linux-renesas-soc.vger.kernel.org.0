Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A23551995F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 May 2022 10:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232905AbiEDIQp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 May 2022 04:16:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343571AbiEDIQo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 May 2022 04:16:44 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2116.outbound.protection.outlook.com [40.107.113.116])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8F832252D;
        Wed,  4 May 2022 01:13:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QmbHuf1GT8F0ewg106TX18hg969QlEnuJtVlbS7AodIGtQaWv5I0H4QS+6UmfEMvJIvtUw+Vvee0jeJOjAn0t0CgmwcCzE8nxMTWYgPrwl0W64YndYn3NBSqaDXcvouPKa55qhayyEvPyS8mbUavaWZC28/B1qXlVSwdexSACOYZwMv2QB4an2j2Kb66RZrHItdRd37Av9KQEznnSd/k2dIQcVsC5Pbf8ZMtjucPHQX//wPci4qnQwJiww43L/nyGNiBDNaZkVYC8Qn1Wxwl++BTEbOuLqiArbu9/FhpQga2S+b5mGsCDGEw6ecy4bJUiL+qjAzHquBuFelq6gvYBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6dY+kM1cpzgZbmKhjRkj3wZLF8EFTox+vZfW9nFLKfw=;
 b=d+TRTZhjmEjrmwcaQ/vNtkYDw8aE4hDMaYjh545H1mKPyrYF9SVZbN0MMkITWTSwZomToW8AA/SnY82D3EjxojeJGueK64GpWQ2OrlHfRCLClKGyHHUAEkhjOmWZACCZ2R/ctzyq3E9y1XjYorc8NKrqS3wQVnFEij/yyJCbI7Bjri88o8UXztXTIeyFm6VzUmo032y12Hzpaa4B3nHzHXg4DGZU80990/Zny+6DfyJMa7oO587kIZdburktk57OTG+cixuM+4357/wEiQWsGeD1ll1Cx9+aydo+61ZpQwxShYW6FilOgSSfEW0QTIcUs3sMgyYDYW1y67Kp4/38lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dY+kM1cpzgZbmKhjRkj3wZLF8EFTox+vZfW9nFLKfw=;
 b=F2YQnfKr3Hn2soNe524ZOMyBuSmvIM9D47iIOhdB9NcRr5O+VdEBLwPZzvBV/Oh2uIdxF3bUyakzEygtebzEfCYLsCTdjLSpT/yVwqgSye3wIgzwPYP1xgVwqTMw309TGTgG29MWvIxtC9E/+rQZOX8n13TGsR/Kzs0GnQ8Pu6M=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by OSBPR01MB2694.jpnprd01.prod.outlook.com (2603:1096:604:22::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Wed, 4 May
 2022 08:13:05 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244%6]) with mapi id 15.20.5206.024; Wed, 4 May 2022
 08:13:05 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: RE: [PATCH v3 01/12] dt-bindings: serial: renesas,em-uart: Add RZ/V2M
 clock to access the registers
Thread-Topic: [PATCH v3 01/12] dt-bindings: serial: renesas,em-uart: Add
 RZ/V2M clock to access the registers
Thread-Index: AQHYXuV1hqLCFafj5kynSu1/YS7yGq0OXgaAgAABUmA=
Date:   Wed, 4 May 2022 08:13:05 +0000
Message-ID: <TYYPR01MB708665EE6476F6F443433AB2F5C39@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220503115557.53370-1-phil.edworthy@renesas.com>
 <20220503115557.53370-2-phil.edworthy@renesas.com>
 <CAMuHMdXjdoY3qrQhHxCdc=W7-MrX7FVeWqZ8Vma2-1Sc5_=hEQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXjdoY3qrQhHxCdc=W7-MrX7FVeWqZ8Vma2-1Sc5_=hEQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1575da41-48a3-46ee-07f7-08da2da5eab3
x-ms-traffictypediagnostic: OSBPR01MB2694:EE_
x-microsoft-antispam-prvs: <OSBPR01MB2694CED9E9E624B5FF7C6C75F5C39@OSBPR01MB2694.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qf7+J4seZUaxablS+eNB9LEg1/8lK9eM6klMGGECLyHXYPUMlIRBJ6qPAW4gL+/Mh8Y0xCCUA131qwypxgdFz9QEr0oc9S48+eKneqsFS/m3KqcQpK1qeIcZRC+bemNkvLFWqYEx3RddbQHgdTQj3moObBuwRxBhqclcc/2xpbqP0sIXMejFY5eyUu5VkDIyefK28xI28FN9iAV+POX8fs+8C1EuYaarzIR4t5iJuYYfhAosR+x/ehhqIb94jVJqc0OS3SopJfV7KTWD/bDOGCLqyvSpdyKMbmsJQSpOC+zLotxRi+fxsNbIqyVluOVBVLNUP2Z7oJ7J2qLARLGhIF0g2IrM/GD8DFMQ9UHqNgOlskgPdcoFDBSzBIrEea9J5Uk1olsMwSkJFU+Vuzlf9uopF8a4RN81oL+JLIPsBbJc9h3cpBsj2Ug+iK5pZtTdchNDAktqRVp/JW9ImNCwfq108gc03gQ5oxqDmAPVPVnofBfJcLssO8ub9AR3koru2OawGA949eRYLda9jBPnpcjWgGt9g2d09bt9oG3sVsx6Fmhq2OktSd52vyyYA7bf7flapsD5zzmg+UK31GHE0PA8/6PfBiLED6yLyAvCE8RgS2N2NhCpkwjCvAbfCpAczyvGhptXP//7mFraEBSpiCUFIjnpp5+oGFKfZC4NKEmqLW74ppLm1YuK/Qt126l3Aa8p9gowPP2FGUBAjhcQqg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(9686003)(26005)(5660300002)(76116006)(4326008)(8676002)(66446008)(66946007)(66476007)(66556008)(44832011)(64756008)(316002)(8936002)(86362001)(6916009)(52536014)(54906003)(38100700002)(38070700005)(71200400001)(55016003)(122000001)(508600001)(83380400001)(186003)(6506007)(53546011)(2906002)(7696005)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZXFSc09uQTZoV2hla0duYjRDcWFMYlNSZ05EZWlOc1JyMllwZDQ0a1hVY29I?=
 =?utf-8?B?ZW9Qd3BQSUJVSXF1MkRRQTdWdEVMZUZYbE1RMVZhb0pGUGwxbFpPMkRSZlha?=
 =?utf-8?B?SEgzVlRlQmVpek80VW9ESU5hOGYzUFdSR2FYZEp5b2ZUT3FHUU5xMlEwdkhn?=
 =?utf-8?B?TmxZQThlNzBvQU1ydTZKNFhjRlhxaEtjSWJQMG1lbkFBSHBMNlJvMTUxT1N2?=
 =?utf-8?B?UGhjNHFyQ25ydE9PWDdNd1lXSUhZZWczajNYUXFxSEY4UVdwVlE1QTIva0lX?=
 =?utf-8?B?aGNoMWZ2TysyRXFxei9tMWxtMXQvbDlCYU1oV2FWZ3VkUVZ1TmdQL1RNdmJr?=
 =?utf-8?B?L3VkY2NGZUR6UzBWTlhnZ1RadGl6YytiaFV5SUYzbENwMWJyS3dpVnpuRnlD?=
 =?utf-8?B?QVVtdUYwYUJhSEpyRy9RNHlyZlRsMlZQQVNNZUFxcG1xVCtlekNsS2REYVFI?=
 =?utf-8?B?RW9rQ0tMaUx5YVcyMllIWWRUY2NnTFIwbjdhRlNBWGI3Wkc3OVFEUVhhbFVa?=
 =?utf-8?B?elU1T3lUUGpXRVcrUStIdDdOa0kzMkZkRWJGbnBOa2gvdWtOZ0c0di9uOXpK?=
 =?utf-8?B?bVFhZWRZTkRMVmIwdDFMTGhPU2trTXhCR05LblQxWEtadG1sWFRJdWp5TTUz?=
 =?utf-8?B?blIySDJwMW5reWxCQ2U1N05aemhldTAzU3RzVy91QTVVUXBOWmIvWTRRYzVB?=
 =?utf-8?B?RnVlQTNramw0a090bzhaNk9VR2ZXTlV1S2NwOVYvWHp5NU51VUpGMmtMeVlv?=
 =?utf-8?B?NEExSE9Fc3BHdHNBaEFWdTRadnBvSUNBK2RMbkw4WTZ1dEQ5anMzd3lLRGJm?=
 =?utf-8?B?c0ZrbjVBbjVGVllpWkdmNGdnU0U4bzZGcktTRGpWRkY1c2Ezb3VVeUhUWFZz?=
 =?utf-8?B?Mk5mN0N5Kzc0T0xsMm9NZmZOYVBscExPL2FJa0VNQkpQeGRDbklvSG40WmRj?=
 =?utf-8?B?Q09qWmNDTjFtYU5ESExQcXJPd1N1eC9DZVNVa1lJWXBmbUJIMzliM3dMRzJ5?=
 =?utf-8?B?UGNTTzZxbmEzdHQva0Q0Y3dSS2lIUU85WEdnaDVEL285M3lVM1dubWd0ZDBE?=
 =?utf-8?B?RTFod0NlWHBhdCtibUxKandKZXVzN2ZHVHdJdkhMb1JObnlQekF1MFpmRE43?=
 =?utf-8?B?aWdxTmFUMWMrc0U3dXpuK21OQ2JTK3lEZ1RGMjN2aDdCS1pIQlQ4NEdMdEdh?=
 =?utf-8?B?YkFjVEZGOWNUVnZtWENqdWs3MkNxYWxmUlhENWxHL0tBY1RPdHdFZDBvdjlK?=
 =?utf-8?B?UHJBNnl1aEQyYWp0cnB4dzdHaGxhQi95ZFczVER0UUVtazdIUFo0cld3Uncr?=
 =?utf-8?B?a2UvTTFqQjBwMFdLT3FoNEg3dWZnT0xQWjNYVXU0SFNMK3V0M0I1YXJISWNX?=
 =?utf-8?B?T3VBVUE4NzZyVXRMZDA3WVNRbHh4Tm5ZMVI5cEFOMEYvYytoaXFORUthM0Ri?=
 =?utf-8?B?RFkrMzFaWStPL1d5b2JydmpRZXRVanowVXVhcmx3bURpaEllYytPYVVOWGFT?=
 =?utf-8?B?a3B2ekNuakU2WStTekZwaE5sMVhxd3hIMWJwVVNWdUtTbVFVeVNJc2lxMytO?=
 =?utf-8?B?Q2xCUmpWZEZkWkh5czNTRm5pRWhCenprbVBxMTlVY2diR0s5Y3BzMEFqUHk4?=
 =?utf-8?B?eS9Kc0FraDNTSDhuYlRLeWdyeXBQSVUvME0xYjJ0akJZcGtIZDMrTitNdW1P?=
 =?utf-8?B?YlNLTE4vNGd0YzhsemM5TUxFYUpFWDJiWFI0d0pINStpalpaaU1jaGRTdk9D?=
 =?utf-8?B?ZXg0aXRPUjhweFlzcytna1p1ZnJEYk5PTWJTa2NXa1Q0YUJVeDh5MnAvemZK?=
 =?utf-8?B?UDFWK25wRm5mL1drQ1R4cnUvQWF3QjlSaG1XZkpWOWRWZkRyTjFCNXhPb2Jq?=
 =?utf-8?B?Q08rZ29qbm9WVnFUTGEwckdNbUQyME1Zc0JPbFQybVVxejFVZ3FLQ3NSenNT?=
 =?utf-8?B?dmNoSXljdW5oU1pXMVh2a05TbG9LQWtQZXJ6Q0RJYW5PTi9VSURZVmJIdjhM?=
 =?utf-8?B?ZWptS0M5TlJ0eENLVGRqd05ubytaaFducWlsajk3elMwZThOdC8xUTVrT1RN?=
 =?utf-8?B?MjFEWnpDSEhSMXN6RWFlcThWb2I5bmlEaVcwbGdiRjIxWm9kQ1Z6aDJBVE5X?=
 =?utf-8?B?SS9UUkhqcG9OMks4K055aGlKcjYrVEtpS2ZlVzMyR0dXWWsxOUdqU2dUeWly?=
 =?utf-8?B?Z3Z2UmVsK3JzZ21KdUd6R1BIbmFwL2V1TWV6U2p5T1VQV2tLTzNnZ3kzcGNI?=
 =?utf-8?B?amJNWjF6OExqbmtsSk9LbFkrZFFSWktMTHU1Q0dSYVkxYlZCVEJLVjU1TEFa?=
 =?utf-8?B?My8yMHVkM1Z6a3pyT1lVdHdHdFdaWENBVTJWSkczazlkSERzNUkvZlJXdGNh?=
 =?utf-8?Q?pZrOE7Cp1YCdlN44=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1575da41-48a3-46ee-07f7-08da2da5eab3
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2022 08:13:05.6333
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8OU8M4WynfQxcFDO9ETy5wDUrEccKcNipm0nmVwUP2FQt3q1OrxUbggujeBIyoX2oN5NtK1vLkSHxVSqY3N+0Ds5cQ6RE60qIDgpr5nIC6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2694
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gT24gVHVlLCBNYXkgMywgMjAyMiBhdCAyOjAxIFBNIFBoaWwgRWR3b3J0
aHkgd3JvdGU6DQo+ID4gVGhlIFJaL1YyTSBTb0MgaGFzIGFuIGFkZGl0aW9uYWwgY2xvY2sgdG8g
YWNjZXNzIHRoZSByZWdpc3RlcnMuIFRoZSBIVw0KPiA+IG1hbnVhbCBzYXlzIHRoaXMgY2xvY2sg
c2hvdWxkIG5vdCBiZSB0b3VjaGVkIGFzIGl0IGlzIHVzZWQgYnkgdGhlDQo+ID4gIklTUCBGaXJt
d2FyZSIuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQaGlsIEVkd29ydGh5IDxwaGlsLmVkd29y
dGh5QHJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAt
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL3JlbmVzYXMsZW0t
dWFydC55YW1sDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Nl
cmlhbC9yZW5lc2FzLGVtLXVhcnQueWFtbA0KPiA+IEBAIC05LDkgKzksNiBAQCB0aXRsZTogUmVu
ZXNhcyBFTU1BIE1vYmlsZSBVQVJUIEludGVyZmFjZQ0KPiA+ICBtYWludGFpbmVyczoNCj4gPiAg
ICAtIE1hZ251cyBEYW1tIDxtYWdudXMuZGFtbUBnbWFpbC5jb20+DQo+ID4NCj4gPiAtYWxsT2Y6
DQo+ID4gLSAgLSAkcmVmOiBzZXJpYWwueWFtbCMNCj4gPiAtDQo+ID4gIHByb3BlcnRpZXM6DQo+
ID4gICAgY29tcGF0aWJsZToNCj4gPiAgICAgIG9uZU9mOg0KPiA+IEBAIC0yOSwxMSArMjYsMzIg
QEAgcHJvcGVydGllczoNCj4gPiAgICBpbnRlcnJ1cHRzOg0KPiA+ICAgICAgbWF4SXRlbXM6IDEN
Cj4gPg0KPiA+IC0gIGNsb2NrczoNCj4gPiAtICAgIG1heEl0ZW1zOiAxDQo+ID4gK2FsbE9mOg0K
PiA+ICsgIC0gJHJlZjogc2VyaWFsLnlhbWwjDQo+ID4NCj4gPiAtICBjbG9jay1uYW1lczoNCj4g
PiAtICAgIGNvbnN0OiBzY2xrDQo+ID4gKyAgLSBpZjoNCj4gPiArICAgICAgcHJvcGVydGllczoN
Cj4gPiArICAgICAgICBjb21wYXRpYmxlOg0KPiA+ICsgICAgICAgICAgY29udGFpbnM6DQo+ID4g
KyAgICAgICAgICAgIGNvbnN0OiByZW5lc2FzLHI5YTA5ZzAxMS11YXJ0DQo+ID4gKyAgICB0aGVu
Og0KPiA+ICsgICAgICBwcm9wZXJ0aWVzOg0KPiA+ICsgICAgICAgIGNsb2NrczoNCj4gPiArICAg
ICAgICAgIGl0ZW1zOg0KPiA+ICsgICAgICAgICAgICAtIGRlc2NyaXB0aW9uOiBVQVJUIGZ1bmN0
aW9uYWwgY2xvY2sNCj4gPiArICAgICAgICAgICAgLSBkZXNjcmlwdGlvbjogT3B0aW9uYWwgaW50
ZXJuYWwgY2xvY2sgdG8gYWNjZXNzIHRoZQ0KPiByZWdpc3RlcnMNCj4gDQo+IEl0J3Mgbm90IG9w
dGlvbmFsIG9uIHI5YTA5ZzAxMSwgcmlnaHQ/DQpSaWdodC4gSSdsbCBmaXggaW4gdGhlIG5leHQg
c2V0IG9mIHBhdGNoZXMuDQoNCiANCj4gPiArICAgICAgICBjbG9jay1uYW1lczoNCj4gPiArICAg
ICAgICAgIGl0ZW1zOg0KPiA+ICsgICAgICAgICAgICAtIGNvbnN0OiBzY2xrDQo+ID4gKyAgICAg
ICAgICAgIC0gY29uc3Q6IHBjbGsNCj4gPiArICAgIGVsc2U6DQo+ID4gKyAgICAgIHByb3BlcnRp
ZXM6DQo+ID4gKyAgICAgICAgY2xvY2tzOg0KPiA+ICsgICAgICAgICAgaXRlbXM6DQo+ID4gKyAg
ICAgICAgICAgIC0gZGVzY3JpcHRpb246IFVBUlQgZnVuY3Rpb25hbCBjbG9jaw0KPiA+ICsgICAg
ICAgIGNsb2NrLW5hbWVzOg0KPiA+ICsgICAgICAgICAgaXRlbXM6DQo+ID4gKyAgICAgICAgICAg
IC0gY29uc3Q6IHNjbGsNCj4gPg0KPiA+ICByZXF1aXJlZDoNCj4gPiAgICAtIGNvbXBhdGlibGUN
Cj4gDQo+IFRoZSByZXN0IExHVE0sIHNvIHdpdGggdGhlIGFib3ZlIGZpeGVkOg0KPiBSZXZpZXdl
ZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCg0KVGhh
bmtzIQ0KUGhpbA0K
