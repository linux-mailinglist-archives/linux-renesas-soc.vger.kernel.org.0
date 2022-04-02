Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3C574F05AE
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Apr 2022 21:05:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231646AbiDBTHT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 2 Apr 2022 15:07:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbiDBTHS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 2 Apr 2022 15:07:18 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2137.outbound.protection.outlook.com [40.107.114.137])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2BF738D84;
        Sat,  2 Apr 2022 12:05:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AROmhXPzXPFlFvo/KcxZAP3KN8YpmXyVul55CoeaRoJ7gBRUUqbwbRgXELL8fqkneI9xpeebjK8uwHfC0RgVgEVWwV5r9d9xHay5uW7nTBKvcCRhmqGFjAozuHXDSxCBdcqJ71qdc/9xPaGRyPzBVR4BujBK6q7O5EqW6SaBhnE5B6DzXMeu75VlAu6BhT9UF+r+wUOCv0ZSza4cI2BK/FnPfj1G91vJ7Ey0p1gd2Uwk6SFNs/prZhAiQmxQjsK5iJfYChTrk0rHm6837kxev+vXl19m7+KrGqTWxfBzjQGNfIFNNLsYNvZBM3lxX3IGWJjPNtogeNNPu8+M4C5w1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CRn+PEnftDMgpTMVQv1ztgVd4K5SVGq8LXCe5vWUGgU=;
 b=Bn+BRC9/6lzKjY+EkZ86Rnj2aa4Cn8DvquZ+p5dT6k5wN31pDxfvYS+1PoMTnkuWPDtMtsqRRhqgYac/2h/N0xPd82ZLSLaZR8w1D1cyo9KnRYCP5lqx6o5AW4D2mZaEMo1+o0ef6+Z94A4xA/7+BCrEuwUO1efYWhSgu4WYV/UeTYVle8st9zPu6wGUH8j8nL/LsPIdOFTxm/vTELGAEH+crkiwqNgLHCREkkMvcP+i026V/h+WhQwuqPU2Avculr3ofTi5izeInFnYPSpGQ2Zdm6B27QQ8Gcu4EWJFStxMAmGRhDvcbPBQef//1VBNF7A5f9Ee8ImZ1mOoUH/kFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRn+PEnftDMgpTMVQv1ztgVd4K5SVGq8LXCe5vWUGgU=;
 b=tH9LpOEacLFmbX2h1yTjkFFPofZp5Si4Z2MLMv3gtVaTT0eGaCUy8Q2ctckmDnHuVao8OGP3Yn/eVI/xLZoC36RIhYwYAG6+saOZGAjMkVo7uR7LlQiyCyCBijKdsDrb81UBFgL/1lRTKqaE4weQzgBlCn1aR7m+IqMPvRilFok=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB5998.jpnprd01.prod.outlook.com (2603:1096:400:60::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.23; Sat, 2 Apr
 2022 19:05:21 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::7ccd:4eb0:e2ae:fca8]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::7ccd:4eb0:e2ae:fca8%3]) with mapi id 15.20.5123.030; Sat, 2 Apr 2022
 19:05:21 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v4 1/5] dt-bindings: arm: renesas: Document Renesas
 RZ/G2UL SMARC EVK
Thread-Topic: [PATCH v4 1/5] dt-bindings: arm: renesas: Document Renesas
 RZ/G2UL SMARC EVK
Thread-Index: AQHYRmPV/EWVE3M8n0+qBjpsuXfV0azc0uuAgAAmAPA=
Date:   Sat, 2 Apr 2022 19:05:20 +0000
Message-ID: <OS0PR01MB5922B49ED5DADA5DD3DDA60786E39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220402073234.24625-1-biju.das.jz@bp.renesas.com>
 <cf7728fd-b5c8-cd3d-6074-d27f38f86545@linaro.org>
