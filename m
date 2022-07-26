Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BB65581264
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Jul 2022 13:53:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233127AbiGZLxF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Jul 2022 07:53:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233125AbiGZLxE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Jul 2022 07:53:04 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2113.outbound.protection.outlook.com [40.107.113.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C586132EF0;
        Tue, 26 Jul 2022 04:53:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mxipad+WwkB8zcnl8uS7acWKoXxLoqPjVqiH3IleDiUSZRShWskUhVbapn+E0dHCS/i3jYUMe7fFCLB+GWSRhs3WtEi2BNCYVrkkbE92kjoO01fTjeB5TVatr/dvMIXhxEEnzH/Gesv+ktXynQCVq/JWUpULXe9Cs2I7UVzbiuyPK8hiCNVnsIQ3LgreWL9L5O5hYnwdgH5x7P1PbZoxukSwoDkDqox9oa/8B/B+7aYcG0u9I1rGDPad/WQQlTEKBG1MtZlya/4piQ4HY8Df7stwg42wfnZpzmiUZWBPowvhgnk1jA3/SkOI6vYIjKT5xwqn8pb31/hMmAOVqhFaRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EF1SKNwQswj+7N5mvSvPlXnreNCWbzSc9tUfzPsjx/Q=;
 b=bTPkod22NDrFcE2Kcc+k+FErJ+ipHv9aJj16KbN2Kr57eDLxdJoOJzWfp6D35MY0BvuOlG059WiXgcopi0jGeA5e4de3SUJ5wPs0i48n7k7Cd0CfRCNYAWMxhFJpApWeF8oyeHj4B1UPHXeQFsfL/8PcKdgeLjzHj0TobVUHDcnukvUtca2UK17FyLMmmXVuNX8oi/OOOMTVCIYvIZ8XKPfBtc+goyb3IdA9Viw4ZixiNTZsdxXqPrhMq8xta+V5EIdWHSnjnoJ+iJ4c+m+RHlebWQkfPM0a8F+afz8NMsN1gAEKzfTvLV2e2LHqe1W+J+70UTFjd4Yo8FmX61Nt9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EF1SKNwQswj+7N5mvSvPlXnreNCWbzSc9tUfzPsjx/Q=;
 b=kUe/RXVK+qcyfKUISHGQcCdxn2M0aUueGTh5vIzXMuSfEjP/4hPNmOCk5+NqKpK3l4a884DqrZQm6OvUyOWCewSu6vx4SL0ODOvQP5fkLnFnBZmNEQDjn1kNJIsgLrRvhRthjkGY3xcxJtcU0xvvB+bedl37jelAR3oviCts6fQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB6398.jpnprd01.prod.outlook.com (2603:1096:400:92::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Tue, 26 Jul
 2022 11:52:59 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5%6]) with mapi id 15.20.5458.025; Tue, 26 Jul 2022
 11:52:59 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document
 RZ/G2UL USBPHY Control bindings
Thread-Topic: [PATCH] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document
 RZ/G2UL USBPHY Control bindings
Thread-Index: AQHYVxh9xytamYHrGEySmgxtbnTiUKz92eiAgJM2yUCAAAC/gIAAC/TQ
Date:   Tue, 26 Jul 2022 11:52:59 +0000
Message-ID: <OS0PR01MB5922C60E1D0A737167CEEDE486949@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220423134601.141975-1-biju.das.jz@bp.renesas.com>
 <fd372f05-e811-a6c5-31ae-c80df44c9ae4@linaro.org>
 <OS0PR01MB5922C5F56F72744C1D7641AD86949@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <0c7688d6-b222-530a-3c61-0b081b43d090@linaro.org>
