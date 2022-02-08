Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C47D4ACD6E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Feb 2022 02:08:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343673AbiBHBGY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Feb 2022 20:06:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241237AbiBHACd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Feb 2022 19:02:33 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2117.outbound.protection.outlook.com [40.107.114.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC1F1C061355;
        Mon,  7 Feb 2022 16:02:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l99PH75RIck9NuYi74ayUKnwAIvOuGHpoPBnm+Sj5eHN+lGJkqf8OAEJLz6FeNExMCH9dLeOqQd/1i9zv6XfsLhePDZSo19ayi+YEMOSVJP7cYfADcYa0L5SRvt4yS723sTusNuDjhxop8qAl/gFWKsgRL5YeEWCdTLxEvT2hOULbWo3tvzBLTmETrPvjMx8GpUovhllWJvwbARafira8z0lWXR9XsACcDTGbjQ6slJloqm3RT2bBHGtgGBAyhzTNddI0W8j8RhbTjJlPNUrCwrThkeloj38Em/jYKdtvQDppUAdUxgIL4cRPCKsWwVJZhI8vdcllZQkws5LeM6Urw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+n+FDoS375AY7meLP80E5jLM2h0SPI4QbPGGDItLfc=;
 b=d4YNwPpRwLfMDH5etgT58HPRR4TxuTW9MQGBu2l/NqLQaAR0dURO/UlchXxbdptR8Ca3JF+jMjKoIspCLTbFKPBapFVHGXJHAwSKvxtNaW2+RfMpEl+LycRy3dGtoHlnQsjdxehfjc+GUFrWGlCZRe5r11shCQpNaxc1FKdH5EyroFne7RFtDjRoDV7lyn7I6azKp2bvetG4lm4KzMASkdilJchjWL0cFLLbyGmEUXYL0tH3PuM5JBC8CH0v3ZhvT5XZbDnFTRtbEsNrHRiUSSx7OZ59TDjgmqswxunfJdSwwHldBcPCaFW5zIZYJse1EhbTZIhwOEEm9qh10uHlfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+n+FDoS375AY7meLP80E5jLM2h0SPI4QbPGGDItLfc=;
 b=n0bQ7+608FTAxRr3iFGP1UrtGiqixIPM7AShiYDm1jwGy5qJtO9VTIs1lGAzpEmfyhjOoyjwxtmBevjKUnopg3VDIy3kj+h6wgPNKCh4IfOSi0AI5RS1GGQJ3bYf5+GMB/wnASrkr3/EhM0M37FsVGgj9mCtH5IDtAgA1S8wmI0=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OS3PR01MB6360.jpnprd01.prod.outlook.com
 (2603:1096:604:e1::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Tue, 8 Feb
 2022 00:02:29 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::b8a7:7600:2af0:eea7]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::b8a7:7600:2af0:eea7%5]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 00:02:29 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] dt-bindings: iommu: renesas,ipmmu-vmsa: add
 r8a779f0 support
Thread-Topic: [PATCH v2 1/2] dt-bindings: iommu: renesas,ipmmu-vmsa: add
 r8a779f0 support
Thread-Index: AQHYGca0z5dH/tlDUkSYf1QNNKBnsKyIKdaAgACgUmA=
Date:   Tue, 8 Feb 2022 00:02:29 +0000
Message-ID: <TYBPR01MB5341CB0FDDB83BCA4387C443D82D9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20220204125653.1194249-1-yoshihiro.shimoda.uh@renesas.com>
 <20220204125653.1194249-2-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdUc_VmwR43CgYhwKZ+t_GCXzj9+9vaEBZR-2-ui1PC-1Q@mail.gmail.com>
