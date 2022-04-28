Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A347151338F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Apr 2022 14:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239599AbiD1M04 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Apr 2022 08:26:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239271AbiD1M0y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 08:26:54 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2109.outbound.protection.outlook.com [40.107.114.109])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FE5D3B2AB;
        Thu, 28 Apr 2022 05:23:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+JJGWl2HQgKEazlfglVJC+WpiO0hPk71aEoKkNs3mrLHli9sAWM02c1ZRYweAbBP3hlXCeGYgj5wsRQ2t0Ws8At7utSSre4rzGRdQwrstM3ptfVpkfvEdwufDJIXIJk5OBZS5SpVEzQaNY4QP1ECYW79a+FzJ0wFlzvymi2y/YgP3Nz1ekuPibCQqllrmAV4MY6UBRaDtP6EFMsTDaS6Pe8Ainj0FyajcA2ssVe40oY/fS5XXUiE9x0nUUVyK83Qek5HO2pcucxJg5AZlX3SSnjUpttRa9JlBiFmBRd0s+xtjfTSbzu2p/6I8xME5vi8vB3cvl+XNvkPYyX7W+M6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OiDpKVnEa6QjE4ED9ISk1mAgrV7EO5lAUXW9f2XQq1I=;
 b=hcXKQOc4URX2LE2gUAf4i2JNN5C8BKD3aSyJ4YDBBZtQZcF+EDyVpcmuyMde9HMlFep9sXKl2NVQOeUiuKDJY/X3W53hRKqM4ckqdCW8nB6k9sJ70UIgnqCcGtNY20MM5pyRGtxtD2wd9quzMpxm27jBZKxJFLpj2Zs7C4lLp1v3V9RwsJfJV/O+SV324fgDRNemMLXSRzq6Em7bfkBqkaWYNEpuYqmhW/A3BgpS0PrUXZjZm2M8+QzwnImA535BSCz+8ul5RtoVUqJS+H87XMHHcU6uCOD4NFnr5O36gdatjJRH+YQa1Zv4VZBUUr/53BYEiASPNlbgTB1bY1PZ4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OiDpKVnEa6QjE4ED9ISk1mAgrV7EO5lAUXW9f2XQq1I=;
 b=XyM2kf1pjaJZsJTLiCf7qRqd4kGoJ/BlyJdN4K2yXuFCIqvCRwdoBm479nPlXxt9ydNIo8hqu5S4tfrjve0gKeLrL4CNx1hvsyjE4TjezX/4tufc4U7ZzMqKVDkXmW8NQzAjyE1pF+zf5ta392pbqfucB3iXuj7bEulNJ5mIm3w=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB7431.jpnprd01.prod.outlook.com (2603:1096:604:14a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Thu, 28 Apr
 2022 12:23:38 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57%7]) with mapi id 15.20.5206.014; Thu, 28 Apr 2022
 12:23:38 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 5/6] clk: renesas: r9a07g043: Add OSTM clock and reset
 entries
Thread-Topic: [PATCH 5/6] clk: renesas: r9a07g043: Add OSTM clock and reset
 entries
Thread-Index: AQHYWIpENwQ8mTpg7UGz3bJo9uc/MK0FQ22AgAAA2XA=
Date:   Thu, 28 Apr 2022 12:23:38 +0000
Message-ID: <OS0PR01MB59228ED721115FAA3BFB3F5C86FD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220425095244.156720-1-biju.das.jz@bp.renesas.com>
 <20220425095244.156720-6-biju.das.jz@bp.renesas.com>
 <CAMuHMdUtQTGvO7vxHFnJ6uStHmoAx_sdhxRJgjYQTpq4H_gyPA@mail.gmail.com>