In-Reply-To: <cf7728fd-b5c8-cd3d-6074-d27f38f86545@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 833ed7c0-5095-4c04-236e-08da14dbbbfd
x-ms-traffictypediagnostic: TYCPR01MB5998:EE_
x-microsoft-antispam-prvs: <TYCPR01MB59983193B70C7DFACA52C07586E39@TYCPR01MB5998.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GIIkBwKVDKbQnMNDrFj/DSMFf+ZfsCPeW/0bZ49a1tXY/XBxwKYxVEz9KJxDg8mahElnCYFQ+ozjZDWL4RGZk9YxUD15p2IhfEuq6gw73kuAQ+iWoTopWOKxsaz5qqZ3OL56zR+CUbEhINHsspyo0qcvRRTZmwhaoQ1q0UN7Yv/Poc7ZpKE8DOIiFL5V+tqtZHSgvf24IYMPIplK/SQmJs3z2Fp4FeV0c2g6Bqlv/3Y0HH4l+dytpl4oHiSFAe6R7Vkt+AQwKdWkivTBriVao/c82wSVb4zmT8p1m2M21RgwhwBi+iN3buIK+h3NLLkcFDRnStEb0x0bFECLyyBbilWsP3TqJC6xzlOvBowf6iG9i0MU8ZHqk90JjfYmT4cnQW/ke/cPPhNaVZ3MAzebAhR/VCKFc6KiY3RJ6oVQfpOOj2gsw5arGNUK55CrOuXulBaID9agNkizKjbJcuIN42gbuhWprlnLsk94binUnjb3TI9TuSQogDJpHAm2t1ki5kRHbeq3qT4E/D+rHcT3HF+YpbF+HbTYfVnkw1CPbu3NvVsqLR2ExheTXC+C0ZKfSV4bVShkSSDkNlrPuVS3Te84LdHsde+sZhmUV27wIy1Iyhlj11ygIEVqov9aiZ3IGJ1vXJseYsRtsXRKF2/NyVAfgnjOoQ/6O1nPZOcn9DE+DjcCcxzQJvJak8miZZFE92JAcW2H01PKhk9R0TXp2A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(83380400001)(5660300002)(9686003)(53546011)(7696005)(2906002)(6506007)(33656002)(55016003)(66556008)(38100700002)(186003)(110136005)(122000001)(64756008)(86362001)(71200400001)(52536014)(66946007)(66476007)(107886003)(54906003)(26005)(316002)(4326008)(76116006)(38070700005)(8936002)(8676002)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eUpiWjJsenlqU0k0YWpubFZIR3N4c3Q3S2VCV1p5RFUvYkZWZldkM0dOSVAw?=
 =?utf-8?B?ckgvbWozWDdkWGtWOTg2Zm5ldy9JQnpoVW10TzlPT0JDVEFQb2ZmbElibnB3?=
 =?utf-8?B?dlFBcXE3U3V4Ujl3TnNmRXdHTHZvZDk0SFJUUTJvckdsMW5SSDJ3cGp0Q2R4?=
 =?utf-8?B?dWNZV0ZJVk1TYjJkS0h0SXNTU1JNZlBjcDc1MVhPRGZjWjI5a3dUeU9GRGdN?=
 =?utf-8?B?UmNJdmUrTkYwQ3hadm5OS0g2WEkrS2FUaGRmTDB0ZFdUZ0J5Lys0dnVCT093?=
 =?utf-8?B?Q2s5SkZJTVNtRE0yY2FzNGhpc1NpK2tOV3lIUjNqTFY5elNXR1AzRlpETUJp?=
 =?utf-8?B?aDVlNms3czFlK3NJckJXVENBZElEQmFEbExHOUV3YlhLTTF5MjF6b3kvUitW?=
 =?utf-8?B?SDlDUFcxQTQ2K3NSWGdLK1JpYVZTemNmRDhDOStpbXhXcmZISExCQXpaMkdt?=
 =?utf-8?B?VGdHYWp4STFxangxTmJRTEQ1Qjd6ZjdTOFNSUTNDYXNxdkNSaXg5QlhNR2tU?=
 =?utf-8?B?NU1MZy9TVVNDM2IrL2dqeEY3aEdVQmw4Yk45R1d1OHRNQzdXeHFNdXZqRmZX?=
 =?utf-8?B?dG1pTTNSTytLUzRKbzVWalMydVBMbEhZYzhaWUtOTnFnQkU3SnNkSFdTaXQw?=
 =?utf-8?B?VDdLc2N2bENQRVhJdi81a3N0YUxTVTI5dTZkeFVRY0svWkpTRDVGQ0h4aEFC?=
 =?utf-8?B?bE50c0pzRTlBQ0hSREE3RUVuc09CYksyeGYvOHdSRmZoQXAxS05mZWlibG82?=
 =?utf-8?B?WklFQ1lDM1Z0Szg4ZkJVcHhncUlLa082aHNieDFkUDNMcVhOY0xiTVFGbVV4?=
 =?utf-8?B?U0cwMzlQMzlidk13OW9YZUpHTW92elhPRkZMOHlIK0hsM3RoUlpqa0lWR0xm?=
 =?utf-8?B?MkdIZCtMRzRQeE5sSUdxQ2t3MHZtUDN5Z1BwN3Q5elVuZjR2QllHQzl2YjM3?=
 =?utf-8?B?Y216UzZwVlNFbFkyd0Q2dTgxbnBEeHE0N0svaG12Q2N2bVdVKzdtSkFGUWxs?=
 =?utf-8?B?ckEzdjdvdkR4R3FTSDhTQ0M3MGlHaEpPclJuM0NvN2pMM3JPYUpaSTZTSEc1?=
 =?utf-8?B?Yk95Y3MxNERtVHlSTW1vM3ZoMTJoclorc1FBWVlELzh5WXp1cVZWVjk3cWRW?=
 =?utf-8?B?T1l4dERLZXNOK2p4UjQ1YUJRWllPTFRJMnBpNUpOeVJ4bS9mNGxiaG9xdzNL?=
 =?utf-8?B?Ky8xRWNPODNtN3RINDFVWElZZUdHYkptM1lFLzkzT1l3bS81RFdhS1d2WkY4?=
 =?utf-8?B?bUZqRHM0Wld4OUx0d0toYTFYdDZUcXdZUnMvNURod3QvVmxCcWJhNW83OEhN?=
 =?utf-8?B?NnA4c0hxb3JMZGxCZ1dXeVp5L3JZVDJ4QVVPUGtPWEwxKzN3aVJSUTBqb0J4?=
 =?utf-8?B?M2lUUjQvWURkTjZ2L1ovMkN1eWovRkhoQ3FDbWFPQjNSQXYzQkR5dmNXUHRw?=
 =?utf-8?B?cmIzYzVMYlhsS25yMkRINVE5UVFsY3hzQTdGOFYyOWtqKzJwQ3ZZdm10M0RL?=
 =?utf-8?B?RFNqakh0emthVHFweXAzcVlmRWZ0R0dDUnJTaDNEOWxHZXhDTndRRDU2a3ov?=
 =?utf-8?B?Yno2ZHQxZUdMaHA3UVdMT2YyN0NpRVA5NXV3Y0lXR3hmZW1FSmNQbXJjMWFP?=
 =?utf-8?B?WFhMODdJWVo2ZVBrVkJ3QS92enJVekUwc2NTU3VEQkRvQi9ORWIwY1JYS216?=
 =?utf-8?B?c2lWL0VxRU9xeWljS1B0M045YkMrWStaZEFkYnJTTk1PRUlxS0labllQSUFE?=
 =?utf-8?B?VVFDQnVKMXNuZERZUkdjVmc2MTZwK1kzdnd2Y1JIV3ViOTJoOGtTWFlwdGFs?=
 =?utf-8?B?K1ZyeVVRc0owbkZDUzNMYnhoR1lLOGFacjJMMU1KdXI3eGkyYndieE5aS0JF?=
 =?utf-8?B?K3VTZ3NmTFE4aVRSQmY1Z3ZHdEoyc1FxN09MRFptSVRCdkFlQzZRMWNBVUxa?=
 =?utf-8?B?QnVheDVqeUFGYVFReG1ZV3gwOUQvdTM1NTBwR0NMMGhySHBZZ0VDbm1kazJR?=
 =?utf-8?B?S0dWeW9PQlAxeVVnWnA0dm42OXdqTmhrdUdOQklXUmZqMDJQdkQxc0ZNUWVH?=
 =?utf-8?B?a1pZRnNZTlpDWHhRWnMzek91VXpSMGt0ME1vUno0NUx5L1hqOUJEcUVpQjl2?=
 =?utf-8?B?aHdaMmh1TXlESWVkSzFBMzZhNjl3ZWNkM2dTNDFQK2p1N1VNMXg5bGJJMTNJ?=
 =?utf-8?B?UTJkWllkQ21yZEVvZmczaXdiRThJeWRqb0orL2JUZWtqUloxNTYvdENib2VF?=
 =?utf-8?B?b2JmZmxodzc5NzNna3BQR0ZFbTRPc2FqZGJBRDkrbTIxYXRUcDdXVWErL1Zv?=
 =?utf-8?B?SnJBai9KbktzbWYweExuTlo1M0lzNU5kSEEzOVEzS2JpY1NET0lHd0daUnBG?=
 =?utf-8?Q?E3V9EvL1SIKsQhXE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 833ed7c0-5095-4c04-236e-08da14dbbbfd
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2022 19:05:20.9418
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iw7FkzLedXjOMUdF9Gqd0TpXYBvdau63P73j6GdxqqVDFHV54Q4T8SDxnoBse8JgTHE1hokYNR9LzApSmR/TyF28+S7HEjawt6h1mUb9uqk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5998
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4g
U3ViamVjdDogUmU6IFtQQVRDSCB2NCAxLzVdIGR0LWJpbmRpbmdzOiBhcm06IHJlbmVzYXM6IERv
Y3VtZW50IFJlbmVzYXMNCj4gUlovRzJVTCBTTUFSQyBFVksNCj4gDQo+IE9uIDAyLzA0LzIwMjIg
MDk6MzIsIEJpanUgRGFzIHdyb3RlOg0KPiA+IERvY3VtZW50IHRoZSBSZW5lc2FzIFNNQVJDIEVW
SyBib2FyZCB3aGljaCBpcyBiYXNlZCBvbiB0aGUgUmVuZXNhcw0KPiA+IFJaL0cyVUwgVHlwZS0x
IChSOUEwN0cwNDNVMTEpIFNvQy4gIFRoZSBTTUFSQyBFVksgY29uc2lzdHMgb2YgYW4NCj4gPiBS
Wi9HMlVMIFR5cGUtMSBTb00gbW9kdWxlIGFuZCBhIFNNQVJDIGNhcnJpZXIgYm9hcmQuICBUaGUg
U29NIG1vZHVsZQ0KPiA+IHNpdHMgb24gdG9wIG9mIHRoZSBjYXJyaWVyIGJvYXJkLg0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0K
PiA+IC0tLQ0KPiA+IFY0Og0KPiA+ICogbmV3IHBhdGNoDQo+ID4gLS0tDQo+ID4gIERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcmVuZXNhcy55YW1sIHwgMiArKw0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9yZW5lc2FzLnlhbWwNCj4gPiBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcmVuZXNhcy55YW1sDQo+ID4gaW5k
ZXggZmE0MzVkNmZkYTc3Li5mNjE4MDcxMDM4NjcgMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9yZW5lc2FzLnlhbWwNCj4gPiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3JlbmVzYXMueWFtbA0KPiA+IEBAIC00
MDUsNiArNDA1LDggQEAgcHJvcGVydGllczoNCj4gPg0KPiA+ICAgICAgICAtIGRlc2NyaXB0aW9u
OiBSWi9HMlVMIChSOUEwN0cwNDMpDQo+ID4gICAgICAgICAgaXRlbXM6DQo+ID4gKyAgICAgICAg
ICAtIGVudW06DQo+ID4gKyAgICAgICAgICAgICAgLSByZW5lc2FzLHNtYXJjLWV2ayAjIFNNQVJD
IEVWSw0KPiANCj4gSSBzZWUgeW91IGFyZSB1c2luZyBzYW1lIGNvbXBhdGlibGUgZm9yIGRpZmZl
cmVudCBjb25maWd1cmF0aW9ucy4gSSB0aGluaw0KPiBpdCBzaG91bGQgYmUgcmF0aGVyIGEgc3Bl
Y2lmaWMgY29tcGF0aWJsZSAoZS5nLg0KPiByZW5lc2FzLHNtYXJjLWV2ay1yOWEwN2cwNDMpLiBJ
dCdzIHRoZSBtb3N0IGRldGFpbGVkIGNvbXBhdGlibGUsIHNvIHRoZQ0KPiB1c2VyIGlzIGV4cGVj
dGVkIHRvIGNoZWNrIGl0IGFuZCBoYXZlIHRoZSBhbnN3ZXIgYWJvdXQgc3BlY2lmaWMgYm9hcmQu
DQo+IEhlcmUgaXQgd29uJ3Qgd29yayAtIHlvdSBoYXZlIHRocmVlIGRpZmZlcmVudCBjb25maWd1
cmF0aW9ucyB3aXRoIHRoZQ0KPiBzYW1lLCBtb3N0IHNwZWNpZmljIGNvbXBhdGlibGUuDQoNClNN
QVJDLUVWSyBpcyBjb21tb24gdG8gUlovRzJMKFI5QTA3RzA0NEwpLCBSWi9HMkxDKFI5QTA3RzA0
NEMpICwgUlovVjJMKFI5QTA3RzA1NEwpLA0KUlovRzJVTCBUeXBlLTEocjlhMDdnMDQzdTExKSBh
bmQgUlovRml2ZShyOWEwN2cwNDNmKSBTb0Mncy4NCg0KRm9yIGNvbnNpc3RlbmN5IEkgaGF2ZSBt
YWRlIHNpbWlsYXIgY2hhbmdlLiBTbyB5b3UgcmVjb21tZW5kIHRvIGNoYW5nZQ0KT3RoZXIgU29D
J3MgYXMgd2VsbD8NCg0KU01BUkMtRVZLIGlzIGNvbW1vbiBjYXJyaWVyIGJvYXJkIGFuZCBXZSBo
YXZlIGEgU29NIG1vZHVsZSB3aGljaCBjb250YWlucyBTb0MuDQoNClI5QTA3RzA0MyBpcyBnZW5l
cmljIGNvbXBhdGlibGUgZm9yIFJaL0cyVUwgYXJtIGJhc2VkIFNvQyBhbmQgUlovRml2ZSBSSVND
DQpCYXNlZCBTb0MuDQoNCkRvIEkgbWlzcyBhbnkgdGhpbmcgY29tcGFyZWQgdG8gb3RoZXIgZXhp
c3RpbmcgIHJlbmVzYXMgU29DJ3MsIHBsZWFzZSBsZXQgbWUga25vdy4NCg0KQ2hlZXJzLA0KQmlq
dQ0K
