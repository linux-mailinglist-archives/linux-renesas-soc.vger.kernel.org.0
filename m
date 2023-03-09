Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 807576B22B8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Mar 2023 12:22:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231489AbjCILWq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Mar 2023 06:22:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231496AbjCILWb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Mar 2023 06:22:31 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2095.outbound.protection.outlook.com [40.107.113.95])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E8F5E4C71;
        Thu,  9 Mar 2023 03:18:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CStCr312M8s4kF72uQNtX7rWknzoJrI/ZDP/qaPFZKve3NLQpZBGhquw94MC55jWkIS+XRp4MLZtOkHWG73B6BjIKgy05RTKm88kwy6+PGmmlEb2v5aOpH352excCmuzLaAqqE5kGVraAqABtlZ16IwtK3BG6DUFjfJJDlUHBBwIUmPbK39xCQbXDRVXg5+sqWfG7RBeESX26vbUEDJ20qb/GcC5SUBKWz/7WdS6zaX4tlqJXEEUihAEpMDJ2Tqyyturr6UXwLkfpF7atXAp6fm4bCzODs3C8UDxYzKZDBIUQkc6TZ13Ar2YTfbFkukvrYIVS/oMJrI/Wm6ebzo6RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xuATxGW8OUaKEmrHOSBks5R0HtnQzQTHYpdI5ihXsjg=;
 b=Iy8qw4JNySb9iE4qLdOT8iBRHdt6jwZ7jTjKFujuxXhKEsaRfkTdJf3ClrBnUgDFXazYd9wJCZHEZUcXqswlL25Psx3XGNSpfLbAgBIGixm8ZYxbKNjZwByLj4apyoeySAVn8n5pGVv4mBDBimkOv+S5kYMjc0+W2zQ8Aw/X35jABzvkEstvORhi3R4R9q86JYlVSuFZKXczJpyxCcIiOcUg3PbU3UN4cSHQ+ZjdcpOihxVGstEEChnnmNRl3H4euhS//83f8nDo6+qITvIUveJHZmGppqtMxk2BuqaY53lMdIjUBFbpv9yl8xFiQrJ2XvYF/fGTJJvjpcowcspbiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xuATxGW8OUaKEmrHOSBks5R0HtnQzQTHYpdI5ihXsjg=;
 b=GKe66qmoeTwSFxvZ9pOVXbvY1ryy/V/58drNlbZ2HGYKNLXcFK4OBXPQAICtkoXuR66DMqX7oYnAy8Hk5kpQSbFWapULEL6JhaApeouxDxkSdG5CYgcV1l2o4XD3J7YCVOpxAePhCinrOyUO41MDyJIh/luK+TNSb4+5eApDpSg=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by OS3PR01MB8397.jpnprd01.prod.outlook.com (2603:1096:604:190::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.16; Thu, 9 Mar
 2023 11:18:05 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::9eb:3c9a:c2bc:af06]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::9eb:3c9a:c2bc:af06%4]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 11:18:05 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH RFC 1/3] dt-bindings: clock: Add Renesas versa3 clock
 generator bindings
Thread-Topic: [PATCH RFC 1/3] dt-bindings: clock: Add Renesas versa3 clock
 generator bindings
