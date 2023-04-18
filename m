Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC2F6E5BBE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Apr 2023 10:12:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbjDRIMk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Apr 2023 04:12:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbjDRIMi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Apr 2023 04:12:38 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2098.outbound.protection.outlook.com [40.107.114.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D58F173A;
        Tue, 18 Apr 2023 01:12:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f5SVbBdMRGEf6rJHRgGE3h2MivhmNutj7fSM/FBlQ06Jwactm1gq4Stx0n4GKqW9GUQwPwMONpVs/js+grzXyDvdynftxkcf54uDK3cq2ggkgM4acQvhfMl3NvVtaOZw+5rOslkmAaDK0G3epAv4SUOoRdX2xUgIoVUfDOf9TZVW8aCDjmOvH+3+HHwfQPqW0oiYahEWJen2syn+WVr/m2EjdEi+pC0gMvcripD2jGCMLILQwNS21fKVbkyq7R12cE6PB9Vl5xOP3HbQ+f29xLuSFjdEub73yYgdix5+Crkbq0jzjL2gXqkXcasdDP3QdVo2IZOreHzr/Sdln/c75g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9KzVfg8NxM6f1tJhDnQK9wVoFrnKeXKtrZGPlPhvaVw=;
 b=JCwtsJTQ9iPlpL1VIhPBjsbaxvX5ZcN70wbwKa+/SqJlKd83gioVaoyTp1Bj2t07DSRf0sF4a4JGr882ZkbuUFUuCI/ja790eyFgyBjwUCsAvBCXZQITbn4ed3fmc+v4G9f+UH8jbnZkB0OEcP3YDLVRM5iLVLDQyb8+t0Jfpq0JKH0QKysaROTYx7otf9RcRj1XJ0+cHnv8nuqJfsEWo0tcVoMPrFVmzf/FqT8o+eguB1FSFFC/hIG5va9LUgzeXei9DdRPJMAnGzBu20bRR9hmPji1P8Kzb27+sdMJ2VUHbRrX/nzzvLePjStxU0Il6pfnwTK3IGOIpWsOFYzRAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9KzVfg8NxM6f1tJhDnQK9wVoFrnKeXKtrZGPlPhvaVw=;
 b=DYICFfJlhgXG9AkppBP4CLoWmUP7jWDe2d5lGF9hUL0xh7mutzhnQbo5mKYIthgCztvl5rDrvlgGRkgeLaglkoA4DHxRTQRW2+HH2CGfsYLJf+O9YKyyFGMFkmiqpdVEosRayKnqWF6eq/GsFObMZ9lpowPn0PN21vaB34M2mBQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB8433.jpnprd01.prod.outlook.com (2603:1096:604:186::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 08:12:28 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%5]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 08:12:28 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Christian Loehle <CLoehle@hyperstone.com>,
        Richard Weinberger <richard@nod.at>
CC:     linux-mmc <linux-mmc@vger.kernel.org>,
        linux-renesas-soc <linux-renesas-soc@vger.kernel.org>,
        wsa+renesas <wsa+renesas@sang-engineering.com>,
        ulf hansson <ulf.hansson@linaro.org>
Subject: RE: Poor write performance to boot area using rcar-gen3-sdhi
Thread-Topic: Poor write performance to boot area using rcar-gen3-sdhi
Thread-Index: jiFrfBZIr7HKS7MkHilHFl02Bun/Q/AMgGyAaB0PmjP8vxGocIAAKEng
Date:   Tue, 18 Apr 2023 08:12:28 +0000
Message-ID: <OS0PR01MB59224F6C76184AD307202528869D9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <1674847756.113858.1681762124503.JavaMail.zimbra@nod.at>
 <OS0PR01MB5922B8343E772A762315F764869D9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <971572458.117024.1681798584774.JavaMail.zimbra@nod.at>
 <02ceda502af34bf0af53d52598a0b71f@hyperstone.com>
In-Reply-To: <02ceda502af34bf0af53d52598a0b71f@hyperstone.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSZPR01MB8433:EE_
x-ms-office365-filtering-correlation-id: d2d4c5de-8fd2-4f7b-8de6-08db3fe4a6d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x/5v8osJHvDfKp0AcGNXQc3WRukXvmcZYAVfHpmXgc72kSjt+4vGpiuwUL0zEOUP+5EOddBd40nfjKFk+LfZoif/BQzhM6DpVgo8hqc95UMb3b8gYaM6nunSb14FCtQkRLyWpQvvH9sYc2cNP2+zc7ezXSAsm9ZqxxRFl7Sc0YTi7S6H+p3+kFE1UI/H2rL16Arb4X2xP1yDAZ4s2JU+jeoG746WCuGIScJnWAp1YZ/OifPdrk0JhJVoga3f9lScm8zAtVWMYV/vAc6IjP/ZR6Ic5TRyynMbJaviFCOMZhLRB1IXmZR3dg/1OXGiRRGj3Q58YWg58PDSgHe1qWAHwztnAIH2P+bna5gee4lMIGVRdFj1linDZDK525TYQpU57bcVTldtYxSbqLT9CUZwlHpWb6Wv/lwccHdPrH9MO7d33yeDF4axveyVnkmeAABXU7ED6a4Ni6wT2aAnsxSFy+HEEUKoL5b7JjYw2LakhO1RAUFM/jHwk3K5PwksyKJvcUKP3Y/OfvHPMCMKoYNrI4kTO0nmvPSvSP7UqSfvXetT9tVgIjTRlY5dNROm9oKv8zISXfyI+3cDSIui7v0EaITV6j9KxO1Z9sh4jTSVtU8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(451199021)(966005)(7696005)(478600001)(86362001)(110136005)(55016003)(71200400001)(66574015)(26005)(83380400001)(33656002)(9686003)(6506007)(53546011)(186003)(38070700005)(38100700002)(122000001)(64756008)(76116006)(66556008)(66946007)(66476007)(316002)(66446008)(2906002)(4326008)(8936002)(5660300002)(8676002)(52536014)(41300700001)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QzJ1alBFdStVNW9rNzYxQ0dOV21uWUZHc3BTWHl3MFpRUnhGUVRRVE15NDVZ?=
 =?utf-8?B?VzFTVm1pVFo2REdJYVpBYUxtSXNDWEpxNll4d0pyb3A5VWpYYVRzbXVXSzdx?=
 =?utf-8?B?K1RlQkdFTVk4dTZxTmdJNzVWYVBqNnh6TzNJNHltRHg4RHZCVTgzTWRkSlkz?=
 =?utf-8?B?alBTOXROWEJzaDc1ZVlvNWNFeHhyT3VDRnZpU09rOU5SSUpEc0g5T09lRldT?=
 =?utf-8?B?NWFRZHNCNGFwdm51ek1KYXJRY3pGYmJJNk0yOC9xOE1GaWU1STBJdU5FL01Z?=
 =?utf-8?B?YmhYSjl4dmt3V0FwSXd6ZytqMHBzY0dOcDJ3RytFUG1MR2FJN1djV0oyVzNP?=
 =?utf-8?B?SEZ6N3RZeFBZb3MyaTVHTTJoRkpkR0N6cU9PWkFaY1FsdWM3T1l2YzJPbUxm?=
 =?utf-8?B?Vy9VMy9JdXNoZmFTeU5VQlpZSXBFajY0bEhVYkJGZnBlOU1WeUdnV21yWlF6?=
 =?utf-8?B?VDY0b0llbHJUbG5FcFBpQ1hJazBqc0g1eVl6SUNnQUVtb2lHUTErOUtKSVYx?=
 =?utf-8?B?VzM1NWFDem5ISFFiRmVpam0zZCtvVmk5ckcxNWRNS2tvODFXMFBtbFE3S2or?=
 =?utf-8?B?RTBPcW5pYW5yc0dRR0I0THdqazZaVXFLVkpFRnRpRXAxYW13VzJnWlZNMXAy?=
 =?utf-8?B?QXJEaEpIOUNIek02cjBSZTZ3U2RxRk5YOTFlaTVMcTRBTEhpc2M2N0xnbDdt?=
 =?utf-8?B?MWFMSnFxd3JkbFJvWmE2bVdzeDhiQzZuNmQ4Yko3N0RxazZtci8wbFZOOVVy?=
 =?utf-8?B?WTRXalRiNTMydks2OWkwWUgvL0tFQkRrOW1RQjFrVkxqM2ZQTEJCM3h3d0Zp?=
 =?utf-8?B?KzQ2QWJrdDVzNGlSSmE2NzRuKzB1SXJ3VlRXQWtybklsNXB0aHo5UWlBZVNV?=
 =?utf-8?B?OWhHV2E4ajJZMFE0UWtpa1RtQTBxeXZzVUNLUEJRMlBSRDRGZFZXdnc1Q1Iy?=
 =?utf-8?B?YjgwVWFHNDI5MVEvOThJd05WVUw2YTZ1VW5oUVFIUm0rcnRvbTdMTThJNHYr?=
 =?utf-8?B?OTJLbm1BbTkwMEZTWHdwZURWNmtyWUppQjdidTJzQ25jNndmK2tVY2x1MlBx?=
 =?utf-8?B?RW9RL0ZCY2hNWUJuUlRKcEd3eEhCSHdOWjc5bkVIMzhxT04waVNYQ2xySlJ2?=
 =?utf-8?B?NUkrVW81NkhnczZhdFA5N1VKSkdlS0tDaFhETmdibm1ibEdkR29QejBRQzZP?=
 =?utf-8?B?d1lLeTdmbjl1SENOdUVpanNSZVFiWm9jUXpqVktmcmw5UkJtekpMOUNQQUVN?=
 =?utf-8?B?SnVpMWFNcUdod2xCNWJrOU1lYVVISC9UaE1tdi9uRkZjNU1PNnIxckQvUWdi?=
 =?utf-8?B?OGRRSzB4Z2pDaU5kdndpcWJzS1phNDR1dFhKcU9xdnhOdERWWkhZYy84eit4?=
 =?utf-8?B?WlFmNWxrWGM5SUJQVlJmcDJPeVVhR2VWT0ovaGJmQjFrcTJiTWtzS3ZsMnkv?=
 =?utf-8?B?bjFDbUo4S0txcGc5L3JpZXFvUFYvVUhJSGJ3Mlp4bFJjSHdXanlmSnpWSk1n?=
 =?utf-8?B?eVpncUYzZ2lDd042dnY3T2dhZ0RrMSszckRGa2JKRlNTMEN4TThrWU9zWlNx?=
 =?utf-8?B?RXVWaEpiR21OTWphc3VlMWYrNVpSRWxjUlJHczE3c3F2TzMwYjAvZDVXTnNv?=
 =?utf-8?B?ZDU4eXkra3RlTzZVdmtRcURuMldSUFNyWGhGMStlaFBuM0RTMHRBR3hTU0tZ?=
 =?utf-8?B?Q2RwZU9BbXk2VElWalg0bnloOEdwS3JuSTU0WWpwbTBtR1V5U1A4YjRidXlQ?=
 =?utf-8?B?R0tqWXEvdWdINm5OTWViTlRpWXBQTVBnY2daNjJZOTNKYjVLTUJJendwZUpZ?=
 =?utf-8?B?Rjh5eXBRRk5pWFhYVlE3cWRMa3F4N1FGZGlOZ3JrZGcvSE5QcWVSVTN6ZjdS?=
 =?utf-8?B?Rm9pWmhDaUJkRzZnQ2pCVUJ2YzJUemkrQjFuVHdGVFFlYk9RYkU0bndMZENU?=
 =?utf-8?B?MjJTc2taWUgwYlJSbnBaMUNHNXZ6UWdINzFQQzFmYlVRYkpGSjY3czhLejFi?=
 =?utf-8?B?RTNHVG0wdEgzL0lXakIxUmNRbytvQnhMa3ppaUlTRE80eFRYUWZPbHVSL2tS?=
 =?utf-8?B?Y01YM1dRNVZibElscUtybHUxQjNXTGZqU1RUMHlTSjBxdE5HaG5UaVJEckpi?=
 =?utf-8?Q?z2bgthyBteW6aSlKeCwp8+Zl3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2d4c5de-8fd2-4f7b-8de6-08db3fe4a6d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2023 08:12:28.7052
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RGDze41GbxD84dujDz5iORaEAtpf6GJqZbB3Xvrb9NUt/0yWFyWhke3MkwKOZuTE63yM8tOo2b75xNj0IJU5eqNso9lTAN57J5mJl/E2nEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8433
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgQ2hyaXN0aWFuIExvZWhsZSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBG
cm9tOiBDaHJpc3RpYW4gTG9laGxlIDxDTG9laGxlQGh5cGVyc3RvbmUuY29tPg0KPiBTZW50OiBU
dWVzZGF5LCBBcHJpbCAxOCwgMjAyMyA4OjQ4IEFNDQo+IFRvOiBSaWNoYXJkIFdlaW5iZXJnZXIg
PHJpY2hhcmRAbm9kLmF0PjsgQmlqdSBEYXMNCj4gPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29t
Pg0KPiBDYzogbGludXgtbW1jIDxsaW51eC1tbWNAdmdlci5rZXJuZWwub3JnPjsgbGludXgtcmVu
ZXNhcy1zb2MgPGxpbnV4LXJlbmVzYXMtDQo+IHNvY0B2Z2VyLmtlcm5lbC5vcmc+OyB3c2ErcmVu
ZXNhcyA8d3NhK3JlbmVzYXNAc2FuZy1lbmdpbmVlcmluZy5jb20+OyB1bGYNCj4gaGFuc3NvbiA8
dWxmLmhhbnNzb25AbGluYXJvLm9yZz4NCj4gU3ViamVjdDogUkU6IFBvb3Igd3JpdGUgcGVyZm9y
bWFuY2UgdG8gYm9vdCBhcmVhIHVzaW5nIHJjYXItZ2VuMy1zZGhpDQo+IA0KPiBZb3VyIGVNTUMg
bGlrZWx5IHRyZWF0cyB0aGUgYm9vdCBwYXJ0aXRpb25zIGRpZmZlcmVudGx5IHRoYW4gdGhlIHVz
ZXIgYXJlYSwNCj4gZS5nLiBpbiByZWdhcmRzIHRvIGNhY2hlLg0KDQpCb290IHBhcnRpdGlvbiBp
cyBzZXQgYnkgVEYtQVsxXS4gSG93IGRvZXMgaXQgZGlmZmVycyBmcm9tIG9uZSB1c2VkIGluIExp
bnV4Pw0KWzFdIGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2FybS10cnVzdGVkLWZpcm13YXJl
L3YyLjguMC9zb3VyY2UvZHJpdmVycy9yZW5lc2FzL2NvbW1vbi9pby9pb19lbW1jZHJ2LmMjTDE2
OQ0KDQpDaGVlcnMsDQpCaWp1DQoNCg0KPiBJcyB0aGlzIHJlcHJvZHVjaWJsZSBmb3IgbW9yZSA0
ayB3cml0ZXM/IFdoYXQgYWJvdXQgbGFyZ2VyIHdyaXRlcz8NCj4gVGhlIGVNTUMgbWlnaHQgbm90
IGV2ZW4gaGF2ZSB0aGUgbWFwcGluZyBhdmFpbGFibGUgYWZ0ZXIgYm9vdCBhbmQgZmlyc3QgaGFz
DQo+IHRvIGludGVybmFsbHkgc3dpdGNoIHRvIGl0LCBpbiBjb250cmFzdCB0byBhdCB1LWJvb3Qg
c3RhZ2U/DQo+IA0KPiBBbnl3YXkgdGhpcyBpcyBwcm9iYWJseSBtb3JlIGEgcXVlc3Rpb24gdG8g
eW91ciBlTU1DIG1hbnVmYWN0dXJlciBhbmQNCj4gbm90aGluZyB0aGUgaG9zdCBpcyB0byBiZSBi
bGFtZWQsIGFzIHlvdSBtZW50aW9uZWQgeW91cnNlbGYsIHRoZSB0aW1lIGlzDQo+IHNwZW50IGF0
IENNRDI1Lg0KPiANCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFy
ZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4NCj4gU2VudDogVHVlc2RheSwgQXByaWwgMTgs
IDIwMjMgODoxNiBBTQ0KPiBUbzogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29t
Pg0KPiBDYzogbGludXgtbW1jIDxsaW51eC1tbWNAdmdlci5rZXJuZWwub3JnPjsgbGludXgtcmVu
ZXNhcy1zb2MgPGxpbnV4LXJlbmVzYXMtDQo+IHNvY0B2Z2VyLmtlcm5lbC5vcmc+OyB3c2ErcmVu
ZXNhcyA8d3NhK3JlbmVzYXNAc2FuZy1lbmdpbmVlcmluZy5jb20+OyB1bGYNCj4gaGFuc3NvbiA8
dWxmLmhhbnNzb25AbGluYXJvLm9yZz4NCj4gU3ViamVjdDogUmU6IFBvb3Igd3JpdGUgcGVyZm9y
bWFuY2UgdG8gYm9vdCBhcmVhIHVzaW5nIHJjYXItZ2VuMy1zZGhpDQo+IA0KPiAtLS0tLSBVcnNw
csO8bmdsaWNoZSBNYWlsIC0tLS0tDQo+ID4gVm9uOiAiQmlqdSBEYXMiIDxiaWp1LmRhcy5qekBi
cC5yZW5lc2FzLmNvbT4gTm90IHN1cmUsIHRoZSBmaWxlIHN5c3RlbQ0KPiA+IHVzZWQgYmV0d2Vl
biAvZGV2L21tY2JsazFib290MSBhbmQgL2Rldi9tbWNibGsxcDEzIGlzIG1ha2luZw0KPiA+IGRp
ZmZlcmVuY2UgYXQgTGludXg/DQo+ID4NCj4gPiBJIGhhdmUgc2VlbiBwZXJmb3JtYW5jZSBkaWZm
ZXJlbmNlIGJldHdlZW4gRkFUIGFuZCBleHQ0Lg0KPiANCj4gVGhlcmUgaXMgbm8gZmlsZXN5c3Rl
bSwgSSdtIHdyaXRpbmcgZGlyZWN0bHkgdXNpbmcgZGQgdG8gdGhlIHJhdyBibG9jaw0KPiBkZXZp
Y2UuDQo+IA0KPiBUaGFua3MsDQo+IC8vcmljaGFyZA0KPiANCj4gSHlwZXJzdG9uZSBHbWJIIHwg
UmVpY2hlbmF1c3RyLiAzOWEgIHwgNzg0NjcgS29uc3RhbnogTWFuYWdpbmcgRGlyZWN0b3I6IERy
Lg0KPiBKYW4gUGV0ZXIgQmVybnMuDQo+IENvbW1lcmNpYWwgcmVnaXN0ZXIgb2YgbG9jYWwgY291
cnRzOiBGcmVpYnVyZyBIUkIzODE3ODINCg==
