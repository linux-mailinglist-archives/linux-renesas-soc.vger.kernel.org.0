Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39A615145EF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Apr 2022 11:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356718AbiD2Jyk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Apr 2022 05:54:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357804AbiD2JyZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Apr 2022 05:54:25 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2102.outbound.protection.outlook.com [40.107.113.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D16D2C8668;
        Fri, 29 Apr 2022 02:50:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TnYEyeY6lv4libiWFk5dVV1yXk5VRMNGI7aem2NveOJAGw3q4ueiqWneSN5Ri5yiMhJU9WIcjl7K+FDUda3Za9tCfyP19qRhVUtobzLj1+TZg5fQxZjqZ9Syd04shSh3XakseNxZMCgIWF0WrDxhr3Uy2vXnqnistEucVshhxTvzHU9eI3Dryw67xokPXoqoAml2dpmR59XdQfpQ2V1LiTX/e0iYcwsI6jRxUj6h2yYIY+l8bFP3R3j7xwvCZotnqdnEfcKWGiCkrMric+4KeWMQ9vJAgKBO7lIN4bRJS6+ljj5sF+0okhWHYAfNksPwGoHfO1cVK3NoUkTIgcSGFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+0kTNHqlmhZ3wCQuK141BWNCHgFP/wlrcFFgcrF/m4=;
 b=RqtW+dY1ULjuRu2b+QGnv+J2DSEjf1Fu6Is8T2TC9KEPoA9rR3MOG+8Z7p4gV5LGEnLex7l53t/xPsGK/Fl5ITD9udP3pNz3haPEvSMjj3klyEy08JgbWruN7qDMTXtaDl0xD3hd5b/op1tqZUC/8zpTkZ4eIusgbSn9ySMziu38ipKgbgcM+6ZqVj40lEGTxhCBtxvwkv3r1VjeXxKqA2AQpYSCcWHaWIFo/K8gDIXqZ9tuDeQcDB4ZM66rRd5tPyTK7NKxdOmBgKOi4B4ablKwJzcrsAQTkdPeMGU7jAU9ruXrOVw41vvQPgSkntP9sYcZ3n8E+PTrQEdTcY366w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+0kTNHqlmhZ3wCQuK141BWNCHgFP/wlrcFFgcrF/m4=;
 b=PWelKXNyv3wbjSk0wP0KzEkr9CpNiPW283DdRWZq4PfpIxSJ4/Ywf/OINZ/yxhFp9D74hbd8uyVPtebUksQw/d23xLkGSNzcw1mwvQ82JYqWME97tbI/NOI94d2CBY+tGCV6ywTJLxHGRxumaU0xDSB0UK1P6JIdaYLmVIWFFvc=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY1PR01MB1692.jpnprd01.prod.outlook.com (2603:1096:403:1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.20; Fri, 29 Apr
 2022 09:50:08 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57%7]) with mapi id 15.20.5206.014; Fri, 29 Apr 2022
 09:50:08 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 3/9] clk: renesas: rzg2l: Add DSI divider clk support
Thread-Topic: [PATCH v2 3/9] clk: renesas: rzg2l: Add DSI divider clk support
Thread-Index: AQHYWhv7A6T+bHumC0eniUT7n79q0q0GpZ6AgAABVgA=
Date:   Fri, 29 Apr 2022 09:50:08 +0000
Message-ID: <OS0PR01MB5922F0C5A80F26109A27BC5D86FC9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220427094823.3319-1-biju.das.jz@bp.renesas.com>
 <20220427094823.3319-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdUo6J7_hfsoDYprMc7Tk79D4FxQiXJ7hFH8s_6nzptsUw@mail.gmail.com>