In-Reply-To: <0c7688d6-b222-530a-3c61-0b081b43d090@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa08c7c5-e618-4333-de81-08da6efd62df
x-ms-traffictypediagnostic: TYCPR01MB6398:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0C4kwp98/Y3Ds+rHsFuV5g9x0HYVboQielqN/Zithq1iQ95MfN+meL/yEzfC8mIB+kpAl0dKS19RrcVPGNSkuST4V8lzNLpDizq9Xhtn07Q0+P0KPIHpeNEjId5o9LtK0CnV+eHYYNjg8uXwQOJDWdm6A8Tr3UlLm9tYERcE+j3ejqcMOpVLELnLvRnNQagAVPJU45A3i3PDiUODUYTHYOtWB0psrow3tooGYZlVaccXC77ZFP3xSZEbpBF2Ywti3rQsknRsLdRKEoz1kApmGdiZmKxBJai51NRe5SSZIpJo65q4CJwmRo41QbBKuerVzfUg0d9KxmETr0tuU8z8ylVBulgYBSc2CAFTQ4BUs59+fnf8eEX83j3BwHQg6Vsid/bb5AWVaGBE+nV5BZJxGP7G68kMalucJ4f3chPrbZ/aL7R8Y/I6vDYzDjyeKeu0eL81r5WfxbrLVnytuac+bXCSk52Skp7wCOz4hq/9MW5L9GrJe64I2M6LGjEMCvjyYZ32zW1Cq4OI1nFAMdEsg3t5xmjKsj5uH2boswJiHxYBLKaa3wVtMl3OwAg3lXaelTk8eTf7s3jv7CU3EBdV1u3TSDMvOkYbKgimX5kPxFDkm7h1eUdV6us4/2rjv7u96MrevbsFXEbTRPserOWrOGLtfFkoaZZp/v8D5wBZuQzEF40fW8aOsp6gbFVFEC/nKV0m0/6dgUJEtHQzwt95KRKBjhfVyWzjmWaSkup3/QYbypozQ303TLSYrKB0R8kjXd+3sah3OLWzj3+Sn6BMZfSp9wGqTWsAYfzHK7Hj/iyKNifrN6gPNcFLTlsL4QJS
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(86362001)(6506007)(7696005)(26005)(478600001)(71200400001)(186003)(9686003)(41300700001)(53546011)(110136005)(54906003)(316002)(66476007)(64756008)(66446008)(76116006)(4326008)(66556008)(66946007)(8676002)(5660300002)(38100700002)(52536014)(122000001)(4744005)(38070700005)(2906002)(33656002)(55016003)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVJwVDVzMnA4eTE3cHhpdWJienBvbE84SzI1eG5QTk9rQWxxRGZpZjhxeEg1?=
 =?utf-8?B?MWZBbGtLMmZ1SDJ2b2dHMVgvSzk3elZRZ1d2TkxFMGE3L2Y5NTM2eU5jbmpI?=
 =?utf-8?B?a3lwanNPcVVVVS9ZZ0JQQVU3OXJZc3RRaWVVMTFmaHh0OFFSMEQrT3VWK21i?=
 =?utf-8?B?b1lNRWhoMmtBMFBDcGpkL1djY3hSK2dxeXpqT1VzMmJGVFIzVFZ4Tm9NemFi?=
 =?utf-8?B?VEJjMjROdjlUUERMNHRscTZ2b0w1ejJ4Q1NDaUJqVk8rQU9WWnRYbmZwdVdX?=
 =?utf-8?B?aytmbkpxaGZtTmVuSGNmNU9TeUxqQW5zUG9JQ2xUN0NKaXpMUldGOG5BM3pD?=
 =?utf-8?B?bDNHcHpWbXMrT0tMWkorSVEzZkNoekR4V2xFRDZpWEJLK0NVU0tubDBpZHB4?=
 =?utf-8?B?Qnp2UlpidmRtWGgrbS90eHRMM21UL1ovRFIxNVhrcUtSUnFqNHJORDMySHh2?=
 =?utf-8?B?L2dBMGRGYnp1VzVrUUFtckIyQkVTSFlXeklqSEtvMWhMYnM3cDNYTVVqdjJH?=
 =?utf-8?B?M254V1ZaQTVJN3NTVUdQQ0hwNlVNaTc1ZlMrREVxWVlVOGM3Vjd2cmRhZUN4?=
 =?utf-8?B?S1ZyVHFnTGg4UUh6SFhvcGhpSkFBVWpKUS9XTzdFZkZXOTBnbTVyOEEwd1Nx?=
 =?utf-8?B?R0dxSitmRHpHRWlDZWRodUhPODJVS0c4Y0xZWGdDU212MFhCb0V0Tkk3dFkx?=
 =?utf-8?B?cmZJOHRER25uZHcySWJJeTAwdUtyS2J2RnJOKzljZDdlRHlhcWdob0E2ZDlF?=
 =?utf-8?B?LzkrS3Y1Z3hRYWJqNXhkL0I5VHgxSTVXekVTWEVVNGRQeEIwK2g0a2w1K3JE?=
 =?utf-8?B?NmtWdGJyaW42cG5BSHUwYTIxeFpra3Zpc1dzYzMzMU02SDlKRDJPcEtwZlBl?=
 =?utf-8?B?bXJpbmVmTi9EOERlbzVXZTRkQ3dVRENJeFJkUUNhNHl5djNxdmUxR1NwVWpy?=
 =?utf-8?B?bVFJTmN4T08ybjRrMmVJS0lra1RQbmhBem9NUnNnclA1UnBJSDlTckNtMklL?=
 =?utf-8?B?dElGaFR6TkJ5R1NCdWJzaXA0aUJ3eXBWVWJxRnVkNTQ1R2hORFFFdm5ETXlu?=
 =?utf-8?B?WW1qdnRmOG9OV1dmMWh1SXNzVEorT2dvRVpUUWp3ekEzNGFmUnFaaDRpRzY2?=
 =?utf-8?B?VHFnaUFjTjh5Sjc4Q0VVUWpDOVJTSHdmRjBxZng1bFVEZHl1Z1VOclMzUER1?=
 =?utf-8?B?VHJiY3VxM0NoMmsrVFBSR05nanJRYThRdnRsem9uV1NadlRxbzNzRlZTem1Q?=
 =?utf-8?B?RCtScGVTYUl4UUxoYmpkR1lPajh1UDlZNU9FTTd4eGFWZlE2OUJud0RqU2E3?=
 =?utf-8?B?ZHFCL3Y2R2Zybk1PRVlvTmdPYVJTTTVFOWR1OXlZSnQvNHlZQjU1OGxXMG5K?=
 =?utf-8?B?c3huenZCc1o0RnBCSFdxcHA5TGprM0kwUEY1N1VPM3NNZFp6NUZFTVZlOEZu?=
 =?utf-8?B?SGlnU1JPb3U1by9WaitUYkNxRHlNZWZBTUJ3TTgrcW4zNzBUM0pzQmhoM2pp?=
 =?utf-8?B?WWpSalh0VXI4RG55ODdRQXQzZjg3eWorai8zWVE3MXJZdnZkVGM1U0Y3Zk4r?=
 =?utf-8?B?MElMQmhxOUxzYjlVOVIxVnJFVWcwV0RwVXhPUFA5MmZKZGtkbjFGR3JZQ3BX?=
 =?utf-8?B?OGRjSThLUmtFek9SQWNvbUFsOC9qN0pqWGdpSHlya3QyOHNwby9DWTN6azk5?=
 =?utf-8?B?cjhHeVcwVHBEQUZYNEZBRFQ2SlNTMlN0NHhBUzZvWURwOXAwNFc3RGp0Ni80?=
 =?utf-8?B?dzNhaXFIb1Fob3l0dlpmWmIyR3RBTjEvRmlvdlE2QndGMnFiV1MrNGFjV1FH?=
 =?utf-8?B?OFR5QnV3a3hXRzJHTmczbjhLTUplZVpqRmppbytVQm9hWFhOZ21RTTBuc1cy?=
 =?utf-8?B?cEROU2hxbi9XYkFDU2M1a25WWFNDQXcvVVNmNlFpVlowZUhYL3NJZnpYanpi?=
 =?utf-8?B?ZERtUUgvNGpJMkNjR0c2cFBZOXFGN01ZVmlsMy9CSTZOZWlYTVZBY0dESjg1?=
 =?utf-8?B?dGhydytHR2dwOWoyL3UvbDF6NWVuYUphSEhIQTlPM0g0UFFIRnpoR3NwWllF?=
 =?utf-8?B?cGlmejErNEMvN1p4cllTRDd6YkFwekg2anpua3plbzZDWXZRWVpvRnBRNlZT?=
 =?utf-8?B?VnhBZHo1UENOVkpMWkpwbnFVVzFkc2tWQmVDcWpReUVHYThSdXhzOWNwMlJF?=
 =?utf-8?B?Qnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa08c7c5-e618-4333-de81-08da6efd62df
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2022 11:52:59.0498
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: beP9QtihbR4aAM2atP+T1ZHky8w0UcZVG3Kw8PCAoK993ltA9Jlfaxc336/9cuGq5pIGQXwka6CHqMLbY+cJelcbwOuvHLrSrkmPmd0iKa8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6398
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkdC1iaW5k
aW5nczogcmVzZXQ6IHJlbmVzYXMscnpnMmwtdXNicGh5LWN0cmw6DQo+IERvY3VtZW50IFJaL0cy
VUwgVVNCUEhZIENvbnRyb2wgYmluZGluZ3MNCj4gDQo+IE9uIDI2LzA3LzIwMjIgMTM6MDQsIEJp
anUgRGFzIHdyb3RlOg0KPiA+IEhpIEFsbCwNCj4gPg0KPiA+IEdlbnRsZSBwaW5nLg0KPiA+DQo+
ID4gQXJlIHdlIGhhcHB5IHdpdGggdGhpcyBwYXRjaD8NCj4gDQo+IFdoeSBkbyB5b3UgcGluZyBt
ZSBvciBSb2I/IElmIHlvdSB3YW50IHRvIHBpbmcsIGJlIHNwZWNpZmljIHRvIGF2b2lkDQo+IHdh
c3RpbmcgdGltZSBvZiBvdGhlciBwZW9wbGUuDQoNCkkgYW0gbm90IHN1cmUgZG8gSSBuZWVkIHRv
IHJlYmFzZSBhbmQgc2VuZCB0aGUgcGF0Y2g/IHNpbmNlIHRoaXMgcGF0Y2ggaXMgDQpmb3IgYSB3
aGlsZSBhbmQgbm8gcmVzcG9uc2UuDQoNCj4gDQo+IA0KPiA+Pg0KPiA+Pg0KPiA+PiBBY2tlZC1i
eTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPg0K
PiANCj4gU28gd2hhdCBkbyB5b3UgbmVlZCBtb3JlIGhlcmU/DQoNCk5vLiBUaGFua3MgZm9yIHRo
ZSBBY2suDQoNCkNoZWVycywNCkJpanUNCg==