In-Reply-To: <CAMuHMdUc_VmwR43CgYhwKZ+t_GCXzj9+9vaEBZR-2-ui1PC-1Q@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a400f90c-8c0f-4bde-6c1a-08d9ea964c7f
x-ms-traffictypediagnostic: OS3PR01MB6360:EE_
x-microsoft-antispam-prvs: <OS3PR01MB63606755D8E8B12C60F8C774D82D9@OS3PR01MB6360.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Rdm491CiYKRn1HO3T4kFBoBvMR7bcMFXvaHsEZhJjr9sr+6CYVSXCqDOUC4j5QtJk5WLj5f5CSMOyqFo29W6ay6iTblVsKg9VS84YJADaO+d9ZW9KLJwAJCcsbVYUGvPu9ePqJ7IefspKsjFR/BvKagJfDhVcLIRbO+p7YiM7OnAAAQYPM6Y3mbGOUN+ND6HdlUopymGv471mN+jztSDS7y8tVcPCLBI79zJ9KW2ZkIA2Rjmo3LWTmcL72aWgIVcuHw4nJ+/oJjOzOea9PFe3oHUuOFsEnVpt64CIUBuOLK2es6TqYK+K20q3zSwU9AGb4Z5qjgHznN1aGIyr9w2hN+wOa4OUwe0o5zuNWKHhCuf+qIVAlNC3WYhKBjlbquH+g3+OPAjt+ZRtGYNZZFaxruBvNzGVZNf62zcT2gQIaXJrI+kCQmkDVXYj0MSRn/VO0p0owNRWIhA8f8WjiLm8nsNPgB9l4dTx67pym8sBVA3extCCtlDfGI8H7Yeq8D5wcC+aJU1uctoME7TjaBEFwWtXcx+tGwFx0pUz+RPsmNJwls5ga6hZt/8IhAPPcYgqesLRgZvybc8gqOssYxDW5TnEtIS76kTRW6EPeLX/jhU86jYT1nrnUvMmKGDyD89GZ5n+no/YQIPvKIX40qmy0Ua7X47LInfnfPmG/FDcQ61r9xTV8WyAfEml26kEzpXYc9HEMRyDjTylF8G3qfUcw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(2906002)(83380400001)(86362001)(38100700002)(122000001)(186003)(33656002)(64756008)(66556008)(5660300002)(55016003)(316002)(71200400001)(76116006)(66446008)(66476007)(8936002)(54906003)(66946007)(8676002)(4326008)(6916009)(53546011)(52536014)(508600001)(9686003)(4744005)(6506007)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SXRId3pIVGJhYm5va3JkOTlUMTc1aDJkSkVRQXdkcjdtazI1NVVuaVlxOGVL?=
 =?utf-8?B?TnVXVkhRT3Zibmw2dURWb3dmL3drN1dQbEtOT3dPRElvV3ZqNUtNNUp1OGRx?=
 =?utf-8?B?RXJidE9XOWRlSWRyZUUwQklMUXFoTVE4b2JmQXlvc2FUZUhheGdIbDI2cktV?=
 =?utf-8?B?K1oycUY4blVCeVZpdGIxNzdTY2pjZWtaYjUxTlBJM1M3UzY2ejZPM1Z6V2Ji?=
 =?utf-8?B?MTVUQTlKRWpHYmtzMTJ1Y24yVHR4ekpaN3NSSEFVZkRYeHRXNE9TQStXeW5s?=
 =?utf-8?B?RVBLZU5Gc1J1OXpaOUlzQ1RILytjZXk1cnB2Tzk4bzVSLzIxTzFJL0hTQnAy?=
 =?utf-8?B?bCtoZUdZdUZVZldtejkxaUpjUXh4cVJoSGRCSE5JOWtKNWpJRGtYdkZTcnQz?=
 =?utf-8?B?YlFKeWJ2K3A2cDJzU3E5MHZsRmlCaitjY1lqVFVEYjdWZDhrQjdvdjJvcGFX?=
 =?utf-8?B?aEVxYWthbDdMdStrUG5ENDVnWHlNRkpGUTdOS2d0MmtDYXdwdGYraklsd09h?=
 =?utf-8?B?ZStudUc1Ylc5MkhuSkZTSStNb1FlQXhacWk2Z0FhQnlha3BlSWFGbmxXb3c5?=
 =?utf-8?B?akdLS29KdzdzRWNEQlVlRW5OWitZb2t6eGtaVUZmeU9TVzltemJ1bGRnVmJS?=
 =?utf-8?B?emt6MGR5S0t1ZDN3Z0Y5K3VpNUxTaDI2WFZyb0lVc3IrQk1SbG0velNyWm1p?=
 =?utf-8?B?RzNJOTNlR1hja0J0eFNZdUY1Rmhqdm1JaUNvelFCOUxRbzZaU3NwV1pQRUpF?=
 =?utf-8?B?a2lXWi9rSy9SVTVrYzR1N0RsV2hlL0srMldjUEZBbDJud1FoT01KK1d3TE9U?=
 =?utf-8?B?NWFMT3N2alljUUxYelJYMGVIbUhuMmFNWHo4a1dRZ3oxN0pLUkRNbkZkVGRu?=
 =?utf-8?B?Z3ExbitrRGx4SnNVQlVoRFgzc0szVGY1NmVpczR2RVJ2Z1UxaThSUUg3REYy?=
 =?utf-8?B?NkMxN0phZnZOYkFENGJtMllqZjg5TFUxQWFsdG4zd2RYYmhOaDJ5YlpwZnZ4?=
 =?utf-8?B?ZHpZTnpRcmVwY2o2VEZnN3BjQXcrYjVBb2xnWVN5SnpJbk5PMGJuZ3hMWTJV?=
 =?utf-8?B?V0cvTVBONU9XMW41RjkwQmk2UzRqVS9hZnZvVFg4QzRxZ0xNcU1TRFYrUENm?=
 =?utf-8?B?RmlIQUsvb1hlejlHQ3lOTldGd0c3WDlsYThpaUY2UzZ1Sm1nd05jQ1NycEly?=
 =?utf-8?B?VW9hbkRFNEVHaU1kMTBnT21tUWRFSUozamlaaEFWVWUvcmI4bzJlay9WdkVG?=
 =?utf-8?B?OTI0aVk4dU0rUG5US0VuMkRRZnBTRmxmR1hvR2FpalV0bVQxMjJGYXd6MjNl?=
 =?utf-8?B?b3ZIVW1SS1BaeXdBTExkd2Nyc2VDZEQzNWNaSFlOZUd3SnpLN0ZGektya0h1?=
 =?utf-8?B?bHl3bUpLRjdjNmlNeDc2VnNlaktXV3pDLzYwOXowakF3NG5wRFQ2WCtRYjhk?=
 =?utf-8?B?c21SMDJ4K0h2VVpGY0RZK3dRdDdsMzdROWhHbXVYS0JYZmpuRmcyL2VkK3E3?=
 =?utf-8?B?eFRTemFrZ0pLRFUzUW9sWHZxbjBSV0I3enlJVXp0WTFKQ0FscER2Mjdrenhk?=
 =?utf-8?B?U2V1ODd1ZDlxek92MzZVMmdSbVJBbEVBQmhld2V0WklDdm9RTktVWlR3R21D?=
 =?utf-8?B?V01qQjlLRTZXNnZKM0lzTm5pYTZXckc1RDZkOUFJR3ZKWjUveVN5TVRtVGNE?=
 =?utf-8?B?MTI0OGtxdHZUSlo5SWFBMWgybyttc1c3V3dRZ09PS0t0TE5teHdnZWdsTkxl?=
 =?utf-8?B?Y3ptZFlleUhQdEVrRGozcjhWbFlpYndTeFJEWWJzcm1KaFdpR1FzWlJpV0Y3?=
 =?utf-8?B?WW9mNzJPTmxTY01MV3d1ZlpPQWNBSTM1YkZFZnB6RkpWSjZhREl1ak5scnBU?=
 =?utf-8?B?dnlOa29WTDhCajc0YWZueXFkOWFoa0xvV1oxbm4yWXJ6REV1cEtwWE5HVXMy?=
 =?utf-8?B?bFQxOHFJa1MrTW4zOC9Pcy9vdDIwaFFwaTZDdVZtc0dYbXdCSStyak9id2hp?=
 =?utf-8?B?b21rOVVkN2ViZmllbXAxcXhHK2tuUmI3YTNkY0hkS1pjSjJkZzIvN2RTTi95?=
 =?utf-8?B?V3ltRThReDRENTFTRnBIL2dOZXJKQXo4UUgvbnVPbWR4ME1QakczZnpvM3VY?=
 =?utf-8?B?WGdJY3VrRjk1aVl2RXdCQ29HdGgzU2R0d0Mxa3E5MElqM2dobjkzTG9yUTVi?=
 =?utf-8?B?NHpNc3l6SEZrMXZkQklDK1FxaVh0Z3JFUUtlSjUvQnZac04xL0FrSThDUlcx?=
 =?utf-8?B?QnlNdjhxRzZNS3B0VElmNkpJdUkrWmpuMFU1aFlIQjJ6Q3hlTm9yUEpjd280?=
 =?utf-8?B?V0pnUUY5cmUwZFNSMUlteVN3aTVidUU4dGhoUEJBaDI4dVRaRTI1MGIvZlpD?=
 =?utf-8?Q?7bhd8EjPOyFcaGHxXWyQ33vNC+c18pJc3Z2Zr?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a400f90c-8c0f-4bde-6c1a-08d9ea964c7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 00:02:29.8111
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WohvzvDr2aussuQJX1up/vWtW275EF+H0ES7NBUGYJU846edecgQZcRQZMJVBAqZp2HOlj/ROFKzvMgjwh426nmOLFX5fmEa6Dy/68qBG6SUv+xiO29gqcfeHMP1wzYe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6360
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogTW9uZGF5
LCBGZWJydWFyeSA3LCAyMDIyIDExOjI2IFBNDQo+IA0KPiBPbiBGcmksIEZlYiA0LCAyMDIyIGF0
IDI6NTQgUE0gWW9zaGloaXJvIFNoaW1vZGENCj4gPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVz
YXMuY29tPiB3cm90ZToNCj4gPiBEb2N1bWVudCB0aGUgY29tcGF0aWJsZSB2YWx1ZXMgZm9yIHRo
ZSBJUE1NVS1WTVNBIGJsb2NrcyBpbg0KPiA+IHRoZSBSZW5lc2FzIFItQ2FyIFM0LTggKFI4QTc3
OUYwKSBTb0MgYW5kIFItQ2FyIEdlbjQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZb3NoaWhp
cm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQo+ID4gM2ZiZWZi
OTU3MDMyNTUwMGRiZjNmYWZmODBkZWQ2ZDBkNDZmNDhiMg0KDQpPb3BzISBJIGNvbXBsZXRlbHkg
bWlzdG9vayBhZGRpbmcgYSBzdHJhbmdlIGhhc2ggaGVyZS4uLg0KSSBpbnRlbmRlZCB0byBhZGQg
R2VlcnQtc2FuJ3MgUmV2aWV3ZWQtYnkgaGVyZS4uLg0KDQo+IFJldmlld2VkLWJ5OiBHZWVydCBV
eXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KDQpUaGFuayB5b3UgZm9yIHlv
dXIgcmV2aWV3IGFnYWluISBJJ2xsIHJlc2VuZCB2MyBwYXRjaC4NCg0KQmVzdCByZWdhcmRzLA0K
WW9zaGloaXJvIFNoaW1vZGENCg0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0g
VGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3Jn
DQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwg
SSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5h
bGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
