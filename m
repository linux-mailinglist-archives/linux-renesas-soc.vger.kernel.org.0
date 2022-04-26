Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2E485100A0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Apr 2022 16:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236826AbiDZOmT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Apr 2022 10:42:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235377AbiDZOmS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Apr 2022 10:42:18 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2118.outbound.protection.outlook.com [40.107.114.118])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99B7D1816AB;
        Tue, 26 Apr 2022 07:39:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kOGGZQwSjMEypoCP6OFUtzZOv3OAyS5V4Qnl4pnDO8Vvra9huMIfMJ6NFyrzQ/XcW0BX8jmG/multMeAtQZ3rF1T5UO3lOFjpKrNNArbAMn5Ii/jLzmmdXFO0dB8X9cMN8A5hRaQNFO2GiUAhy4otHHQtIq1kA7oCUzB9A6N9MYNWVjTim3DIt8yazKAnh2IJdAx6nkjZoNQAMFyRSyKtkaVRiSQtGD5QgD+CihYEqUxIucZsclVbuVg1x5BoZ2K2RdvZsu0DgtOZkKlAXYT5wR0Zr/m2NtpcjPC+jXLSo5nnIATemY32vz19maBKQg6v0FunXcwSmO/ngPtXIxoTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TPHYGtFFVrJR3nKz1EMTNmdLv8mthFsdqlZG+Pi+q1o=;
 b=PMU/d2zOlxEar43GJmUOSnU3Nah5oSq0GPa9FHFcl3PAbTX5R3GXxPgyGwt3daCZp583P4PZ0hFql00IWLBctddE9JPGl+11BbaST6+oXSinqXE08xGnTDyhKgQoaYeT9BxXUrJnE6inZy1ORtZabOWfPsEzHHxSUpfE+j9/SQCmYZS8YvET0ZYIxThLrxxEi2GqGdrfcGmHmC7IcelgKVe+7VzculVPfqj72q2BaH80qHEkcgxDckIcM//5WlJrjV5RAf11N8t3PfG0IN2O9dq2QvRcYbIUZdkgYaROx2yonfYUiJ7bafvg7rJ5NzVeCbTdafF6g8DPKiObd38PRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPHYGtFFVrJR3nKz1EMTNmdLv8mthFsdqlZG+Pi+q1o=;
 b=MOM7RG+gguRUokHIuZgDHTKMAPX1M3QRs0ZyBTEUSDxN7o6g41uPqRFQgDMH8D1duZ3TgJhEAUHq6lx0LtU7Mpp2w8Harb8FgSb0ZsRb1q0qKedEB5jbT+G21+U1XZQwimp3/V4dtBgocKRxE/ewHcWt+aKiPY6FPpqgt0oUa8E=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by OS0PR01MB6497.jpnprd01.prod.outlook.com (2603:1096:604:107::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Tue, 26 Apr
 2022 14:39:07 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244%6]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 14:39:07 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: RE: [PATCH v2 04/13] dt-bindings: clock: renesas,rzg2l: Document
 RZ/V2M SoC
Thread-Topic: [PATCH v2 04/13] dt-bindings: clock: renesas,rzg2l: Document
 RZ/V2M SoC
Thread-Index: AQHYREydkOTFJ27Kn0y2WkqHTMVuo60CaTAAgAAEEhA=
Date:   Tue, 26 Apr 2022 14:39:07 +0000
Message-ID: <TYYPR01MB7086454DB14FF78DD09EAB7DF5FB9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220330154024.112270-1-phil.edworthy@renesas.com>
 <20220330154024.112270-5-phil.edworthy@renesas.com>
 <CAMuHMdWErGQuE+ESi3ZGVgyW5ouUthr5XsmnwLJD0VX6D3QVPA@mail.gmail.com>
