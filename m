Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 898FE50E5CA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 18:28:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243206AbiDYQbF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 12:31:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243489AbiDYQau (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 12:30:50 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2117.outbound.protection.outlook.com [40.107.114.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBB9591552;
        Mon, 25 Apr 2022 09:26:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lzn13YmCjCs2v0VZaM2wK2vgt0iI+/HFjgvLa3yL1pUZ7InUpybNdoEs/FGM67Htisjo3fxkqDJ70YF+iNJG4yq1htKGhKe/HpN2dx+bBKZ46jtVUF46oZDI3xLxBLlilI47WIvO/W6vCpJBNhrDjllsGRzFdEpdvF5KNqrzjDDMt6STCe9rMPGFjnuAGzqCPSL+AQLO+9Zdp5roGJpYbyiuLmky3SNehDYSiB4pLEmG2ZIqsjqaGyss4w7AkcqCTN/YwURG6p52wF/1iP01rAdlqkqYuOO9w950WkV7niI2ObtB2Vn9sRpyYxmUvPlJGfF7aNAsTfohDPPJk0adoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xn/sCVVUF9mH6f2+NqQX55HxtTbC1VBLADGPiHOrf2s=;
 b=ZDmdc9GPwxSHOkIaWncFiEmbEqfm/07KvVSTFwksmYtel9io+G3T3r+EVrPyYJSvJ6K/SL4Q81DKMs5bOuXNmLQOsb93Fu4UfyHWGJ7pGU7mEJ6By/B+YRoKZsmc+KCkLeGVd2dlb44Kch1DoiVWSqTnFo444tSZCwXiQv1tL9+10/sSyUSgdvPRLvNb6F5zrxOHrMMvNc/4lj8p4BR2XbQkkF6oXRRxifINGwEedpIjatDZkCsB1QmskfVm8WOXT3np+ClbgsVN7TojqxS4UfrOwh31IWUPN3yNFh+lJav4g9S7xX6Jr2eVJ9Zra6moQCebU1qK+eZ/XjAKuEGkvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xn/sCVVUF9mH6f2+NqQX55HxtTbC1VBLADGPiHOrf2s=;
 b=iIKg/AFHQwpm6IgwHBgyRQmLfxreeR7BSMTWoedwYGO4LgCsgIC9bAXiOWw7kezzGsJ8yaqJ5i4ssn5aZNGcuN7BIOJzCvo9ifNbUBBZA7KtkYaINeCUE9D0FWvHdPOj1u5thrLerFUoR4GrN8wCdtOSOlebqlRH/BiMvfC+Yfg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYYPR01MB7735.jpnprd01.prod.outlook.com (2603:1096:400:119::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Mon, 25 Apr
 2022 16:26:41 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db%4]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 16:26:41 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 1/2] arm64: dts: renesas: r9a07g044: Fix external clk node
 names
Thread-Topic: [PATCH 1/2] arm64: dts: renesas: r9a07g044: Fix external clk
 node names
Thread-Index: AQHYVxtpZzDNpS2cMUqYhuvLl0rlk6z94/kAgAC6McCAABNF8IAAJb8AgAACQVCAAEqYgIABnhbwgAAIFgCAAAN9gA==
Date:   Mon, 25 Apr 2022 16:26:41 +0000
Message-ID: <OS0PR01MB5922AB6D16AB716FECAA140786F89@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220423140658.145000-1-biju.das.jz@bp.renesas.com>
 <f9c6e5e2-c819-d309-0c11-b87deb772858@linaro.org>
 <OS0PR01MB5922CFACC8FEC6D67E6BFC4986F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB59220968EBDF76A16F7E63A386F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <7bd2ae6d-c55f-4ab7-0c98-72da0d5d4050@linaro.org>
 <OS0PR01MB5922619EE8816DA1676BAB4D86F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ddf78c65-7cac-04cf-9f8d-e19335815473@linaro.org>
 <OS0PR01MB59222BF5C0D4749C8AAFC57F86F89@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <886fda10-fad9-83c4-10f1-1ae36cf0a6b0@linaro.org>
In-Reply-To: <886fda10-fad9-83c4-10f1-1ae36cf0a6b0@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2951acaf-32cf-4098-5d03-08da26d86179
x-ms-traffictypediagnostic: TYYPR01MB7735:EE_
x-microsoft-antispam-prvs: <TYYPR01MB773577E14527364848D588E286F89@TYYPR01MB7735.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8pw006HSTjfDjlhw2Ty83wHFtUXg/7a37piLlxTLIFtHU2M6lO7liv5ZwFbW9O0IlACupRTo5mtBPB5JJoPLFIMB4Hkhb1ZnerW+D32PSrAOfEy9JU11XKMHp9wwYjTilakuhwkMS3B3m4xNczhS8TiXurKxQfkQ99b4snnT9YgWERUG349LAPGBAQ+qCKW+pLEoWNDcNLv5fwEaMVK6eDJHq7cYcD/xc838Q4hB+zRlIQp7i7xaDc3/Rwfnpylg+BCfR6xHwS/jLEAwy2LSySuPfYFoXSVTvRddlh0wX0vaQTFOUx/2tBFJXBkBOoPhHo6uJekaNmS59UxhhBVYJSzrbDx+BdjLUUwONV9MiP/H6jWgLgjsr1JlBktoyZFPFgkPjb83yjdOwOBsERHsTH44J7k9Q+MM9JNLQFgVwZUFCvuhlBUFEgo353yCSF4hN3KHOXNuV9980Hx/ltiAC4cN03d4vyBCo3bR03duSdH3ff4wonMa7/L8SuEqD6XhEnOe9mvg1VqraRb+F4tBG6ZU6KHBPeNvqfI2zQYJV9R7qiyALLCnpPHilidgmnMEVJa12YQsGm6kQu+U5tWB+Bj7DDJzA3D/o9+Gvbgx6LNGIWGBVmpRIhVKODy3nJ+Oq7SGKOq3hrz5rgVx3y5/6emlcJTiny394HzSuw2I0Hb3b/w7cjut1pw978gMdeOEQeNbCRCAAmj2ljKwYjoNJQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(122000001)(66446008)(66556008)(8676002)(76116006)(66946007)(52536014)(86362001)(64756008)(8936002)(2906002)(26005)(9686003)(5660300002)(7696005)(6506007)(53546011)(66476007)(54906003)(38070700005)(186003)(107886003)(71200400001)(55016003)(110136005)(316002)(4326008)(38100700002)(33656002)(508600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TUU1TVBmUFZva0FzbXphUU1uYkkraGtIemtPYVBRTDNFd0RyUTVrMXRkVHV2?=
 =?utf-8?B?dFlrSnVIb1BoekdKUVJWZnNLMlZFSmlzU3ptZzdmNFFoL1VISEFBYStZMi9K?=
 =?utf-8?B?Y0IzVXB5d3p2U0d3dGU3WmMvSDBnSWowS1A5M2Q0d0VjdmJQNUJsTTVPVU5s?=
 =?utf-8?B?SmpCNjV6Rjh3Zms0ODJvbXNEelA2eVNlaEJrSlpCMVVFR202SzRFOGdRU1Fn?=
 =?utf-8?B?emxPNWJrTWhCNDJ4TUFWZmdKWUJNNlp2dXQ5YjU4R0s0ZnR6aEQzSU5OSk1W?=
 =?utf-8?B?YlhyU2pHL3Z4RmQzWVJEd2xySVJUYzh1SmdMVklVWGpHZjNITXpZelV1SnJl?=
 =?utf-8?B?MW1nL3Q1c2VwRkV4bzM5VHhEeXdhMXpSY3BSZGYxeFVUT204VVJSUE53OXRn?=
 =?utf-8?B?QlVxcU1tV016L3dycURDQ1p5TjBoellGODZ5QWdtUzYwb0FvQTNEeWZPVkp6?=
 =?utf-8?B?N2IwME5wM0Y0Q2dmR3hGMXA2Q0t3MkNza1lOMC9QNzBwNm0xajFPWGpONmUx?=
 =?utf-8?B?ekZaemhKWTcwbzUwRHhTWGdnbE1PdmlUZ2ZWaEFKWUg4N3VSMDNscnhMZFZz?=
 =?utf-8?B?SHBaSUlyMUdzM3JiOVZSVVVkMXl5Q050eFdYZFMrUytZZ0F6Yks5QUYwOEdk?=
 =?utf-8?B?QVF6TU1ENkYyT3hOeEZqRXdrR2VIaXZncHZ6b3dBNnd4Rk1lNFZ5MXdEaXNw?=
 =?utf-8?B?ZStXLzFzMnd5MFI4K1Rwa0hwNVowTVZiMDdSOGhBZzZzWCtyR2VtbXNxRkVZ?=
 =?utf-8?B?RWlZYTkwTlVMRjQzZ2dTTENKYi85enRSQlByNGRPUjVLOVAwSWphMDNNcFZB?=
 =?utf-8?B?a0lncm9oSHorMnZYNlhWcDMvT3lST1Q5MG9pc05abWxHMkpyUzB4a3FYTm5I?=
 =?utf-8?B?dnh2STJGbDJFMGFOZmRaakw1VmlhRmZ0RW1KUEMwR2R1ODFjWU94MWY1Mk1L?=
 =?utf-8?B?ZFJrL0dhSTJ4TmN4V1gwRVM3OEZ4U1dMR2d2NDY3SEpQMU5CdnQwcnB6ODV1?=
 =?utf-8?B?UzY5czZRQUZsZjJER0xBRjJsVEhpekpsOVhoK0FPQTBhZ1JiL0ZnUnJMNHVt?=
 =?utf-8?B?RnR1MDlxQVAzTGNEZ042blpiUEg2T295MVYrUXlidlZoMlZtWEh1UThxeUhY?=
 =?utf-8?B?VTFqQW1UT2dqdFJzTjd0YXNnQ2lKZkYvekUvS0hvb25mdlZrZ0Z1VXlsOXdk?=
 =?utf-8?B?bHJIb3kydEs1d1YvbFZMeE96WlUvSjd5V1ozcCtobzlqeEVySm5OUEJPWHY3?=
 =?utf-8?B?WTJGNDloVmpJWTZ5Vm5vR21KOGtrbUhpTlU4SEIrdGxVK01QRDVxYUlFTVV0?=
 =?utf-8?B?OXhMQitHL0xOdUNMNFU5YlMxOFhmQzBRclFpTy81RmlhSWJreURzMmxWaWtk?=
 =?utf-8?B?RW9CZVFhZVd2SEpmaXBvRlQ3TG1HNEg4NU5DampCTS8wSGNEZ0JxYk5IMHh6?=
 =?utf-8?B?VUtCWUxwYnBLRWxBdkhaOFJmSFJmZHV1QWIxLzQzTkFEVmk5YVMvb1ZFb00x?=
 =?utf-8?B?U2Eyb25qdC84QWpETExiOUdrWU5JclpDdEYvaWhJc1Y0bkVBVzgxNFNlQm9u?=
 =?utf-8?B?YlV4ZXgwdm5BMWpOQlgvUWVoUW8wdnJHRVJrODIwL3lMeEJlUXRqTjdZMUFy?=
 =?utf-8?B?R1VsUEJnSDFnSmxvd255SjYzOVo5azZMN3U5RjB4dys1TzFwTGw3QTJSNDNu?=
 =?utf-8?B?RDR2b0dxVFozMllSMjlQeFBHZU1odElucCtWOWRSSEZjWk84VGZTb3FPdEt0?=
 =?utf-8?B?R09VZ3Z5MksxY3ljaEpURHN5ek5XcUd4Y3hxaVVXRmcxMWlBOUpJUXpDbE9n?=
 =?utf-8?B?cXBCT1NLY1BrN1RQSzh6T1lYQ3VtU1dsMVovc2t5NHlMY1NzOU1ZVFFEUVp5?=
 =?utf-8?B?b2FjNGdpR3kzSm1oRHgyZ1VXR3BOb0UyRC9QQTRhdytpci93NWErTEYvWmxL?=
 =?utf-8?B?Y3NscU9JKzdvQkU3ek1aSnBFalkxdTZocFRMWGU5YTlaMU5QQzlwWHpLc3la?=
 =?utf-8?B?cGl2TWl5aHk2ekszSCt6YXBOTjE1UlJOS05uSmpXWWtqSWY5RTUwR0JpNVYw?=
 =?utf-8?B?ZDYyUTFFS1IvU2VVU2NhOHdaZGtiajEzYkRmTHJyUUc3T0RaSTRlbDFqYlFR?=
 =?utf-8?B?Y2VHMGVNcCs5eGJic1hKQlZYbkdwVWU3dG03U1BYSFU0RjZyNE9rSlFjTkRu?=
 =?utf-8?B?aXg1T0hLQVZvOVNnVW12Q3MxY0twcFhzd0R2WUJBK0dHTFY1WTNycGR0b2tK?=
 =?utf-8?B?RDZZQVNBOE5OaG5oTnZ5SlhmVTlXQ3c5NTRtMXBtSlMwc1krUTRmUGp2dWpP?=
 =?utf-8?B?ZVpCV25kdTNIM0FUT3RLanp2OGF0TGwxb2tISUt3WjAxdFdLMHpYZEI4RVVV?=
 =?utf-8?Q?4Tbtfm0BS/qxRTLk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2951acaf-32cf-4098-5d03-08da26d86179
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2022 16:26:41.5855
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0ckn4F2jR8HG41PaQrnCNfCz8u5qqfUfup2AlOtb4oZWf2zNh20m6WYuBVyJN2VPz5xCdstlqUsIBLaET72wzAe71fb3vySslQ4sIghYI5A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7735
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KVGhhbmtzIGZvciBmZWVkYmFjay4NCg0KDQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggMS8yXSBhcm02NDogZHRzOiByZW5lc2FzOiByOWEwN2cwNDQ6IEZp
eCBleHRlcm5hbCBjbGsNCj4gbm9kZSBuYW1lcw0KPiANCj4gT24gMjUvMDQvMjAyMiAxNzoyOCwg
QmlqdSBEYXMgd3JvdGU6DQo+ID4+Pj4gTXkgc3VnZ2VzdGlvbiB3YXMgdG8gbW92ZSB0aGUgWzEy
XSBwYXJ0IGludG8gdGhlIGZpcnN0IHBhcnQsIHNvIHRoZQ0KPiA+Pj4+IHN1ZmZpeCAiY2xrIiBz
dGF5cyBjb25zaXN0ZW50Og0KPiA+Pj4+IGF1ZGlvMS1jbGsNCj4gPj4+PiBhdWRpbzItY2xrDQo+
ID4+Pg0KPiA+Pj4gRnJvbSBIVyBwZXJzcGVjdGl2ZSwgIHRoZXJlIGFyZSAyIGF1ZGlvIGNsb2Nr
cywgYXVkaW8NCj4gPj4+IGNsb2NrMShtdWx0aXBsZSBhbmQgc3ViIG11bHRpcGxlIG9mIDQ0LjEg
S2h6KSBhbmQgYXVkaW8gY2xrDQo+ID4+PiAyKE11bHRpcGxlIGFuZCBzdWJtdWx0aXBsZQ0KPiA+
PiBvZiA0OEtoeikgY29ubmVjdGVkIHRvIGEgc2luZ2xlIGF1ZGlvIENvZGVjLg0KPiA+Pj4NCj4g
Pj4+IEJhc2VkIG9uIHRoZSBzYW1wbGluZyByYXRlLCB0aHJvdWdoIGNsb2NrIGdlbmVyYXRvciBk
cml2ZXIgd2UgY2FuDQo+ID4+PiBzd2l0Y2ggdGhlIGNsb2NrIHNvdXJjZSBmb3IgYXVkaW8gbWNs
b2NrIGFsb25nIHdpdGggYXVkaW8gY2xvY2sgZm9yDQo+ID4+PiBTU0kgYW5kIHdlIGNhbiBzdXBw
b3J0IGJvdGggdGhlc2UgcmF0ZXMNCj4gPj4+DQo+ID4+PiBTaW5jZSB0aGVyZSBpcyBhIHNpbmds
ZSBhdWRpbyBjb2RlYywgSSBhbSBub3Qgc3VyZSwgYXVkaW8xLWNsayBhbmQNCj4gPj4gYXVkaW8y
LWNsayBpcyBhIGdvb2QgY2hvaXNlLg0KPiA+Pg0KPiA+PiBUaGUgbmFtZSBvZiB0aGUgY2xvY2sg
aXMgbm90ICJhdWRpbyBjbG9jayIgYnV0ICJhdWRpbyIsIGJlY2F1c2UgeW91DQo+ID4+IGRvIG5v
dCBjYWxsIGEgY2FyICJGb3JkIE11c3RhbmcgY2FyIiwgYnV0IGp1c3QgIkZvcmQgTXVzdGFuZyIu
DQo+IFRoZXJlZm9yZSAiY2xvY2siDQo+ID4+IGlzIG5vdCBwYXJ0IG9mIHRoZSBuYW1lLCBidXQg
anVzdCBkZXNjcmlwdGlvbiBvZiBhIHR5cGUuDQo+ID4NCj4gPiBUaGUgaGFyZHdhcmUgbWVudGlv
biB0aGUgbmFtZSBhcyBBVURJT19DTEsxIGFuZCBBVURJT19DTEsyLg0KPiANCj4gVGhlIGhhcmR3
YXJlIGRvY3VtZW50IG1pZ2h0IGNhbGwgaXQgIkFVRElPX0NMS19SRUFMX0NMS19DTEsiIGFuZCBp
dCB3b24ndA0KPiBiZSBhbiBhcmd1bWVudCB0byBjYWxsIGRldmljZSBub2RlIHRoYXQgd2F5IGlu
IERUUy4NCg0KR290IGl0Lg0KDQo+ID4gPiBUaGVyZSBhcmUgMiBDbG9jayBhdmFpbGFibGVzIGZv
ciBhdWRpbyBpbnRlcmZhY2UuDQo+ID4gSW4gdGhhdCBjYXNlIGlmIHlvdSB0ZXJtIGl0IGFzIGF1
ZGlvMS1jbGsgYW5kIGF1ZGlvMi1jbGsgaXQgbWF5IG5vdCBiZSBjb3JyZWN0LCBCdXQgYXMgeW91
DQo+ID4gc2FpZCBjbGstMS1hdWRpbyBhbmQgY2xrLTItYXVkaW8gd2lsbCBpdCBiZSBjb3JyZWN0
Pw0KPiANCj4gSWYgeW91IGNoYW5nZSBhbGwgb3RoZXIgY2xvY2tzIHRvIGZvbGxvdyBzYW1lIHBy
aW5jaXBsZSAtIGdlbmVyaWMgbmFtZQ0KPiBmb2xsb3dlZCBieSBzcGVjaWZpYyBzdWZmaXggLSB0
aGVuIHllcy4gVGhlbiB5b3Ugc2hvdWxkIGhhdmUgImNsay1leHRhbCIsDQo+ICJjbGstY2FuIiBl
dGMuDQoNCk9rLg0KDQo+IA0KPiA+DQo+ID4+DQo+ID4+Pg0KPiA+Pj4gV2hhdCBhYm91dCBsaWtl
DQo+ID4+Pg0KPiA+Pj4gYXVkaW9fY2xrMTogYXVkaW8tY2xrLTEgPw0KPiA+Pj4gYXVkaW9fY2xr
MjogYXVkaW8tY2xrLTIgPw0KPiA+Pj4NCj4gPj4+IFdoaWNoIGlzIGNvbnNpc3RlbnQgd2l0aCBu
YW1pbmcgdXNlZCBmb3IgY3B1IGFuZCBvcHAtdGFibGVzPw0KPiA+Pg0KPiA+Pg0KPiA+PiBJdCdz
IG5vdCBjb25zaXN0ZW50IHdpdGggY2xrIG5hbWluZy4gTm9kZXMgc2hvdWxkIGhhdmUgZ2VuZXJp
YyBuYW1lcywNCj4gPj4gc28gdGhlIGdlbmVyaWMgcGFydCBpcyAiY2xrIi4gWW91IGFkZCBzcGVj
aWZpYyBhdWRpby9hdWRpby1YIHByZWZpeA0KPiA+PiBvciBzdWZmaXgNCj4gPj4gLSBpdCdzIGZp
bmUsIGJ1dCBub3QgYm90aC4NCj4gPj4NCj4gPj4gVGhpcyBpcyBleGFjdGx5IHRoZSB0cm91Ymxl
IHdoZW4geW91IHN0YXJ0IHVzaW5nIHNwZWNpZmljIG5hbWVzIGFuZA0KPiA+PiBEZXZpY2V0cmVl
IHNwZWMgZXhwbGljaXRseSBhc2tzIGZvciBnZW5lcmljIG5hbWVzLiBTbyBtYXliZSBnbyB3aXRo
DQo+ID4+IHRoZSBzcGVjIGFuZCBjYWxsIG9mIHRoZXNlICJjbGstWzAtOV0iIGFuZCBwcm9ibGVt
IGlzIGdvbmUuDQo+ID4NCj4gPiBPayBXaWxsIGNoYW5nZSBsaWtlDQo+ID4NCj4gPiAiYXVkaW9f
Y2xrMTogY2xrLTEtYXVkaW8iDQo+ID4NCj4gDQo+IFdoYXQgZG8geW91IG1lYW4gIm9rIj8gSSBz
YWlkICJjbGstWzAtOV0iLCBzbyAiY2xrLTAiLCAiY2xrLTEiLCAiY2xrLTIiDQo+IGFuZCBzbyBv
bi4gTm8gc3BlY2lmaWMgcHJlZml4Lg0KDQpBaCBvay4NCg0KQXMgeW91IG1lbnRpb25lZCBhYm92
ZSAiZ2VuZXJpYyBwYXJ0IGlzICJjbGsiLiBZb3UgYWRkIHNwZWNpZmljIGF1ZGlvL2F1ZGlvLVgg
cHJlZml4DQpvciBzdWZmaXgiDQoNClNvIGJhc2VkIG9uIHRoYXQsIEkgdGhvdWdodCAiY2xrIiBp
cyBnZW5lcmljIHBhcnQgYW5kICItMS1hdWRpbyIgYXMgc3VmZml4LCAiY2xrLTEtYXVkaW8iIA0K
c2hvdWxkIGJlIGFjY2VwdGFibGUuDQoNCkZvciBlZzotIElmIEkgcGxhbiB0byBtYXRjaCB0aGUg
bGFiZWwgbmFtZSB3aXRoIHRoZSBoYXJkd2FyZSBtYW51YWwoYXVkaW9fY2xrMSksDQoNCnRoZW4s
IGFzIHBlciB0aGUgZGlzY3Vzc2lvbiB3ZSBoYXZlLCB0aGUgbm9kZSBuYW1lcyBzaG91bGQgYmUN
Cg0KZWl0aGVyDQoNCiJhdWRpb19jbGsxOiBjbGstMCINCg0Kb3IgDQoNCiJhdWRpb19jbGsxOiBj
bGstMSINCg0KT3INCg0KImF1ZGlvX2NsazE6IGF1ZGlvMS1jbGsiDQoNCkNvcnJlY3Q/DQoNClJl
Z2FyZHMsDQpCaWp1DQo+IA0KPiA+IExhYmVsIG5hbWUgbWF0Y2hlcyB3aXRoIGhhcmR3YXJlIG1h
bnVhbCBhbmQgbm9kZSBuYW1lcyBhcyBwZXIgRGV2aWNlDQo+IHRyZWUgc3BlYy4NCj4gDQo+IA0K
PiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0K
