Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B34E6D00A7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Mar 2023 12:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231146AbjC3KGh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 Mar 2023 06:06:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbjC3KGg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Mar 2023 06:06:36 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2108.outbound.protection.outlook.com [40.107.113.108])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E76DA7DAF;
        Thu, 30 Mar 2023 03:06:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hhr94p6Naqg/ogkm+KnqjTrvUmKNAl1wSd1t9JSxvixJwm1VgX/5dS4Hj6NdiwrUjQLNod63z4K6CPyPqfRw2NQrNTA9dpWWB3Q5K/itW8B1KbmPO/YrsVvpIU2K+XQAS9q5CTnqpN+DrXs9w2kHJfEMw0VOk1PFH5XJzWdh46t9EhSl6uxq4oyqPH6k3qgzu/ydIp6kQpy5Ymi7y8LmaK93iB1G8lFYSwueEW4JGWjeHzruCDgW4kxdofEgkD8aK3D6+ssmB2yCtXfeB5JlNTcetsCmZuA67pASb+QL+v6VRLXXXaqp1h/wVRMYDqY5b6QpweWJL99qrOMj/PSl+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A8Sm1p7fdP5a1WRWAJC1Ud43Po0DaWdtQPd9BH2nyDQ=;
 b=m/rssmKnA/wxqyXxGUegacWobVIR8S8OT54A1O7u+SMs86N/fYn/J5aCxE7p4wfR/hBsPxp544M3q2RvSx5DIsqwlLXoEVplVjZ/axN39/ueySDKd8ShaeKii2N2Fj9bUSkJh/diWwqML5QxvPx2F7X1fr1Js60lfQLsmZtLkrjuKEGzp0+XxkO1TPIYKgJbyJf324yeOFbhOd+fAtlHowEK31iuPhO9QuKiwiqoQWrzhkDkBF4RHHTjevpx3i9Omq3RDWLGz4G8WrYzklkZFA0b/YNKKs8jfDWZmA4H3S+NeNSRyZW6FIJ1YD0H+FbJ1Ujxn1pMpFCK5MUDpiwm6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8Sm1p7fdP5a1WRWAJC1Ud43Po0DaWdtQPd9BH2nyDQ=;
 b=rhAX3Qh3RJ1VGMZW6GlMO7Ysefp/qVoLNOvaY2cUYqNf1gf1ACS82pck4c0NBrAMUglhcdeEM/RI+r88FoLqQZP+ksR9aSqoOxMt/id3BnKZYVBo9ttnMvlMznqrJZoth7508aUJ4Y2PIFNHT5LdQ8+T6tz1wlliTug0LRG1gIg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB10435.jpnprd01.prod.outlook.com (2603:1096:400:257::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Thu, 30 Mar
 2023 10:06:31 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::e521:994c:bb0e:9bf6]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::e521:994c:bb0e:9bf6%8]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 10:06:31 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v4 5/5] arm64: dts: renesas: r9a07g044: Enable sci0 node
 using dt overlay
Thread-Topic: [PATCH v4 5/5] arm64: dts: renesas: r9a07g044: Enable sci0 node
 using dt overlay
Thread-Index: AQHZW+sHE3gsMG+mr0u3ycGR0Y9ky68TJdKAgAAAttA=
Date:   Thu, 30 Mar 2023 10:06:30 +0000
Message-ID: <OS0PR01MB5922676B990423F678E216AA868E9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230321114753.75038-1-biju.das.jz@bp.renesas.com>
 <20230321114753.75038-6-biju.das.jz@bp.renesas.com>
 <CAMuHMdXvZKVFznf5tK_khH-pscf4J6iX2-05WbrsOZAgoaY45Q@mail.gmail.com>
