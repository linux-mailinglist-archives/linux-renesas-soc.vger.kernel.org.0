Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 286405A9E82
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Sep 2022 19:56:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233817AbiIAR4Y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Sep 2022 13:56:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233765AbiIAR4X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Sep 2022 13:56:23 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2134.outbound.protection.outlook.com [40.107.114.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85A5175CD4;
        Thu,  1 Sep 2022 10:56:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTWEfMZdPFEpafvgv1XksDPuLltQyuwCSHHeR6jLk0O9zFhuN4nvXZO+x3aZ75Esi+MDRejNH46hOpmUj7LBUF1+KXgT4Y07LF726Wof7tryNwKxq4XZ3OzENAFFoxbVJ5wdEjQC/YV15aDIkEbnoZoE/dddsedcoazX0kPd4yY/26U1o7KNXz7SPI21I49uZsahcxJJNZGlootJ1DY2axA6PpHawDrJdbxMKBvAlg/fn9t63JVA9EJ7wksWIoJ41NMTSXBaZOumCjKfZxOg4W/v42qx2IVeu3KDH3NJuuD19XST+IlsqvQElT2cj6Vmfg+r58vsydIF5GsZ904hBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+fro7UmTmUQVEWc5H5/ehwldGPX0L8NKcfb1xo0bHOA=;
 b=DLwNN178bgewPDlMCLW0/ZWcWXVKgHJ5za4VTPmOMBlOUHujf/J+63yxhi3XxmodUEl1Aj2TX3WohX5KXSC/sEb6cydehGYwEtU6q0juskjnDPaAZvvanuBb/H44tE6D9RW5GIhCyLw9SpZXqy1EB0KAT0fpZIcHObis6JxltdUom4Hxd2EAwqF76EFTg91Y/MjfjejMrumv5EMeCbhbua3ynuUpYXPNlmzhqwg2cWOWFFo71+SDw0rU/SAkkcohyuIHQo4RtHrDaUdiC/NfO6MIcMlHStR0HGB/2Fvj9ctoU9nDyehmVtNM2DrHYiOSupX0pb5n9lOxKMZSYZ2A9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+fro7UmTmUQVEWc5H5/ehwldGPX0L8NKcfb1xo0bHOA=;
 b=XHLXF74e6wdcC1GjvhlI7lTTLTJxgoHIU8VQ4EXEwt4g6GIa1eAYOwbgQNlDTdZOGTb19tCWUaR1I9tOPwZYY716pY3dZteDQ1EZ8T4oyOgtX3M3XiVqeBhipLl9xbfI0E+LMbw2lCvIaZ5LWkXsYR0TTnv/4sUnMLEfUoD8Hxg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB9624.jpnprd01.prod.outlook.com (2603:1096:400:191::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Thu, 1 Sep
 2022 17:56:18 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf%4]) with mapi id 15.20.5588.010; Thu, 1 Sep 2022
 17:56:18 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH v4] ARM: dts: r9a06g032-rzn1d400-db: Enable CAN2