In-Reply-To: <CAMuHMdUo6J7_hfsoDYprMc7Tk79D4FxQiXJ7hFH8s_6nzptsUw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 05bd770c-131f-4827-0a1b-08da29c5a584
x-ms-traffictypediagnostic: TY1PR01MB1692:EE_
x-microsoft-antispam-prvs: <TY1PR01MB16923871866244144AA0FD2B86FC9@TY1PR01MB1692.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R8Tx/sOwbfJ3HG3VN5fe7/skKgHpMQ18AeMm6X7fgnv4S01lTnC05DAWAoOQUW4d95GM/6Hnpy4LSt2Os69Yb06Y4VD2fqxuPxAqtYY6FpJXR/W1eqanPMDRE/EzaFt2HD9TUX3A3Z6/uda0sj5FNUSwKCkWKD+Ed3qOWWhklFFwDqQcK4hgQU6JFcb5KA0Xzi3usX6Rb4wFJutuBS1fK6v4H9i658JtdzvznSy9++DRaLQwnqGxVQzGI8QRXjGSu5/P9rGYYGZcESRb0nyQS020kbPo0wt7eiE69wheiWqF07llOvLRQsCTu1xlCkHQDC07LP0GBy3NvgXspoa0TngwjyRHoLdxekXwO04hfNvQH0y8qIgukef4vH/qk/NoJi5tWvIg+YCN463UDvQtvX2Vw49CZw9a/FiUelfeE+FyyDxBMxFbRlFo1gCXWOZIyQ48f/xjbAkcMClTpMbwC8EaAvmiV73ahQA2NhICvYT9Ch87SPkJrhT49aygaDn1QyFcwaWf3vTUnL7tWyBKP+Svu2iUuSv7k3QvTot0aNCnr2XOlsHaobtF8Q5Yo829wrEGnVxyvupf9eQ3uE3F7KpH4bFbSgnPRXFpEmCHotwu4baGMjsnaIu3QbkyxugHeDte4pqRABr4ndYusVZ3ufXUqy+P0HCskZx05qNnf1oHHl7t0tZIXhkFvl5C8V7FvMXBT4d6g2oIqkPngql5cA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(107886003)(508600001)(71200400001)(8936002)(53546011)(52536014)(86362001)(186003)(6506007)(66946007)(26005)(7696005)(9686003)(76116006)(4326008)(316002)(66556008)(54906003)(64756008)(8676002)(66476007)(6916009)(66446008)(122000001)(55016003)(33656002)(5660300002)(83380400001)(38100700002)(2906002)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UXdhUzN5cnhRMGh5eldUUmtZNlVnVlltVUpnQ1RMVTdOeVpvZ2U3S2RSUC9Q?=
 =?utf-8?B?QW5qaERSbmhxSjdFSHFFaCtDeHFSU2ZqTm81dldFL0Z4YTVraGNvanBRODhM?=
 =?utf-8?B?TDcydDdXUzViWmVmclp2Y1VaSDV2NG5XZHBKTzJFRFBKMEJuUWpqTTluQjh0?=
 =?utf-8?B?aFpvdHhYR3pxc202SmQwa0R6VWVqMmR1eTJJaWdlYlorWWNlbThFeVlOL0py?=
 =?utf-8?B?M0VYRWx2SVlQUFEwS3E0c1VodUtuR3l5LzlWSkpDUjM0SGhvaURLTnB3UUI2?=
 =?utf-8?B?bm1RSHlPWW83S2t1MkZBSS94NU1ESm9JNThucTNVREtkc0JpSzVUbUpUQ09Z?=
 =?utf-8?B?Rm1RSXBQOUJTR2JPL2xUbnFXZVlaYXBEWGNCdVZYdkRwSENVbElqMFIyc2lw?=
 =?utf-8?B?TUpWUm54RnNybTZ3TnFBZ3JvbnFKL0NGMTVBYW5pM2pCd0I0MFJJc1lNTGJ6?=
 =?utf-8?B?eDhUR29kdVZUNHh1bjlMa3p5RmRUMXkyZE82YlZYUmRRQUpiZ0hmSytYUWpD?=
 =?utf-8?B?MjYxUk1hWEhLdG1Cc1M1ZTF3RHFNblYzK1NpQk0xWFk0SUsyYThCQXl4bWJJ?=
 =?utf-8?B?b2Z4NS9ueFV2R3NvTHZGUWpwYjVQcmZMdHIxQU0ramFKZVN2RXpUWTNnUjZz?=
 =?utf-8?B?YTZwN0NKK2Jja1pWNmhFWS9JcVFsc0tBSVQzWjNxTFpWekdGRDNOemhhUVFO?=
 =?utf-8?B?bFlEWDNCR0pnYXUzajZCemdyajFjVFo5SkEvaUdFbzkyL1hSYWgvMVpFSE1s?=
 =?utf-8?B?bGF6eTRIcmhsa0E0elRHZis3cGxoMDZrTHRvcVRFSHhBSkhhcEFYRDN5ZjJh?=
 =?utf-8?B?eHhCV1k1dkdrdWhCbk56ZkFud0xRMXRKZTRtQnR5d0xabEhXMVZXVE4wVEVs?=
 =?utf-8?B?WEY2MkN4N29tVXBQSW84ejVKT0lRL1JtRVNJcFM2TEptQkdNUm5NUjRDUVNa?=
 =?utf-8?B?d05EaGlQWHc5dXhDTzFtSHVxRUJaUHZIMmJQV0cycGhiQWN2RE9nTUJHa2hk?=
 =?utf-8?B?OTNnc2pqQ1dCQk5WR2c1K09lWGorb3Y4UFJzSGhJMHlCOWQ3U0FhUHpHT21w?=
 =?utf-8?B?ZUhLMjVpcmxaVmFlLzBUWEEyeUwxcmR5L1hRcE55T1V4LzkzR0Q5dUNva3gz?=
 =?utf-8?B?STRNTG9qWjBKZnhUOS9Tcjc1L1g4SHdvT0VYT2s1WUpKcHpLbVFUL08zRzdv?=
 =?utf-8?B?aE0xVnFCT1dtTU9FSnNrVW5DMndBMFB3Y1JmQTNld3RmK0VYdkg5ZU5PN203?=
 =?utf-8?B?SEsySVVDYndvRVBQMElENkdPb1UwTkUwalRWakxMNi9sZ2xldmh5RUZEWlpO?=
 =?utf-8?B?aXlFM1J2Lzh5dWRTbGU3TUp1NkZYR2hoN1l5OWlPc3B0WXFDbjlEb3NlSVBy?=
 =?utf-8?B?cEVKd2oyelhlNElBTWlxQzljUWZ4bUJSYWRXNTdjQ1lxT2J5VU1SRGlWU25p?=
 =?utf-8?B?bXQzMzhUeVllalBKUmRtazAyQ3JuK0pNdGp4dndrUUlLNThzNyt0dEVKQ3l3?=
 =?utf-8?B?UWZHVnlHWi9xdzdQYitLRVdQcFUyTFZGblZYb3l1eTZqcjVmbCt2QWRFSUNk?=
 =?utf-8?B?YmVPQmIwWVFiM2tCNnI4anZ6YjdUNVpwOWZYVFcyMXFUdWdOZllVamQ1V3BB?=
 =?utf-8?B?L3g1M1VRUEEyazVuTHc4S08rd1p1TDgxdGt3VUY4T3dGano2VXJ6V2RzOHBh?=
 =?utf-8?B?K3hHMkJjK1FQdlZ5dHo5M0FoQ25qc083RDcyUmZUNzNzczVhUGdubTVUOTl5?=
 =?utf-8?B?Vm5Eb2hpcXRxaVhJVm53NFNxTFpnSzB5YUJUTVhuQUUxNFpCd0MrNUhSWS82?=
 =?utf-8?B?S2RybHlBaGJKRm1kN0tsM3cxQ1JUSkNUcC9ad3Q2WFNMTSs5UDBVbnZmRG9V?=
 =?utf-8?B?RjJGNEhrQm5KTmJPYkRDbHlBdXBVV2x6RnpDY0JqN3hnUE5wV0NLeVdQbHBP?=
 =?utf-8?B?b2U3cW1KWS9NcndEckNST2tQNTFVeXdJRUY4RjhiQVFzVGNXenZORysyWUl2?=
 =?utf-8?B?dFdnMTA1Q0d0eWxmM0Y3eTFpOFd1ak5sajZHdDVEcnZPOWptSHg5Z2N4OGtM?=
 =?utf-8?B?TW0xVUE2c09EQi9lQ3ZNRnpVNGVyd2dvemhRcUVndDk0ZkpkcjVVZlR4WFZE?=
 =?utf-8?B?cVRJdDVyeEw2cHZCL3VqcjlUc3I3TFR0em5PTEEvWHJlbTB2dFhCbk1OR296?=
 =?utf-8?B?V0tGcXF2S1M0OEhtQUNCMVNqaTZyWVJXcC80RG5qTzJlUFA5WFp5UUlpUTYv?=
 =?utf-8?B?YzdDcU1nNW9LVUxUNEw0V0N4M3ZtR213NXkrQjBDb1Y5N0hwNzI5YUZKN0dQ?=
 =?utf-8?B?Zm9wTktSZ3FYd2dNdmszWXlucHB3eXZhNWNMc2NmUTBoTzNEanh0UmNXWjNk?=
 =?utf-8?Q?sZJePKCle8ZUPWQk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05bd770c-131f-4827-0a1b-08da29c5a584
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2022 09:50:08.8380
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MUSOblw5oBi4jM0OCUcy2QxTFV+bRD9DawQMAn1QB0absaR+1bEAsmFcQLOb3RcKKS8rrAyGHxZ4hT0DBKV0KX/kHS8g6s5VEbokWcnKWK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1692
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgMy85XSBjbGs6IHJlbmVzYXM6IHJ6ZzJsOiBBZGQgRFNJIGRpdmlkZXIgY2xrDQo+
IHN1cHBvcnQNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBXZWQsIEFwciAyNywgMjAyMiBhdCAx
MTo0OCBBTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0K
PiA+IE0zIGNsb2NrIGlzIHNvdXJjZWQgZnJvbSBEU0kgRGl2aWRlciAoRFNJRElWQSAqIERTSURJ
VkIpDQo+ID4NCj4gPiBUaGlzIHBhdGNoIGFkZCBzdXBwb3J0IGZvciBEU0kgZGl2aWRlciBjbGsg
YnkgY29tYmluaW5nIERTSURJVkEgYW5kDQo+ID4gRFNJRElWQiAuDQo+ID4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+
ID4gVjEtPlYyOg0KPiA+ICAqIFJlcGxhY2VkIHJvdW5kX3JhdGUgd2l0aCBkZXRlcm1pbmVfcmF0
ZQ0KPiA+ICAqIFVwZGF0ZSByYXRlIHZhcmlhYmxlIGR1cmluZyBzZXRfcmF0ZQ0KPiA+ICAqIEFk
ZGVkIGdldF92Y2xrX3BhcmVudF9yYXRlIGhlbHBlciBmdW5jdGlvbg0KPiA+ICAqIFJlcGxhY2Vk
IHBsbDVfcGFyYW1zIHdpdGggbXV4X2RzaV9kaXZfcGFyYW1zIGZvciBkc2kgZGl2IHZhbHVlcy4N
Cj4gDQo+IFRoYW5rcyBmb3IgdGhlIHVwZGF0ZSENCj4gDQo+ID4gLS0tIGEvZHJpdmVycy9jbGsv
cmVuZXNhcy9yemcybC1jcGcuYw0KPiA+ICsrKyBiL2RyaXZlcnMvY2xrL3JlbmVzYXMvcnpnMmwt
Y3BnLmMNCj4gDQo+ID4gK3N0YXRpYyB1bnNpZ25lZCBsb25nIHJ6ZzJsX2NwZ19nZXRfdmNsa19w
YXJlbnRfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZw0KPiA+ICtyYXRlKSB7
DQo+ID4gKyAgICAgICB1bnNpZ25lZCBsb25nIHBhcmVudF9yYXRlOw0KPiANCj4gUGxlYXNlIGRy
b3AgdGhlIGJsYW5rIGxpbmUuDQpPSy4NCg0KPiANCj4gPiArDQo+ID4gKyAgICAgICBzdHJ1Y3Qg
ZHNpX2Rpdl9od19kYXRhICpkc2lfZGl2ID0gdG9fZHNpX2Rpdl9od19kYXRhKGh3KTsNCj4gPiAr
ICAgICAgIHN0cnVjdCByemcybF9jcGdfcHJpdiAqcHJpdiA9IGRzaV9kaXYtPnByaXY7DQo+ID4g
KyAgICAgICBzdHJ1Y3QgcnpnMmxfcGxsNV9wYXJhbSBwYXJhbXM7DQo+IA0KPiBSZXZlcnNlIFht
YXMgdHJlZSBvcmRlcj8NCk9LLg0KPiANCj4gPiArDQo+ID4gKyAgICAgICBwYXJlbnRfcmF0ZSA9
IHJ6ZzJsX2NwZ19nZXRfZm91dHBvc3RkaXZfcmF0ZSgmcGFyYW1zLCByYXRlKTsNCj4gPiArDQo+
ID4gKyAgICAgICBpZiAocHJpdi0+bXV4X2RzaV9kaXZfcGFyYW1zLmNsa3NyYykNCj4gPiArICAg
ICAgICAgICAgICAgcGFyZW50X3JhdGUgLz0gMjsNCj4gPiArDQo+ID4gKyAgICAgICByZXR1cm4g
cGFyZW50X3JhdGU7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQgcnpnMmxfY3BnX2Rz
aV9kaXZfZGV0ZXJtaW5lX3JhdGUoc3RydWN0IGNsa19odyAqaHcsDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgY2xrX3JhdGVfcmVxdWVzdA0K
PiA+ICsqcmVxKSB7DQo+ID4gKyAgICAgICByZXEtPmJlc3RfcGFyZW50X3JhdGUgPSByemcybF9j
cGdfZ2V0X3ZjbGtfcGFyZW50X3JhdGUoaHcsDQo+ID4gK3JlcS0+cmF0ZSk7DQo+ID4gKw0KPiA+
ICsgICAgICAgcmV0dXJuIDA7DQo+IA0KPiBTbyBhbnkgdmFsdWUgb2YgcmVxLT5yYXRlIHBhc3Nl
ZCBpcyBzdXBwb3J0ZWQsIGFuZCByZXEtPnJhdGUgbmV2ZXIgbmVlZHMNCj4gdG8gYmUgdXBkYXRl
ZD8NCg0KWWVzLCBXZSBjYW4gYWRkIGEgY2hlY2sgZm9yIGZyZXEgZ3JlYXRlciB0aGFuIDE0OC41
TUh6IGFuZCBpZiBpdCBpcyBncmVhdGVyLA0KQXNzaWduIHJlcS0+cmF0ZSB0byAxNDguNU1Iei4N
Cg0KPiANCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGludCByemcybF9jcGdfZHNpX2Rpdl9z
ZXRfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgcmF0ZSwNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgcGFyZW50X3JhdGUpIHsNCj4gPiArICAg
ICAgIHN0cnVjdCBkc2lfZGl2X2h3X2RhdGEgKmRzaV9kaXYgPSB0b19kc2lfZGl2X2h3X2RhdGEo
aHcpOw0KPiA+ICsgICAgICAgc3RydWN0IHJ6ZzJsX2NwZ19wcml2ICpwcml2ID0gZHNpX2Rpdi0+
cHJpdjsNCj4gPiArDQo+ID4gKyAgICAgICAvKg0KPiA+ICsgICAgICAgICogTVVYIC0tPkRJVl9E
U0lfe0EsQn0gLS0+TTMgLS0+VkNMSw0KPiA+ICsgICAgICAgICoNCj4gPiArICAgICAgICAqIEJh
c2VkIG9uIHRoZSBkb3QgY2xvY2ssIHRoZSBEU0kgZGl2aWRlciBjbG9jayBzZXRzIHRoZQ0KPiBk
aXZpZGVyIHZhbHVlLA0KPiA+ICsgICAgICAgICogY2FsY3VsYXRlcyB0aGUgcGxsIHBhcmFtZXRl
cnMgZm9yIGdlbmVyYXRpbmcgRk9VVFBPU1RESVYgYW5kDQo+IHRoZSBjbGsNCj4gPiArICAgICAg
ICAqIHNvdXJjZSBmb3IgdGhlIE1VWCBhbmQgcHJvcGFnYXRlcyB0aGF0IGluZm8gdG8gdGhlIHBh
cmVudHMuDQo+ID4gKyAgICAgICAgKi8NCj4gPiArDQo+ID4gKyAgICAgICBpZiAoIXJhdGUpDQo+
ID4gKyAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ICsNCj4gPiArICAgICAgIGRz
aV9kaXYtPnJhdGUgPSByYXRlOw0KPiANCj4gU28gYW55IG5vbi16ZXJvIHZhbHVlIG9mIHJhdGUg
aXMgc3VwcG9ydGVkPw0KDQpDdXJyZW50bHkgeWVzLCBCdXQgSWYgd2UgYWRkIGEgY2hlY2sgZm9y
ID4gMTQ4LjVNaHogaW4gZGV0ZXJtaW5lX3JhdGUsIGl0IHdpbGwgYWxsb3cgb25seSB1cHRvIDE0
OC41TWh6Lg0KDQpSZWdhcmRzLA0KQmlqdQ0KDQo+IA0KPiA+ICsgICAgICAgd3JpdGVsKENQR19Q
TDVfU0RJVl9ESVZfRFNJX0FfV0VOIHwgQ1BHX1BMNV9TRElWX0RJVl9EU0lfQl9XRU4gfA0KPiA+
ICsgICAgICAgICAgICAgIChwcml2LT5tdXhfZHNpX2Rpdl9wYXJhbXMuZHNpX2Rpdl9hIDw8IDAp
IHwNCj4gPiArICAgICAgICAgICAgICAocHJpdi0+bXV4X2RzaV9kaXZfcGFyYW1zLmRzaV9kaXZf
YiA8PCA4KSwNCj4gPiArICAgICAgICAgICAgICBwcml2LT5iYXNlICsgQ1BHX1BMNV9TRElWKTsN
Cj4gPiArDQo+ID4gKyAgICAgICByZXR1cm4gMDsNCj4gPiArfQ0KPiANCj4gR3J7b2V0amUsZWV0
aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4g
R2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAt
LSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlv
bnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLg0KPiBCdXQg
d2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBv
ciBzb21ldGhpbmcNCj4gbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