Thread-Index: AQHZRS0aT95BTvtLwUKgslaMkC+eWK7at0aAgBZQ9vCAAEpeAIAAAIEwgAAHzgCAANKNMIAAFx2AgAAAUHCAAAgsgIAAADeggAAIpoCAAA/7QA==
Date:   Thu, 9 Mar 2023 11:18:05 +0000
Message-ID: <TYCPR01MB5933CA7C33D21FFB43D1466986B59@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20230220131307.269100-1-biju.das.jz@bp.renesas.com>
 <20230220131307.269100-2-biju.das.jz@bp.renesas.com>
 <e9e63c87-b491-b4d5-b226-0539ef0de2d0@linaro.org>
 <OS0PR01MB59221C8C937EF20347149E4886B49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <36e06397-2189-4f1b-99cc-d39e720ebc71@linaro.org>
 <OS0PR01MB5922BDA0632ACCCC0100EEBD86B49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <6cbe6c71-2d2d-0f79-1270-7f8ed2ddc1d6@linaro.org>
 <TYCPR01MB5933650D5BAB7A3F4BE03BAF86B59@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <984f1689-459e-bd26-b96c-6c759417b3d1@linaro.org>
 <TYCPR01MB59335607AE6A2F4FBBA46ACC86B59@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <bc9e8ccd-9f98-6fae-9491-dc2bd96c2e4f@linaro.org>
 <OS0PR01MB59222B5A8747EC2B682AEE3486B59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <bd181837-2ebe-99a2-800a-30bad080dc4e@linaro.org>