In-Reply-To: <CAMuHMdUtQTGvO7vxHFnJ6uStHmoAx_sdhxRJgjYQTpq4H_gyPA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e9d3ed68-6c9d-47d5-af10-08da2911ec5c
x-ms-traffictypediagnostic: OS3PR01MB7431:EE_
x-microsoft-antispam-prvs: <OS3PR01MB743133AD9F2889D2126BC7C986FD9@OS3PR01MB7431.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tcxy/4H1qFCendN10lnh2BdH2johBInuhuymg37F08vSTeU8icVgnCZYYAfRNGI7/pcuH7A+tQLECqxwpK2X42HjRHYdt6Q0+gSI0WH0zoo3z/In30QrYRPPQJUWDt/dbJzhhrfefcv50+dnX05IBm8puoUMTvCQanSigXiYt0q2XriO+SCJ3WEdV1tQMP4nUdSIBGDniw5bLDpByLNbCPCxUQLdCcDREtHxpAng8B/GJHz+29p9o9XhjLGf2qB6AkeXq/VCt1l30boAeQF0bUQtYS1qUy3Ny9PcXoDE2YzndjVw6wFTvSWZCGXLdpaFcNbEqhxtnvgC+Qy3sxD5g3kEnTGJWWxjQmzRmfxl99zJrIm8fcAT/uy8Om7qKaa0K6Lak/08AwWlNMz+8RrfzSnrIExnSJZ1o1RqndSb24ruFiYmjtcomNhTKdxK6T+Qy6Mf1jt3udkH1tiJO4/T0mUF8nUkvllZJNAZqZlv+h1G2K++K0X4bpOjQgTzgRwzvwMmt1T1q6HWH9Znci4fwdNvhdEZax5Psii6ZxU6WzXZELX7YyaTjK1g3yp3ZWYNf1xcLVaF4L/y6cAejZdhAzkX+WxgEqKGhMvmzmxZbtnOlawdx4fRTKyIVJ02ftMOdgi/w2iKNQiq7HZFJWF6M39H2OiQedCNyfzqoO88OCBhVEnKQ5Orb+kf1SU4nxuCEI1CiLmKkpFSitN8TOTw4Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(66476007)(66446008)(66946007)(316002)(122000001)(64756008)(66556008)(4326008)(76116006)(38070700005)(6916009)(38100700002)(8936002)(508600001)(54906003)(107886003)(5660300002)(52536014)(55016003)(71200400001)(86362001)(9686003)(26005)(53546011)(33656002)(7696005)(186003)(6506007)(83380400001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VFN1MXBmMzRyQkxtSUpUZHRES1RCSUtUYnNoODhtd0ltcUdFZzRWSjZLZG9x?=
 =?utf-8?B?aG9Rc3N1aDR3b3lVa0JybUtLWHRUNDdKL0xKVkIrWlo4L3dITnFmTUxQMzJK?=
 =?utf-8?B?NlJMNXhZS2R0YTNVdkkwOVkxR0I4S0swbDRNaFhLMkdobGM2c1VlSGE0UnpJ?=
 =?utf-8?B?eHN6b25OQTRURU5JdENqY2x1dU1wejVDanBUdUwrYXR0QU9GQVpIdXIyZFkx?=
 =?utf-8?B?YktyWjRnQURzT3pvZS95Q0dlelJsb3ZNQWNiREowejhmV3VpZGhKaFJzWkhS?=
 =?utf-8?B?TXNlQnJOMnIreUlHbzhVaFlqa1ZzclFZeFpsQ09CbHFMNFVRWW1QVHh1NmZW?=
 =?utf-8?B?UHJRY3BqRjBLS04vUTFKZzZBUlVqVlhqM1BWbHg2bHNQRWZxQXZmcnRjUGcy?=
 =?utf-8?B?WFBqcW1GS0p2UzJuazdXV0RRdC9ReEFnaTNaUGRMS1NjK2svTDNTY0pUTW9Q?=
 =?utf-8?B?NSs2NjlPeVZDbVFQNVlrQ25pcC9mZ0Qwb29YQndsYXp5c0VUSnN4TWRqblpL?=
 =?utf-8?B?ck5BWDQxbkorUndRZDJia2dFU0YxL1g3QzlxWHo2UzRlYjJZK1gzdXVhb2Jj?=
 =?utf-8?B?SCtuRm5ZVC9oVFRHQzVzUVhVSDZpY3Q1eUltT3BHaTBoNjVSckxUZkRvUEw4?=
 =?utf-8?B?bjVaZ2sxQW0rYk02NFJ0ZXk0WVV3aE5ySHBXeWFEMTlvREpkUGd4aEpmbjFq?=
 =?utf-8?B?TkVob01kMVlhdTVsWmpzcE1kWkx5dlljNWpVUkF0M2E3UmRESjk3L21hd0ZG?=
 =?utf-8?B?d0oyNlU1MjhZNWkxM21HU0o4WWVNekg1RXpWMmZZZmhLNDBybW5sQVBYb01z?=
 =?utf-8?B?MFVnbk1jeEZ0dDBzdWVXa0VWNkQ5eVYzckIydnlMaE9PUFo4a1FlZzZOdjRq?=
 =?utf-8?B?MTk1NlVuQklVVkVKVkNnbEJXZEtaVkRicVd4MjhNZis4R2tVZEYvMHRCNDdB?=
 =?utf-8?B?WVJxd2FHbVJWUHdvSHp5RHBQWVRlazY1eFRRMVVHeHJrWG5INGV2K1ArTjBE?=
 =?utf-8?B?RGtmZGkxUHRWNGtCNTZpa0czSmV3T3I5RlBtTmlKKzBnOUdZdDFiblF1V2FE?=
 =?utf-8?B?blVPVk5iZ3JXZnMwRFBjNE1qQjMyc2FlT2lCRHdnbDlXamxpSlJTZldDVFMw?=
 =?utf-8?B?YzlXSm1udlloT1RVWklKZmFIckU2RHVSTjdGbStneElPTzc2a3VLd1hSL21a?=
 =?utf-8?B?SWg3b2RidDlRQkExTE5UMG0rVW5tanBqcmJlenQvWjB5Vi8vcVZLN2YvbExy?=
 =?utf-8?B?VDFzVjc1aC9MTHN0WG84bnZBaXk4QVhoMkoyR3hHM3lZaEJRYWNsb0s1eHMx?=
 =?utf-8?B?MzFibm83TTFFN2R4OC9XbE95YWJPejhseFNRQUU0Q1IyT3BML2U3U0ZHNnRC?=
 =?utf-8?B?SC9vV250Ym50a2ltek5VMkkvSlI3Z2dyNHRKTDM2SEZXVlRUUWtES0NZMHN1?=
 =?utf-8?B?YS9JZ2NIWjhXWWdpSDE4VjZ5SzY1MkFCcU9ZMERnbFEvTDNsM1lLZzd3NGtB?=
 =?utf-8?B?R0VreGthWlBSNmNWTVpGSnIyK2JaMFlsSjI4WUk0ck9IR3FpTzdJVDlIeitN?=
 =?utf-8?B?cGI3Yk5DTjl4YnFGT3pFcmpxbkNvUU5iZHZ2TDNTakRnUGxTTXpKbDdkTS9k?=
 =?utf-8?B?YVdSTVN6eWJNNXZWRzBXWTFtbm9xc0IydTdUK3QxRmpxbmJVZWRkVEJ4bHVw?=
 =?utf-8?B?OTh6UCt6YnQrSEpsYkdZdlFybFpja3F0Sk8wZHZHc0UxZGlHbStGRndrY2RK?=
 =?utf-8?B?OXJQNkZpakJ0ZkwzTXNJckhtWDZkdzFDZjJXZGpFbE80UG95cHA1cFFEbDBQ?=
 =?utf-8?B?SUVEMUVIcW51TWc1Ri9zMFVZT00rUG00YkNHb3ZNNXNqSGFTSGk5dnp2cFRO?=
 =?utf-8?B?T0FWNk8zRXlqZ08rTXluaWdBcjUvS0pLREtCOHg0TkU3VjdHZzMySU1OQ3RO?=
 =?utf-8?B?S3dGWmMyZGdBWUE2cGl0T1E0TjFqaXpRdGROK1VTS0lZNTIzTGI5dG5XRlZH?=
 =?utf-8?B?c21iVC9rTDdDckZFYjlOOUdSdzUwWkEyamdNZXBudGFHMStmN1Fld2hOVTVI?=
 =?utf-8?B?bExZNExsSXp5dTdFRjBNL2o5c1ZyVEFoWVMzZkpVTlVPTEhjQjJ2eUdidVNH?=
 =?utf-8?B?QjhBaGwyWjJkTVVKQ2NleW9BU1UvU2RIL2lJNVg5MktOR084cHNyMHZaREpI?=
 =?utf-8?B?b3ZpZUJ3Yk9lbDNpdmo4UmhLM3BuVUtGMmw0ZG0ycWQzbXR5Z2hoSktmRGUz?=
 =?utf-8?B?Tzh6M1VIRHBBcnRJR2hDZlI0emZ1RTBmRDNlWXlBQVNnb0xjcGFVZkZmSDh1?=
 =?utf-8?B?Ky9mVmJKSm5ENDc3OGJiUW0vU2FwZlY4ZmV6ek9JT0tWNk1zeTc3M1ZHSTVN?=
 =?utf-8?Q?DEOsV2aBLKlpHCs4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d3ed68-6c9d-47d5-af10-08da2911ec5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2022 12:23:38.2401
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dSRVRqvWgMfC92Xz4fpFcyosW7IY5o+iaCU2do/YxIoRIrmy70A7Yj6BybgjPdonghtq+oI8IjudjaY1vbqdyzdMw5auHtHbrnZ3EVZxMQc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7431
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggNS82XSBjbGs6IHJlbmVzYXM6IHI5YTA3ZzA0MzogQWRkIE9TVE0gY2xvY2sgYW5kIHJl
c2V0DQo+IGVudHJpZXMNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBNb24sIEFwciAyNSwgMjAy
MiBhdCAxMTo1MyBBTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdy
b3RlOg0KPiA+IEFkZCBPU1RNezAsMSwyfSBjbG9jayBhbmQgcmVzZXQgZW50cmllcyB0byBDUEcg
ZHJpdmVyLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJw
LnJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0g
YS9kcml2ZXJzL2Nsay9yZW5lc2FzL3I5YTA3ZzA0My1jcGcuYw0KPiA+ICsrKyBiL2RyaXZlcnMv
Y2xrL3JlbmVzYXMvcjlhMDdnMDQzLWNwZy5jDQo+ID4gQEAgLTEyOSw2ICsxMjksMTIgQEAgc3Rh
dGljIHN0cnVjdCByemcybF9tb2RfY2xrIHI5YTA3ZzA0M19tb2RfY2xrc1tdID0NCj4gew0KPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHg1MmMsIDApLA0KPiA+ICAgICAgICAg
REVGX01PRCgiZG1hY19wY2xrIiwgICAgUjlBMDdHMDQzX0RNQUNfUENMSywgQ0xLX1AxX0RJVjIs
DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDUyYywgMSksDQo+ID4gKyAg
ICAgICBERUZfTU9EKCJvc3RtMCIsICAgICAgICBSOUEwN0cwNDNfT1NUTTBfUENMSywgUjlBMDdH
MDQzX0NMS19QMCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4NTM0LCAw
KSwNCj4gPiArICAgICAgIERFRl9NT0QoIm9zdG0xIiwgICAgICAgIFI5QTA3RzA0M19PU1RNMV9Q
Q0xLLCBSOUEwN0cwNDNfQ0xLX1AwLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgMHg1MzQsIDEpLA0KPiA+ICsgICAgICAgREVGX01PRCgib3N0bTIiLCAgICAgICAgUjlBMDdH
MDQzX09TVE0yX1BDTEssIFI5QTA3RzA0M19DTEtfUDAsDQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAweDUzNCwgMiksDQo+IA0KPiBEbyB5b3UgbWluZCBpZiBJIGNoYW5nZSB0
aGUgY2xvY2sgbmFtZXMgdG8gIm9zdG1bMDEyX3BjbGsiDQo+IHdoaWxlIGFwcGx5aW5nLCBmb3Ig
Y29uc2lzdGVuY3kgd2l0aCByOWEwN2cwNDQtY3BnLmMuDQoNClRoYW5rcywgT2sgZm9yIG1lLg0K
DQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4g
PGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPiBpLmUuIHdpbGwgcXVldWUNCj4gaW4gcmVuZXNhcy1j
bGstZm9yLXY1LjE5Lg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRo
ZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5v
cmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxl
LCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLg0KPiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBqb3Vy
bmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcNCj4gbGlrZSB0aGF0
Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