In-Reply-To: <CAMuHMdWErGQuE+ESi3ZGVgyW5ouUthr5XsmnwLJD0VX6D3QVPA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e8ecf089-0aad-4ff1-d06e-08da279284cb
x-ms-traffictypediagnostic: OS0PR01MB6497:EE_
x-microsoft-antispam-prvs: <OS0PR01MB6497CD990A4BC1A81A72DC73F5FB9@OS0PR01MB6497.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xeagAXs0QjRCkgAfLZuMHXdsgcNL33W6Fbr6MV6WUv/HcSBujCNB7vW/Chzsz9TPujPCKAv7xBRPH6y9IqzQIg292DS2EuBs7ZsIKPvdjPwk384mK3MNUVedWCsJawzd/06GZhnbOLkyZzyd1vFlw17j3VLRjzCQ/NYKwNavImHC0w2uItAq/hpDgXBi6+ILwMtFLgS7q4xiwde/OIIcuWKc42uj4pJ3zCXd6gv+rZxdvUJB2L2eKY0fDgUxmwovIQ9eDKy+6s39SYvamcrXW4zyX4HWXKaocikx63R69CjtKXDtEg/mYgqGEN9gt/vh9nvbioPOAGkQlcQu8NZcT6p4mbRL/SdogJYKfaqBxRbsDXLSoOwwMAuMOwZPHzBLGqpp9NKTupvCMCHC52ifkgEkBu221029oVmXr7l09ld3A3qI/NikRwEOd//epBc+8xtAG19AHxfa2/f+x1xm6P0Ze+o9a8K2qbRHW1xw5gSkMcHTKGNmjpcg9hnRTG3q9PhaOE1dGONaZ9PzgDJl38gq1tT3yt+TYE52bFdyrVaI/r70httZ30Spw9cDZ5Ye0qHVA406NhJ7nKXrrvUx0L7i4YhFn7u9m7ufypK0LdkRxfx1rOzkzpegDFKQdaAcn2BPeM6xTcilnfrl+13OfTBIuoVFnBqgn4J4cBtP/KZ0/80loJc0BdEDi1pa6TeaZqao33EFjCF3k3dBZAmxWg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(64756008)(38070700005)(38100700002)(66556008)(53546011)(66476007)(26005)(83380400001)(6506007)(33656002)(186003)(9686003)(7696005)(508600001)(54906003)(4744005)(76116006)(66946007)(66446008)(2906002)(44832011)(71200400001)(5660300002)(55016003)(8936002)(8676002)(6916009)(52536014)(122000001)(316002)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aHAxNlphY3dSSmM5dzR3M1NYakZUQWtXeGpaOHIxam44WkxhSjlkQXJxYi90?=
 =?utf-8?B?QzA1bkluVzc0QmQ3a0dmWlM1WFBFSkp4ZmREOWt1azl5bnJhUlpDSkFYWlc2?=
 =?utf-8?B?QVVpa05zRzRRVDZmOCs0bkZYbjhsQk9ONlcwYi9HQ2NLaWszcHdwVVhhaVUw?=
 =?utf-8?B?UE1nZExKZ3FJRll0bG12dDAzb0ZsUUhqNWo5ZlluRGliSVlpZnhURjNjR2RP?=
 =?utf-8?B?S3pINjVyZTJlekk4a3EvblB5V2F6YnpnelNWRlRVUHNseS8zYWQ0bVVadTc3?=
 =?utf-8?B?cnV6a01JeFMzM3BpVlNyS2pHQWEvRG5mYW9BSW1lb1RzNFY5N1dTZDQvOWh1?=
 =?utf-8?B?UnR0WWpwenhabm5HU2psbDNNOFFJNit2MS9qN3ZaenFCZ2tsZWFmdlV4bVVC?=
 =?utf-8?B?eE90akN2Z01HM2ZRaStuU2VNczJZSkNSaXpjZXZKSmh6WXAzajFmckF4SU4y?=
 =?utf-8?B?ZjNSVG1tL3ZDaWF4N0cwSnc0cEJpR3pDaHpjUnVDcFZFQ2JMZ0VkdmV3QWh2?=
 =?utf-8?B?MGtLZjZJK0g2Q3NPNGE0WHR5OG81YmM3Q0VhaWFVQzJ3TmVOYktpYnUwNHVI?=
 =?utf-8?B?d0h6eWNxcS9SMnN2V1dITHV4R3FoWFpuWWZrR3VVSC85a1drVjQyY0JYRjVP?=
 =?utf-8?B?Z01BYkVUMjdoM2docG1KdkovWDhQZGQ5YzRWMFVtN3dYRWUxNGNkdlJhaDcw?=
 =?utf-8?B?M1QyU1BRR0tWY01HaDBkRHpXbkVuN3B3R0R3cCt1TEVtdjVTOWQvQjRrbUs0?=
 =?utf-8?B?VTVRRVhjMFRNcXVJSWxLVnltaVNINXJDdVpldUxMdWZQNENaZmduRVI0elY4?=
 =?utf-8?B?emJsTzlqb2NIclc3YUF0MEhHUmpDU3RxRS9ydFZQL25UNWJmaE5VRFBXT0pG?=
 =?utf-8?B?UE9CK2VYaXNiV1JKa2NuaTNYWXBWNXZpTmNYdGFXZDFGYTU5VUxkYjREOWlU?=
 =?utf-8?B?VHc1NWR1Y2F3YmM2S0hYQ3hFbnpLLzA2eEw3TTA1OGROMGhFVTdFNVJnVlQy?=
 =?utf-8?B?dkNsb3k1N0xDNWgxNk9yTzJYR2dERkkrajJBWjVzL3FsZzRvRlVhUEhJZ3Jm?=
 =?utf-8?B?NXZYYkpwUFoxSGk5cFNjSGExaGwrT3ozQmhJSjdmV2tYdUpvY0ozaFUzbkJN?=
 =?utf-8?B?aWl6L2c1a2h5clNRM3RGUzZ6U3BEdUYzcmJkcTllUG5rNmtpTnVTSXBneGt5?=
 =?utf-8?B?eHVZdTQ1NDNhUVFjeGM5QU15ZjdsajUrWWdmUXE5MWZRMk5QRzY3RTVZSnRT?=
 =?utf-8?B?cVVvaUM0THNFOFBjand6c3VYaWdCYjI3SS9CMDlma1VHQU5FeTdXVGlCZEhv?=
 =?utf-8?B?cjFWYUxXODkvNnpiVXVSalhaMzRIeHhUVWhpUmFnanBxVXJoTklWVVpxTUYz?=
 =?utf-8?B?bUZYZG9ZMFdBblpsbnVRRkRScDBVZlhHbHJrNnFuUDNyckoreFhyMzBmUWps?=
 =?utf-8?B?MFJuRlh5NUp5U3hwdHpFMTZ0a1ZkRWV4cU5CQnNqdDNCdENIQm5ZN09RRlVn?=
 =?utf-8?B?Q0NiUzd2dWRxb1pxY29LSElmMEJ3MGVWM0xoRVUyL3ZNMGtHeTRRYjQrUGJZ?=
 =?utf-8?B?RkNKOFI0WU1oZ09NVTZZd0IwUGJBTksxTGQ1Qkg0a0Q4WHhPRjRnc3ZvMTlL?=
 =?utf-8?B?UGlUY3YwUjZoZkFYNnhoK0tTVTNUQWd0dlBGVFN0WWI3cHZyRzB4M1I3SVNB?=
 =?utf-8?B?d0ZHQlJUckJ2VFNYYktoSTlvMXBIWmZUaEcvOFBWNy85bmpFcUMyQkZWdVE4?=
 =?utf-8?B?YTMzT1AxM2lRcllyU0RKM2ZZQm5LZ0lpUEM3UW9jb2VmVWoxNFJtb2xNaVZN?=
 =?utf-8?B?TjVBcGVTZUF3bVdKT3JlYzhpR2Q1YVg4R21PSG1BeDh5MWQ4d3dHa0pBQXk1?=
 =?utf-8?B?WmJlWkh5V3l5b0JEMzJCVlcyZnhVV2pjaGljUzd2UWlhNkJIVG1Lc1YzYWVV?=
 =?utf-8?B?N0VIc2k1THNiZEpIKzQ3Rnl2bit0anVLUUh0SkVEdXQ2WnNQTHB4QmxJdkds?=
 =?utf-8?B?R0poMnpaYWxHY2ZwSXlVOUkrb2tqS25TbXlvQmxML3RIcGVXVnFTZ2RPNDFJ?=
 =?utf-8?B?WlZ4SDRFS2VvTTBUTnVJdld6NFFZVkl0OE5EcVhyZXFNZjVISk5OYkgyQTZB?=
 =?utf-8?B?Qk94WTh0SkFhWHM2UWR2akdYMEJrczRrTURjUkJUNm16VFBXU3lqOWdkeUdJ?=
 =?utf-8?B?bHBxQXJ1UkVCZVJ1d24yNS94aVp4bXBtek9TblUxMS91VmtUZW41SGhlSXk3?=
 =?utf-8?B?WTkwYVBJRjBydjVJdHJWN2Y3bjdET04xbTVvQnE5c3NHbHFJV3A5RTZmMGRv?=
 =?utf-8?B?VTdQWURQRnpjSzdiTERtMGpwOWp5ZXprdVFCRGZJaXpiN1kxM0ZjNzcvbnFu?=
 =?utf-8?Q?ve/R077oa30A9gKc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ecf089-0aad-4ff1-d06e-08da279284cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2022 14:39:07.2536
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VL8Int/rh21Ux1MEZIJEOtbSUh8azLB9infPGG1WBBTknc77ZgWRuLA887ujf1KnFKaC4eQv1RUAsKcmmY6Fs5PsrS11pwYPc7GDNXgRftY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6497
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCk9uIDI2IEFwcmlsIDIwMjIgMTU6MjENCj4gT24gV2VkLCBNYXIgMzAsIDIw
MjIgYXQgNTo0MSBQTSBQaGlsIEVkd29ydGh5IHdyb3RlOg0KPiA+IERvY3VtZW50IHRoZSBkZXZp
Y2UgdHJlZSBiaW5kaW5nIGZvciB0aGUgUmVuZXNhcyBSWi9WMk0gKHI5YTA5ZzAxMSkgU29DLg0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGhpbCBFZHdvcnRoeSA8cGhpbC5lZHdvcnRoeUByZW5l
c2FzLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVz
YXMuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5l
bC5vcmc+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9yZW5lc2FzLHJ6ZzJsLWNwZy55YW1s
DQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3JlbmVz
YXMscnpnMmwtY3BnLnlhbWwNCj4gPiBAQCAtNDIsOSArNDQsMTAgQEAgcHJvcGVydGllczoNCj4g
PiAgICAgIGRlc2NyaXB0aW9uOiB8DQo+ID4gICAgICAgIC0gRm9yIENQRyBjb3JlIGNsb2Nrcywg
dGhlIHR3byBjbG9jayBzcGVjaWZpZXIgY2VsbHMgbXVzdCBiZQ0KPiAiQ1BHX0NPUkUiDQo+ID4g
ICAgICAgICAgYW5kIGEgY29yZSBjbG9jayByZWZlcmVuY2UsIGFzIGRlZmluZWQgaW4NCj4gPiAt
ICAgICAgICA8ZHQtYmluZGluZ3MvY2xvY2svcjlhMDdnKi1jcGcuaD4NCj4gPiArICAgICAgICA8
ZHQtYmluZGluZ3MvY2xvY2svcjlhMDdnKi1jcGcuaD4gb3IgPGR0LQ0KPiBiaW5kaW5ncy9jbG9j
ay9yOWEwOWcwMTEtY3BnLmg+DQo+IA0KPiBJIGd1ZXNzIHdlIGNhbiBzaW1wbGlmeSB0byBkdC1i
aW5kaW5ncy9jbG9jay9yOWEwKi1jcGcuaD8NCldlIGNhbiwgaXQgd2FzIGp1c3QgdG8gZW5zdXJl
IHdlIGRvbid0IGV2ZXIgY2F0Y2ggYSBmaWxlIHJlbGF0ZWQNCnRvIHJ6L24xIChyOWEwNmcwMzIp
LiBIb3dldmVyLCByOWEwNmcwMzIgaGFzIC1zeXNjdHJsLmggc3VmZml4Lg0KDQpJJ20gZWFzeSBl
aXRoZXIgd2F5Li4uDQoNCg0KPiBUaGUgcmVzdCBMR1RNLCBzbw0KPiBSZXZpZXdlZC1ieTogR2Vl
cnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gDQpUaGFua3MhDQpQ
aGlsDQo=