Thread-Topic: [PATCH v4] ARM: dts: r9a06g032-rzn1d400-db: Enable CAN2
Thread-Index: AQHYviAB0RpAj7MSxEyYtShgJhSwt63KzyyAgAAMK2A=
Date:   Thu, 1 Sep 2022 17:56:18 +0000
Message-ID: <OS0PR01MB59227D1928258D0703C3FDE5867B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220901162919.47090-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdW0ZG3ENobSP-0wS9WhpmPqLt91Omauj5wMOthfBLsoOA@mail.gmail.com>
In-Reply-To: <CAMuHMdW0ZG3ENobSP-0wS9WhpmPqLt91Omauj5wMOthfBLsoOA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 87a3d964-fcb9-4bdf-af1c-08da8c434563
x-ms-traffictypediagnostic: TYCPR01MB9624:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OgCU3W/xR8J5Hnt5UDZu/PArlwIpRmqjD4fZPHARTE+EqdlOedrRpOc/OwKTkn2L/P6k3dapY2fUyhaZMhW89JBDOSwrp/QNTRjtCkSqySugqpzQyhenyShWLAQnzoE/oY8O/NaEuDVwDdZuhmjMI2K+6mN0+wR8j2meXIzS8A2ICaLNd3mQiE22NgzYEyoUYxelbxIF+rfgIbZn96SvRkttRmT6Z5dGDecL7j8L79iTviJkhiBewbv9leD30Sq7LKeANGx2WUZuDQRalnOABl8TNqoIR4c3xOvy2IIp/jpc4/3a/jUZPDX2L1GTkqdpoJitRLdQXVDEi0iSzZgN9O/EPuU+sa9+5g7j6uw4xj+oQypCes0G6yCYMCheh1pCVw4bw7EqFCLzgCEY5zr57aTulSgOQTkma2KVA4S8/4jSjpd8+0loDw+r8VrEMen/3hrkK3/n0UbinMjBwXtrTHxJlpz/Usd9IDZvzD3t4iiq2CFHrVYR73eQwPD+qaJe4uwTNHeHsMMjtORVq2aLUXJ/bVnK1/zrwN1eQTMAoixBfZbv2zxZzV/KBVz1GFi0h1Q0Y67S+1q7hHRqaCl4JAD/hayxar4A79wwwgJRnk5KIQ6o28n0EozIHTzxIgTVm4DEiJlZW2tLv2igfvPC5CXvjDr28jnlLSIU8JpGEy1ddKE9ZMseitk91DRb2B3pPxeVptSjtZ4cE2G33rOvv+puLg0upE0YEKTTqLG9+82NnqZrhy2qD/Ax7hslQLYVmfC6PmqwvV+J51Mkdpnunw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(136003)(346002)(39860400002)(366004)(186003)(122000001)(38100700002)(6916009)(54906003)(55016003)(71200400001)(316002)(66946007)(107886003)(83380400001)(41300700001)(38070700005)(66556008)(64756008)(66446008)(66476007)(478600001)(26005)(76116006)(8676002)(4326008)(9686003)(33656002)(2906002)(86362001)(53546011)(52536014)(8936002)(7696005)(5660300002)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MzlRZlR0OEZnV0U1cURIUlV1VStUZGFXR3dBenpaVnAzMUZDVU9sMXMrUUdD?=
 =?utf-8?B?VjVqT2tENjhmdkFUSlNObENuQUNBaU5Zam5vRUdpM3cwazZYdUxPZHRLWjJj?=
 =?utf-8?B?YlIyQ3hrODVWTDNLcGI1QnpFVWFZcVAwZG1kaDd1NWt5RFJKQmlqbkNtRkRP?=
 =?utf-8?B?Wit3VVY4VVZOM0JtaVBxRFdDT1RTMXV3MXV4N2xuUTZrQ1JVeWx2WForOWt2?=
 =?utf-8?B?eXJzSlBpVndNNlJEYUtDOEt4a3VFRitYT3lNT3p5ZW9OMnozbVRCU20zbHND?=
 =?utf-8?B?KzR0MTJ2MnIvdmRjRS9jajBkdC9OajdhaGlBekdYRU9HTHRwMml3Z200U2w0?=
 =?utf-8?B?SlN3M0hNbVN0dEZ5VjNVKysyazF0aGtWc3NweHNuNkJLV2h4VHY2ZFNqVUdz?=
 =?utf-8?B?ZnBnWFl0dDZGaSs3VHhuOGROc24zcjAreHEzYk5kUmQrbEl3TFBmSGhxRmxB?=
 =?utf-8?B?RW1CblR0M0poa1ZKQmptbG9uWVRhUHBKK2gyQk92Ui9rLzdhOXYvbTE2SVVD?=
 =?utf-8?B?ZDlTaFUrd0FPNWd2Z1ZoeTdCd1l4bW13N3paZGxhb0NISnhBU3FjUmlETmIv?=
 =?utf-8?B?R3lCWjhOYktiMldVRlcvSjBMZkx0RDZHaEdMbXNrQjEyRWRlV2FvZHI1NkZZ?=
 =?utf-8?B?YzBCdjFSbEJMYVJUT1NKZHJ4Wkd6bUhUbG1JRGx1M0xtVHlFYlY5SXYyZWZ6?=
 =?utf-8?B?eFJHbkxQOFNUSWNYWStXME9IbTQ4LzAyVk5vbWtEUk1SaTlnN1BxSTZRRUEr?=
 =?utf-8?B?RlNMWjRYcmRKNkp2WHdQUXFSaExIdjZPSFl3a0c2YXoxOVNGbklSREJwck00?=
 =?utf-8?B?RUdxT2ZlNHQ1M0xuNzlsL2hvSkNYQVZGMG1yMHROR0VndWViWVpNOERYSEgx?=
 =?utf-8?B?d0hTNG02Z1Y2WjlzdUJmQ0RmY2FuT1NQU0JFcEdYUktPdEttVWgzaVN2U0NX?=
 =?utf-8?B?eFZWZ1VDY1I3eVFZdE1ZT3FWeXB1NHo5SFNjdWNnUTU4aXhjVUxNRm55cjNi?=
 =?utf-8?B?dkpkc2NoSUdHVFNqa2I3a1hrNlI5UitFUDhKejl3RzJzTjE4S2JKOGJLUis4?=
 =?utf-8?B?Nmg1ZmxjMWYzdXNlNWMxNXBQTUhrdDBSVnV5Mjg2czgram1oWlVTZVplVmxN?=
 =?utf-8?B?czkxK3Fhd0R2aCs1WDVNOWV4WmFMU2k0YVJwNll1OEVLZnZwMUMvRHZxVFFr?=
 =?utf-8?B?Q0IyQ1V2YmsvMks4Qk8vZ3FzUWVhWlo2R1JPRUc1dEgvTWdVSG5CbUVFbmVx?=
 =?utf-8?B?RXBrT3NVRkxVeGdPQ3l1OUMzVTZlNjdRaFl2M2NaUGdZTjR5TGdhekxheFVR?=
 =?utf-8?B?ckhqa1FSd09aYWJXOTBOY2ozZmFkNjJwU2JZOUhOdW5VdVBxeHowVkhxUTJm?=
 =?utf-8?B?a2pRVzc2b0N2MkoxbmhDUzJRK0FwNXlleWFRaERSZ0tmbExrRE5iMzlnUGZz?=
 =?utf-8?B?c2Z3MUJpZEtjWTZYQjBCQ0h3bmwvQnA3K29YVjMrdGtKRDVweVVDc3p5Qm5Q?=
 =?utf-8?B?alJLUUZWbGJLQ0dpblhNL1Avc2NSY09zQzBVN0svZFRiWjdiclVib0UrTGg2?=
 =?utf-8?B?ODBoZEZIcmllZmpsMmR2Z09qQXF4UG4vUTVudlpQcnYvZTBmVWw2T3dtUmpk?=
 =?utf-8?B?ZTI1blBuckYzVmtrUWxHWXFXZk1jelFUcllCbnhiY2tJMXZjSGRvcnNuK1RW?=
 =?utf-8?B?NUMzbWdOM0l5QnQzcFlnZTRRaWRpT3BmTE1nSzdFSVp2R0pNak5scWVBWWxa?=
 =?utf-8?B?cE9jTFdYZFBwSmhjMEp5UktVVkJqQVB4K1BvWmJiMXJETXp1a21SZFN0TUgv?=
 =?utf-8?B?ZjcxbFpqajFpNG9WMWM1aFo0ZWJDY1h4MExpY0g5em56OHh4VzJuR2dPY1lV?=
 =?utf-8?B?c1Z6N1E0V1FjV0FZbWhGYkdhUVhUeUlXelFIdDVyQ0xCUjNXcG9oSGVVWGs3?=
 =?utf-8?B?dWNYRTBWcU44V1Y0WW0yOHdLVjFJQ3hvdGgwRVN6V2FMOUtNK3A1RnRZdHo5?=
 =?utf-8?B?NnhtVnAvTFNyeVY5VnI2ampMMS9SNllITTBrZ0NnUUU0ZmVTMmxrYkpveDJI?=
 =?utf-8?B?LzF4SUlxdWtVRjhyYkE5Qy9CblBrTzZTd09kYTNxUDY0bWVOZlUraW9ja0VJ?=
 =?utf-8?B?ODBEMzRhU2txb2xqVVp5dHczSWd1ZzlsOGhLcGNrUWIxUHZlV3V4aTVib3pR?=
 =?utf-8?B?bVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a3d964-fcb9-4bdf-af1c-08da8c434563
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2022 17:56:18.0735
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vMPAoCYgM/HBo+qSauCmj7fjungTSPropKb/qLlHh41jhNHGBfW3DEeuKnK9bQYRMHTv/ixlFnN7yK1GI6CVdmugYHlSO5MAlWlTzobo2EM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9624
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjRdIEFSTTogZHRzOiByOWEwNmcwMzItcnpuMWQ0MDAtZGI6IEVuYWJsZSBDQU4yDQo+
IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVGh1LCBTZXAgMSwgMjAyMiBhdCA2OjI5IFBNIEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gRW5hYmxlIENB
TjIgb24gUlovTjEtRUIgYm9hcmQgYnkgZGVmYXVsdC4NCj4gPiBBbHNvIGFkZCBhIG1hY3JvIHRv
IGVuYWJsZSBDQU4xLCBpZiB0aGUgYm9hcmQgc3VwcG9ydCBpdC4NCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4g
PiB2My0+djQ6DQo+ID4gICogVXBkYXRlZCBjb21taXQgZGVzY3JpcHRpb20NCj4gPiAgKiBFbmFi
bGVkIENBTjIgYnkgZGVmYXVsdA0KPiA+ICAqIEFkZGVkIGEgbWFjcm8gQk9BUkRfSEFTX0NBTjFf
RU5BQkxFRCB0byBjb25maWd1cmUgQ0FOMSwNCj4gPiAgICBpZiB0aGUgYm9hcmQgc3VwcG9ydHMg
aXQuDQo+IA0KPiBUaGFua3MgZm9yIHRoZSB1cGRhdGUhDQo+IA0KPiA+IC0tLSBhL2FyY2gvYXJt
L2Jvb3QvZHRzL3I5YTA2ZzAzMi1yem4xZDQwMC1kYi5kdHMNCj4gPiArKysgYi9hcmNoL2FybS9i
b290L2R0cy9yOWEwNmcwMzItcnpuMWQ0MDAtZGIuZHRzDQo+ID4gQEAgLTI2LDYgKzI2LDIyIEBA
IGFsaWFzZXMgew0KPiA+ICAgICAgICAgfTsNCj4gPiAgfTsNCj4gPg0KPiA+ICsjaWYgQk9BUkRf
SEFTX0NBTjFfRU5BQkxFRCAvKiBDTjEwIG9uIFJaL04xLUVCIGJvYXJkICovDQo+ID4gKyZjYW4w
IHsNCj4gPiArICAgICAgIHBpbmN0cmwtMCA9IDwmcGluc19jYW4wPjsNCj4gPiArICAgICAgIHBp
bmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+ID4gKw0KPiA+ICsgICAgICAgc3RhdHVzID0gIm9r
YXkiOw0KPiA+ICt9Ow0KPiA+ICsjZW5kaWYNCj4gPiArDQo+ID4gKyZjYW4xIHsNCj4gPiArICAg
ICAgIHBpbmN0cmwtMCA9IDwmcGluc19jYW4xPjsNCj4gPiArICAgICAgIHBpbmN0cmwtbmFtZXMg
PSAiZGVmYXVsdCI7DQo+ID4gKw0KPiA+ICsgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KPiA+ICt9
Ow0KPiANCj4gQUZBSVUsIENOMTAgYW5kIENOMTEgYXJlIG5vdCB0aGUgcmVhbCBDQU4gY29ubmVj
dG9ycywgdGhleSBhcmUgaGVhZGVycw0KPiB0byBhZGQganVtcGVycyB0byBzZWxlY3Qgd2hpY2gg
Q0FOIGludGVyZmFjZSB0byByb3V0ZSB0byB0aGUgcmVhbCBDQU4NCj4gY29ubmVjdG9yIEoxNi4N
Cj4gDQo+IEhlbmNlIEkgd2FzIHRoaW5raW5nIG9mIHNvbWV0aGluZyBhbG9uZyB0aGUgbGluZToN
Cj4gDQo+ICAgICAjaWZkZWYgQk9BUkRfSEFTX0NBTjFfRU5BQkxFRA0KPiAgICAgJmNhbjAgew0K
PiAgICAgICAgICAgIHBpbmN0cmwtMCA9IDwmcGluc19jYW4wPjsNCj4gICAgICAgICAgICBwaW5j
dHJsLW5hbWVzID0gImRlZmF1bHQiOw0KPiANCj4gICAgICAgICAgICBzdGF0dXMgPSAib2theSI7
DQo+ICAgICB9Ow0KPiAgICAgI2Vsc2UNCj4gICAgICZjYW4xIHsNCj4gICAgICAgICAgICBwaW5j
dHJsLTAgPSA8JnBpbnNfY2FuMT47DQo+ICAgICAgICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZh
dWx0IjsNCj4gDQo+ICAgICAgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KPiAgICAgfTsNCj4gICAg
ICNlbmRpZg0KPiANCj4gb3I6DQo+IA0KPiAgICAmY2FuMCB7DQo+ICAgICAgICAgICAgcGluY3Ry
bC0wID0gPCZwaW5zX2NhbjA+Ow0KPiAgICAgICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVs
dCI7DQo+IA0KPiAgICAgICAgICAgIC8qIEFzc3VtaW5nIENOMTAvQ04xMSBhcmUgd2lyZWQgZm9y
IENBTjEgKi8NCj4gICAgICAgICAgICBzdGF0dXMgPSAib2theSI7DQo+ICAgICB9Ow0KPiANCj4g
ICAgICZjYW4xIHsNCj4gICAgICAgICAgICBwaW5jdHJsLTAgPSA8JnBpbnNfY2FuMT47DQo+ICAg
ICAgICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gDQo+ICAgICAgICAgICAgLyog
UGxlYXNlIG9ubHkgZW5hYmxlIGNhbjAgb3IgY2FuMSwgZGVwZW5kaW5nIG9uIENOMTAvQ04xMSAq
Lw0KPiAgICAgICAgICAgIC8qIHN0YXR1cyA9ICJva2F5IjsgKi8NCj4gICAgIH07DQoNCk9LLCB3
aWxsIHVzZSB0aGUgbGF0ZXIgb25lLCB0byBtYWtlIEJTUCB0ZXN0aW5nIGVhc2llci4NCg0KQ2hl
ZXJzLA0KQmlqdQ0K