In-Reply-To: <bd181837-2ebe-99a2-800a-30bad080dc4e@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB5933:EE_|OS3PR01MB8397:EE_
x-ms-office365-filtering-correlation-id: 2e31afe3-c56e-40ec-036d-08db208ff480
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: roLSfNOidZU4SqZjUhDA2LF4H/7f0oikFXt/+DqxTws11hxzDOV6p2YbfJMW7HGcSDyZB+Kz18RfRWCAJ/tTYkcv/mB4rprugL/9qeJc08G6MTuXx5HZfxnnma1FqzUQdgwlpYQEOGsN00fcwdYjS48/Dc00dE8qL2XSTu7OFl5w3SpRC9jPf5qvVv7pZROeZeaJG3OvnawPgINuO1JSmdMuwU8716MfjwQPkcGKZ3Ty41+TU6N6lSyexn9uOQVvaN88At94KJZ/eiGqtiT9YQdNRzOBxPbAkH17wbgkEKOz33lDpP2DsAl8nd/f8fYJRK19YzHEB9AH64X8Y34JjUGYuhpmIAyZl+oPGT5BVr3dVawIdFAjgzVWF17HrZwfx5h9qgNYDWU+1rKYreNDvl3+SGmzZFYtBPYD70bZ1CdJfKurMrvgklRKa3CKzUcZqWLiVBcW7vSQ/IRvoq07MpX/mrNl98z7Meb98T1Q4jtHsUgINwAnKFVCHRbmqf8aIDjgEPHiYkUT6tf2+rNHGq6u7AcbMQOCuRKx60OJqA01ttETUImreOdnYGHblvku1Zm4QDVzpEFyMz3kf1+OoVCHZSnNeqZqGwEU3ZZl/i+GzVyUS4fM1zAyQlXf9cI2u0GKknyD91ybs15qb5DRe2G2YqYSYJeoKHwehL+8Aik9l902B0HnOz5mYpX+52AgarsxV3wkFZECjELP4nN1mA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(366004)(39860400002)(376002)(136003)(451199018)(66946007)(54906003)(66476007)(66556008)(64756008)(76116006)(53546011)(6506007)(26005)(8676002)(66446008)(110136005)(316002)(33656002)(478600001)(8936002)(5660300002)(107886003)(52536014)(2906002)(86362001)(38100700002)(122000001)(7696005)(71200400001)(4326008)(83380400001)(55016003)(38070700005)(9686003)(186003)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?enFJeHdxUGJJa0lWQlRGZ1VISkNUN2VlWGE4LzVUZk10bU1OOVBUbUhvUFFi?=
 =?utf-8?B?c3dYTFk4K1IxaENXMFhJeFhnc3ppU1gyQ1l6VEY1WHpDNUdoUndLWnA2R1hu?=
 =?utf-8?B?ZHdEUGQ5VHF4ek5mTFp2MS8xV2YyeFhDWXJNK0hKMXloT1gxczkwTGRxc1p5?=
 =?utf-8?B?TlJWeVhEa1Nqd0VGR3BXUGxrMlE0cVFGcE45eE5GeXZFUjFOUW9iSVlGSERD?=
 =?utf-8?B?QWpKN0FPRkNFVksxMklCaE5WSlZmZUYvb2J4Nm1CY3BKK3hqalJBSWdaMmxQ?=
 =?utf-8?B?VFVQUGtheWF6STRvN3RhUWI0VzJ5eTE2YTNJakVPSHk1UC9XalJVeVNCU1dN?=
 =?utf-8?B?NkJ3bDVkSVZDT29FSGQvZlRMbnRwNlo0M0lxbzFaNlVVUzRLRkFCaWV3eUpx?=
 =?utf-8?B?anZMZlRnVTVKZzk1Rnc5TEFpcnAxVEwrMlR6NzJpSW1Sdno2OHM3NHl1SHBt?=
 =?utf-8?B?aVA1NUtrVWZraVk4akZBSG1yVjgwdWV5WFV2NUUwMy9sNjRVU3FBS2ltMjN1?=
 =?utf-8?B?TGp1U3JkZU5VeXZiZk9NWGcwb1A0RnZPY0dTcTBGekN5YW9zTnNBY0grTURG?=
 =?utf-8?B?bno4Y1U5c3NLYTl5OElNd3dLb05UYU1Hb3F5cnB0L0M3NGpYRlFyNjJ4MW84?=
 =?utf-8?B?d25CNUh0MC9PY3BwRC90VVBYT3dEc25BZ0JFUlZ5WERta2VPQ1FTY01WaXB6?=
 =?utf-8?B?cWJreWhtTXZIS0d0Qk1yVFZrS1RsMXdDektWYnR2UDgwSzlDTVlkMmNscXgv?=
 =?utf-8?B?Q1NOT1dZKzFjSTZFRkltU2pMRFRyVnlJYWxvaWR4S0psbC9LVXNlRjd3bHVV?=
 =?utf-8?B?SU9GSHd1TkR3WDdUOHFCRmt6UG8weGFDNGNmYy95QnlIRkRJc2hlc1hEYmF0?=
 =?utf-8?B?cEs2T2E1Uy92eDZrMVhkV0txQUoxalZSR3NXUTlWUHhNbGlxZ2VFY1dOaFlX?=
 =?utf-8?B?cDc1VEcvUXhvMjJnVXAzUlJ4cUlHeGdCVkJQSjEvZzdKa2kvZ2RNL3AzKzZD?=
 =?utf-8?B?ZHZ1bG1EV284eWVJYkRhNTJwYWFxR0NDTHcrTkJhbFYxa1FKc1Rnc3JBZTY4?=
 =?utf-8?B?dkMvOFk2dVQzNktDUVFhWitUUUVqWXJkUDJkZWVnTk1oRWw2czVEL2dDdjNz?=
 =?utf-8?B?UDRJSzVtYmQ0OWxsMzZYeGdpT1Nzd2ExbTA4UUdDSVd0Smk3YWF4Qmg1ZlpR?=
 =?utf-8?B?WXRjT0lCMVJCT0VhU21RSk5uVEJLNzh2STk3WkdQdmZzWUtmWWFmNGJ3M0Ft?=
 =?utf-8?B?MG1DaWFaQlh6KzE3dWNsRVJlYm1nVkczaERsWWZLZ2F4VmZRUDRBSUZDQ3BP?=
 =?utf-8?B?dk0vSEhaaHJRaHV2OTIrbHNzQkxwZFpidUh0djc5VU5RU04zQ2xmNmpNbno3?=
 =?utf-8?B?WHJKc1VBRUtjb210Vy9ncjVrb1FPQUFERldHY2VIbTBMTEVGazR1cklnNHY2?=
 =?utf-8?B?VmxNdTZJWksyTnBoRncrTHNEdGF4Q0V1OGtTZHh2ZFpmOEhnc2tJODRBRkRo?=
 =?utf-8?B?YndFMEJnYm5EYU1BRHpTNkI2c0JDY1VmQkRJVUhwZitUQmR6c0xNWXRUcnFp?=
 =?utf-8?B?cW1HeGhvaXd1ZmpFNE1uYWRCMytaS21rRU0xMXNVT0VacDNrWHBIazhJNm1m?=
 =?utf-8?B?aklYZUFPK1NIcVVRN0RGUVFxUVNPdnZRTnZDSDF4c2kwQkRSc0pxdkF3YVJX?=
 =?utf-8?B?d0laSXFSdDlQYWFFWHI4YWE2SEhMaGx0NTNZYThwbWxLLzM3eUxBY2g0aDlC?=
 =?utf-8?B?NFZKeUJzYzlRbjVnYVRXb3hHcmlsZEdYQnRweXVMQ0xKemlMNG5PQ2puUjFE?=
 =?utf-8?B?ZWRVeEhxR3JRK2hzOFBHYW1tWG9uWW51L0loUWNxVGhMNWRZdm0vWGNLdStX?=
 =?utf-8?B?c2JCQzZnUzY1S2xIaFY5TGFTdlZjMjlhamhUM3ZTYmtwRW93L281d2dqVmQv?=
 =?utf-8?B?amxFbndIaWRSWTl0UFRDR2VmNEkxTUl2QTFyWnVac0k4WS9KSEZjdEFpNnVh?=
 =?utf-8?B?U2o5TXZpTmtOVlJOY2UyUVdtcG13TDFJUGtjeHJmZ09oaFE4aVhZWW91bGRG?=
 =?utf-8?B?UmdWZWV4Y3pkRWFkd0J3UHhnOGpyR3RWZ0MxY2RFNkJNbFVHNzlYR2FmVGFq?=
 =?utf-8?Q?sn4jaMZg4wUDFF5xBqnxNod1C?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e31afe3-c56e-40ec-036d-08db208ff480
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2023 11:18:05.6874
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jHWaYqnoUrX1cIEzp8Jwz9XTXudxoWpUKyGnH6A8cEWQ4tnCpObK7BQglea1uvdzrW0AluJx+8sR5/KcEB5Lle1g6Qbxk6d3rENvN6E/luQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8397
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIFJGQyAxLzNd
IGR0LWJpbmRpbmdzOiBjbG9jazogQWRkIFJlbmVzYXMgdmVyc2EzIGNsb2NrDQo+IGdlbmVyYXRv
ciBiaW5kaW5ncw0KPiANCj4gT24gMDkvMDMvMjAyMyAxMDo1MywgQmlqdSBEYXMgd3JvdGU6DQo+
ID4NCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBLcnp5
c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+ID4+IFNl
bnQ6IFRodXJzZGF5LCBNYXJjaCA5LCAyMDIzIDk6NDQgQU0NCj4gPj4gVG86IEJpanUgRGFzIDxi
aWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT47IE1pY2hhZWwgVHVycXVldHRlDQo+ID4+IDxtdHVy
cXVldHRlQGJheWxpYnJlLmNvbT47IFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVsLm9yZz47IFJv
Yg0KPiA+PiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tp
DQo+ID4+IDxrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc+DQo+ID4+IENjOiBHZWVy
dCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPjsgbGludXgtcmVuZXNhcy0N
Cj4gPj4gc29jQHZnZXIua2VybmVsLm9yZzsgbGludXgtY2xrQHZnZXIua2VybmVsLm9yZzsNCj4g
Pj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IEZhYnJpemlvIENhc3Rybw0KPiA+PiA8ZmFi
cml6aW8uY2FzdHJvLmp6QHJlbmVzYXMuY29tPg0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIFJG
QyAxLzNdIGR0LWJpbmRpbmdzOiBjbG9jazogQWRkIFJlbmVzYXMgdmVyc2EzDQo+ID4+IGNsb2Nr
IGdlbmVyYXRvciBiaW5kaW5ncw0KPiA+Pg0KPiA+PiBPbiAwOS8wMy8yMDIzIDEwOjE4LCBCaWp1
IERhcyB3cm90ZToNCj4gPj4+DQo+ID4+Pg0KPiA+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+ID4+Pj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3Nr
aUBsaW5hcm8ub3JnPg0KPiA+Pj4+IFNlbnQ6IFRodXJzZGF5LCBNYXJjaCA5LCAyMDIzIDk6MTQg
QU0NCj4gPj4+PiBUbzogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPjsgTWlj
aGFlbCBUdXJxdWV0dGUNCj4gPj4+PiA8bXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb20+OyBTdGVwaGVu
IEJveWQgPHNib3lkQGtlcm5lbC5vcmc+OyBSb2INCj4gPj4+PiBIZXJyaW5nIDxyb2JoK2R0QGtl
cm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpDQo+ID4+Pj4gPGtyenlzenRvZi5rb3psb3dz
a2krZHRAbGluYXJvLm9yZz4NCj4gPj4+PiBDYzogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCty
ZW5lc2FzQGdsaWRlci5iZT47IGxpbnV4LXJlbmVzYXMtDQo+ID4+Pj4gc29jQHZnZXIua2VybmVs
Lm9yZzsgbGludXgtY2xrQHZnZXIua2VybmVsLm9yZzsNCj4gPj4+PiBkZXZpY2V0cmVlQHZnZXIu
a2VybmVsLm9yZzsgRmFicml6aW8gQ2FzdHJvDQo+ID4+Pj4gPGZhYnJpemlvLmNhc3Ryby5qekBy
ZW5lc2FzLmNvbT4NCj4gPj4+PiBTdWJqZWN0OiBSZTogW1BBVENIIFJGQyAxLzNdIGR0LWJpbmRp
bmdzOiBjbG9jazogQWRkIFJlbmVzYXMgdmVyc2EzDQo+ID4+Pj4gY2xvY2sgZ2VuZXJhdG9yIGJp
bmRpbmdzDQo+ID4+Pj4NCj4gPj4+PiBPbiAwOS8wMy8yMDIzIDA4OjU3LCBCaWp1IERhcyB3cm90
ZToNCj4gPj4+Pj4+PiBJdCBpcyBjbGsgZ2VuZXJhdG9yIEhXIHNwZWNpZmljLiBDbGsgZ2VuZXJh
dG9yIGlzIHZpdGFsDQo+ID4+Pj4+Pj4gY29tcG9uZW50IHdoaWNoIHByb3ZpZGVzIGNsb2NrcyB0
byB0aGUgc3lzdGVtLg0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IEV2ZXJ5IGNsb2NrIGNvbnRyb2xsZXIg
aXMgdml0YWwuLi4NCj4gPj4+Pj4+DQo+ID4+Pj4+Pj4gV2UgYXJlIHByb3ZpZGluZyBzb21lIGhh
cmR3YXJlIGZlYXR1cmUgd2hpY2ggaXMgZXhwb3NlZCBhcyBkdA0KPiA+Pj4+Pj4+IHByb3BlcnRp
ZXMuDQo+ID4+Pj4+Pj4NCj4gPj4+Pj4+PiBMaWtlIGNsb2NrIG91dHB1dCBpcyBmaXhlZCByYXRl
IGNsb2NrIG9yIGR5bmFtaWMgcmF0ZSBjbG9jay8NCj4gPj4+Pj4+DQo+ID4+Pj4+PiBPSywgSSB3
YWl0IHRoZW4gZm9yIHByb3BlciBkZXNjcmlwdGlvbiB3aGljaCB3aWxsIGV4cGxhaW4gYW5kDQo+
ID4+Pj4+PiBqdXN0aWZ5DQo+ID4+Pj4gdGhpcy4NCj4gPj4+Pj4NCj4gPj4+Pj4gSGVyZSBpdCBp
cywgUGxlYXNlIGxldCBtZSBrbm93IGlzIGl0IG9rPw0KPiA+Pj4+Pg0KPiA+Pj4+PiByZW5lc2Fz
LG91dHB1dC1jbG9jay1maXhlZC1yYXRlLW1vZGU6DQo+ID4+Pj4+ICAgICB0eXBlOiBib29sZWFu
DQo+ID4+Pj4+ICAgICBkZXNjcmlwdGlvbjoNCj4gPj4+Pj4gICAgICAgSW4gb3V0cHV0IGNsb2Nr
IGZpeGVkIHJhdGUgbW9kZSwgdGhlIG91dHB1dCBjbG9jayBmcmVxdWVuY3kNCj4gPj4+Pj4gaXMN
Cj4gPj4+PiBhbHdheXMNCj4gPj4+Pj4gICAgICAgZml4ZWQgYW5kIHRoZSBoYXJkd2FyZSB3aWxs
IHVzZSB0aGUgdmFsdWVzIGZyb20gdGhlIE9UUCBvcg0KPiA+Pj4+PiBmdWxsDQo+ID4+Pj4gcmVn
aXN0ZXINCj4gPj4+Pj4gCW1hcCBpbml0aWFsaXplZCBkdXJpbmcgYm9vdC4NCj4gPj4+Pj4gICAg
ICAgSWYgbm90IGdpdmVuLCB0aGUgb3V0cHV0IGNsb2NrIHJhdGUgaXMgbm90IGZpeGVkLg0KPiA+
Pj4+PiAgICAgbWF4SXRlbXM6IDYNCj4gPj4+Pg0KPiA+Pj4+IGJvb2xlYW4gaXMgc2NhbGFyLCBu
b3QgYXJyYXksIHNvIG5vIG1heEl0ZW1zLiBJZiB0aGUgZnJlcXVlbmN5IGlzDQo+ID4+Pj4gdGFr
ZW4gZnJvbSBPVFAgb3IgcmVnaXN0ZXIgbWFwLCB3aHkgdGhleSBjYW5ub3QgYWxzbyBwcm92aWRl
DQo+ID4+Pj4gaW5mb3JtYXRpb24gdGhlIGNsb2NrIGlzIGZpeGVkPw0KPiA+Pj4NCj4gPj4+IE9L
LCBJIHdpbGwgbWFrZSBhbiBhcnJheSBwcm9wZXJ0eSBpbnN0ZWFkLiBGcm9tIEhXIHBlcnNwZWN0
aXZlIGVhY2gNCj4gPj4+IGNsb2NrIG91dHB1dCBmcm9tIHRoZSBDbG9jayBnZW5lcmF0b3IgaXMg
Y29udHJvbGxhYmxlIGllLCBmaXhlZCByYXRlDQo+ID4+PiBvcg0KPiA+PiBkeW5hbWljIHJhdGUu
DQo+ID4+Pg0KPiA+Pj4gSWYgYWxsIHRoZSBvdXRwdXQgY2xvY2tzIGFyZSBmaXhlZCByYXRlIG9u
ZSwgdGhlbiBmcmVxdWVuY3kgaXMgdGFrZW4NCj4gPj4+IGZyb20gT1RQIG9yIHJlZ2lzdGVyIG1h
cC4gQnV0IGlmIGFueSBvbmUgY2xvY2sgb3V0cHV0IGdlbmVyYXRlcw0KPiA+Pj4gZHluYW1pYyBy
YXRlLCB0aGVuIGl0IHVzZXMgZHluYW1pYyBzZXR0aW5ncy4NCj4gPj4NCj4gPj4gU2Vjb25kIHRy
eSwgc2FtZSBxdWVzdGlvbiwgbGV0IG1lIGtub3cgaWYgaXQgaXMgbm90IGNsZWFyOg0KPiA+Pg0K
PiA+PiAid2h5IHRoZXkgY2Fubm90IGFsc28gcHJvdmlkZSBpbmZvcm1hdGlvbiB0aGUgY2xvY2sg
aXMgZml4ZWQ/Ig0KPiA+DQo+ID4gVGhpcyBpbmZvcm1hdGlvbiB3ZSBhcmUgcHJvdmlkaW5nIHRo
cm91Z2ggZHQuDQo+IA0KPiBObywgeW91IGFyZSBub3QuIFdlIGp1c3QgZGlzY3VzcyBpdC4gSWYg
d2UgZG8gbm90IGFncmVlLCB5b3UgYXJlIG5vdCBnb2luZw0KPiB0byBwcm92aWRlIGluZm9ybWF0
aW9uIHRocm91Z2ggRFQuDQo+IA0KPiA+DQo+ID4gSXQgaXMgYSBjb21wbGV4IGNsb2NrIGdlbmVy
YXRvciB3aGljaCBwcm92aWRlcyA2IEhXIGNsb2NrIG91dHB1dHMuDQo+ID4gVGhlIDYgSFcgY2xv
Y2sgb3V0cHV0cyBjYW4gYmUgaW5kaXZpZHVhbGx5IGNvbnRyb2xsYWJsZSB0byBnZW5lcmF0ZQ0K
PiA+IEVpdGhlciBmaXhlZCBmcmVxdWVuY3kgb3IgZHluYW1pYyBmcmVxdWVuY3kuDQo+IA0KPiBB
aCwgaW5kZWVkLiA2IGNsb2NrIG91dHB1dHMgcHJvaGliaXRzIGNvbmZpZ3VyaW5nIHRoaXMgZnJv
bSBPVFAuIElmIG9ubHkNCj4gdGhlcmUgd2VyZSA1IG91dHB1dHMgdGhlbiBpdCB3b3VsZCBiZSBw
b3NzaWJsZS4uLg0KPiANCj4gPg0KPiA+ICBPdXRwdXQgY2xrMSAiZGlmZjIiLA0KPiA+ICBPdXRw
dXQgY2xrMiAiZGlmZjEiLA0KPiA+ICBPdXRwdXQgY2xrMyAic2UzIiwNCj4gPiAgT3V0cHV0IGNs
azQgInNlMiIsDQo+ID4gIE91dHB1dCBjbGs1ICJzZTEiLA0KPiA+ICBPdXRwdXQgY2xrNiAicmVm
Ig0KPiA+DQo+ID4gSSB3YW50IHRvIG1ha2UgIk91dHB1dCBjbGs0IiBmcm9tIGNsb2NrIGdlbmVy
YXRvciBhcyBkeW5hbWljIGZyZXF1ZW5jeQ0KPiA+IG9uZSBBbmQgbWFrZSBvdGhlciBjbG9jayBm
cmVxdWVuY3kgZnJvbSBjbG9jayBnZW5lcmF0b3IgYXMgZml4ZWQgb25lLg0KPiA+DQo+ID4gSG93
IGRvIHlvdSBkZXNjcmliZSB0aGlzIGluIGR0PyBQbGVhc2Ugc2hhcmUgeW91ciB0aG91Z2h0cy4N
Cj4gDQo+IFJlYWQgZnJvbSBPVFAgb3IgcmVnaXN0ZXJzLg0KDQpMb29rcyBubyBvdGhlciBvcHRp
b24uIFNvIHdpbGwgZHJvcCB0aGlzIHByb3BlcnR5IGFuZCBtYXRjaCB0aGUgb25lIGZyb20gT1RQ
IHdpdGggZnVsbCByZWdtYXAuDQoNCkNoZWVycywNCkJpanUNCg0K