In-Reply-To: <CAMuHMdXvZKVFznf5tK_khH-pscf4J6iX2-05WbrsOZAgoaY45Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB10435:EE_
x-ms-office365-filtering-correlation-id: ed89b942-24a2-4cdb-918d-08db31066f53
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Xtr/lLayrAh1xodGy/g2R0diTXin2+CuaMNR3Os3OkgAxw0D5RNMhBEBnr7F+lGNFQtIYEZr1Hzl8iLZWbKYmQnHYMjgG91/wknIVYQT/EO5ceOGMWZogu+Fs3v4R0WhxQrbWG+DvQPCe4A4/MQGNkHvzezY6nMinFJC5iRi0/KW3AAnzM/6c4BhDUDxQjPnioNQVLePCHJteOoUSQf4JHBrG+GENxgb+vBn0Lt1DKhuENxtEZ0ClzYwJIDnoyOP3jO78jyRpRO761ftvbXm/SNs299SdzfhVmS/Lo7etr5E+xee7vHRWRxxxNrkYUpBmnZacgxf3XasxdRageqHWhUktrIWJpVlxfIZKmfR5BeDxqNkL6J7gwolA3Pg5Xbxrk4XESadL1xIj0ufMF1X1YsFl7xK9PDgQTe1fb2brZhYG9Iir4H2JbitIiAItdBJyExQvsabpMt89S9UEPUYQaOoU2GUQMlXyS6XT6Hpp3dlYtt4mEfpRPmJBytlR6WClNbJpqRFfUHCx05oJ60/v3RMg0BmauNRzktwlGVX2ffC/F5W/sfNPdFBQ3yNVpobtSvBuZuahRERPR24vUuBRDTnrzW9KszgrhBxZa3ohkXUcpB9ttT0Kwgh17Q0+gw9
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(366004)(39860400002)(396003)(451199021)(33656002)(86362001)(55016003)(122000001)(52536014)(8936002)(38100700002)(5660300002)(8676002)(316002)(54906003)(478600001)(71200400001)(7696005)(4326008)(64756008)(6916009)(66556008)(41300700001)(66446008)(66476007)(66946007)(76116006)(83380400001)(186003)(38070700005)(107886003)(2906002)(9686003)(53546011)(26005)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YVlST09GZDlMclZMd0ZzQnBFZ1YxSDVha3Nhb0xOZEZxQmRoNjBROXN0b21z?=
 =?utf-8?B?L1p0dG5ETVU5QnM3QlBSRVBJNkNDNW1OR1R2U1FvMXhPeldsT056QzZZRjNL?=
 =?utf-8?B?aUpuWCtpRU9NelI2YTVsNVhNaWNKZ0RvMnNndllPYUg5c2RyRm5sMGUwMzAy?=
 =?utf-8?B?bGgzb3VJVWVteWlRak1CUG5ZWTFXLzNIenVXaUFNcDV5blFGSHBEUGtGN0hP?=
 =?utf-8?B?NHBHUGNvQ25DYkRQTThNMS8rQmlIcUV0L2JSNGRLaTdSc2JyNHhMRk5kVWVo?=
 =?utf-8?B?Wko1Z1FOZEtJQnVVM08wNTVkMERWY3JUNW1qMEdrNjM1M0o3VDBHWlJRaUxY?=
 =?utf-8?B?WDJXeGlPVWtNS0NxVlVxNVNuQWhGdFFSdVVkUFpxZmplN3UrUzdQa2JoaDRC?=
 =?utf-8?B?bkFSM0R6eGFNdTZTR0VUUXQ3a3ovL2tQeGE0elhpcHJrakM4ZzlLam54akFj?=
 =?utf-8?B?SVpSR2h6WmJPdnFMRHQvclBFaUh3QnlYTG56bmNrcW0rSzRlRTFZaFZRR2g0?=
 =?utf-8?B?RGl2SEZYaU82Yi9ERVd6Z2QxNDh5K1QwdExyZ0p2Q0lUWUZXNFltQklNQWMw?=
 =?utf-8?B?cVUxN2xJTjZid0dTQTl0ZWdYR2VEb1V1b2ZuUGh2cjJmS0tMTHNESm5uWTlL?=
 =?utf-8?B?ZVQvbDU4SVNLUEpwTkR6eTY2cFVheWFUUVUzYnpJc1lwQjUvZEdZbzhKaFlx?=
 =?utf-8?B?eVpVM0w1anVCMWNlT2dBRkEvQ1EvbFVKc1poL1RBMzhyUmRBdjBHS2VsTHdG?=
 =?utf-8?B?Smo2dExSeEJhcGJUSGp3bTR3VFJiaEdaK0VuN3lEeWkvS2M0RDNTZ0dablJE?=
 =?utf-8?B?NlNrWkdvSUFUcDFyaW9yMWNpRVptRVBIbDQ2TWJpWmdub3JSNmlPK0xhUEJO?=
 =?utf-8?B?NUIxeFJmN0xrSjRBdlBLaTBsb3c4QjRuZ3poem9nMkV3SGZHM2Y3cEtObFdS?=
 =?utf-8?B?c3I0SUpMbWFDUmVoaU5wUkM4QVpLYTdlOG8rai9FMjBZM1N5WHNrQkZkNXdK?=
 =?utf-8?B?c1NMNldlbVhIcmJjbXJyck1vcU81bWFKY2xxeDRBYlBBUDBYR2c4SXZyaEFJ?=
 =?utf-8?B?SFFQZHZNN0diUWdZQU01RUM0bWV4Sk5qQXd0VVV3WWFPK3R3RjVtMGwrUEpB?=
 =?utf-8?B?YVBhYTdQb1oxVGpzZDcvc2VZaCtQQmZ3TDBnNUdUVmNTKzV0TGVQRk1OdUVu?=
 =?utf-8?B?aEJOUHFtNWRWMTJOZHh0Rk1NNVVSTjRLWUtEczNxWk81cW5ST3Y5b00yeEE4?=
 =?utf-8?B?Nk9scjhNVGtJTXNYQ00rOHlCTEpnTEQrNkJWQ3dMNHl0L0ZWcS9kaEI2eG8x?=
 =?utf-8?B?THFNQ1B3cng5YVUrM3JYNTBuT091NEdVbnYvVEFXNnJrbmJSUUNwRFBGbTQv?=
 =?utf-8?B?WnEzWXBpbWRhVzFrUkllRSthNFR6R1BXNUhQYkxnb2MxRmpSSGwrVlY5K2k0?=
 =?utf-8?B?U3RyZW1yemk4TDlqTGRyMnpFNmhCMVBNa2pIMTBRS0tpbkNMWlhHY2FKUVFC?=
 =?utf-8?B?WEYrQXFGNGdGdmNLd045SWJZMnh2a0FmbjZBZXp0MWJERmUvZk5qeXk3dmlU?=
 =?utf-8?B?ZXo1UTUwaWcrS2ZPb1RxMlUrYXRGQ3ZwN3A5ZXJIWTZZUXhwYUhUcUNXb0Z6?=
 =?utf-8?B?UlM3SVp2MlBYMjhkRkpOK3BkcjUxYlJTYjdFRkhnYTl6TC9KRnFQck83MUNm?=
 =?utf-8?B?YjBPcFpaSHFCZzNXSUNsREpzMGhHeWFRUjJaZFJUallnM0VmTkpGZUUzVjZo?=
 =?utf-8?B?MTNxOURmb1VSM0ZzakxJcTEyZ05COXZadjFkWEI1WkhRdmU5cE9QU3lnVGZv?=
 =?utf-8?B?MUxGYnlvb0NySWluejZkUUlqODFxcFc1b3hUMmFhcFZmYW9qbENtbzRla3I3?=
 =?utf-8?B?a0JjZEx0UFc4ZVlkZm5HcHVvQ2c1ODVGalhRMXhkTEFoZWI5OGNHVWlrbGN5?=
 =?utf-8?B?eVgrbmk4bE15MFErTkZMT09GdTVpYXBFWnFVRi9XYXU1L2ppMWQyU0xoUVgw?=
 =?utf-8?B?TVNpU1hUbE1WamdIcXhFWkx0MktaT0NaMFpjMHFsZ3VBVXhrUE5Xa2FSTUpZ?=
 =?utf-8?B?UkFHNWlMTTU3RVd4bE8vRzl5bDFsOHp3YnFvRlZpNjRNWXFNUDRpRFVsTnpp?=
 =?utf-8?Q?nmkJiYAtstptlJTSWZn70qErk?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed89b942-24a2-4cdb-918d-08db31066f53
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2023 10:06:31.0095
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fi22kVEyq+PQlMlpxpE9i18FftpM4bBY0SIrNVzvna/jT8+jYd0vz7AAlK5fmyuaWCRmqxi7WE+NQSvxoAksBuna9aiqeogrrXDLE0jAX9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10435
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCA1LzVdIGFybTY0OiBkdHM6IHJl
bmVzYXM6IHI5YTA3ZzA0NDogRW5hYmxlIHNjaTAgbm9kZQ0KPiB1c2luZyBkdCBvdmVybGF5DQo+
IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVHVlLCBNYXIgMjEsIDIwMjMgYXQgMTI6NDjigK9QTSBC
aWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+IEVuYWJs
ZSBzY2kwIG5vZGUgdXNpbmcgZHQgb3ZlcmxheSBhbmQgZGlzYWJsZSBjYW57MCwxfS1zdGItaG9n
IG5vZGVzDQo+ID4gaW4gZHQgb3ZlcmxheSBhcyBpdHMgcGlucyBhcmUgc2hhcmVkIHdpdGggc2Np
MCBwaW5zLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJw
LnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+IHYzLT52NDoNCj4gPiAgKiBVcGRhdGVkIGNvbW1p
dCBoZWFkZXIgc2NpMCBub2Rlcy0+c2NpMCBub2RlDQo+ID4gICogUmVtb3ZlZCBQTU9EIFVTQlVB
UlQgcmVmZXJlbmNlIGFuZCBjb25uZWN0aW9uIGRldGFpbHMgYXMgdXNlciBjYW4NCj4gY29ubmVj
dA0KPiA+ICAgIGFueXRoaW5nIG9uIHRoYXQgUE1PRDEgcGlucy4NCj4gPiAgKiBSZW5hbWVkIHI5
YTA3ZzA0My1zbWFyYy5kdHNvLT5yOWEwN2cwNDMtc21hcmMtcG1vZC5kdHNvDQo+ID4gICogRHJv
cHBlZCB1bnVzZWQgaGVhZGVyIGZpbGUgZHQtYmluZGluZ3MvZ3Bpby9ncGlvLmgNCj4gDQo+IFRo
YW5rcyBmb3IgdGhlIHVwZGF0ZSENCj4gDQo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2
ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPiBpLmUuIHdpbGwgcXVldWUgaW4NCj4gcmVuZXNh
cy1kZXZlbCBmb3IgdjYuNC4NCj4gDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDMtc21hcmMtcG1vZC5kdHNvDQo+ID4gQEAg
LTAsMCArMSw0MiBAQA0KPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0K
PiA+ICsvKg0KPiA+ICsgKiBEZXZpY2UgVHJlZSBTb3VyY2UgZm9yIHRoZSBSWi97RzJVTCwgRml2
ZX0gU01BUkMgRVZLIFBNT0QgcGFydHMNCj4gPiArICoNCj4gPiArICogQ29weXJpZ2h0IChDKSAy
MDIzIFJlbmVzYXMgRWxlY3Ryb25pY3MgQ29ycC4NCj4gPiArICoNCj4gPiArICoNCj4gPiArICog
W0Nvbm5lY3Rpb25dDQo+ID4gKyAqDQo+ID4gKyAqIFNNQVJDIEVWSw0KPiA+ICsgKiArLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsNCj4gPiArICogfENONyAoUE1PRDEgUElOIEhFQURFUikg
ICAgICB8DQo+ID4gKyAqIHwgICBTQ0kwX1RYRCAgICAgICAgICBwaW43ICB8DQo+ID4gKyAqIHwg
ICBTQ0kwX1JYRCAgICAgICAgICBwaW44ICB8DQo+IA0KPiBJJ2xsIHJlLWFkZCBHbmQvVmNjIGZy
b20gdjMgd2hpbGUgYXBwbHlpbmcsIGFzIHRoaXMgaXMgdXNlZnVsIGluZm8gZm9yIHRoZQ0KPiB1
c2VyLg0KDQpUaGFuayB5b3UsDQpCaWp1DQo=
