Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39F196D59BA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Apr 2023 09:33:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbjDDHd1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Apr 2023 03:33:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233918AbjDDHdP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Apr 2023 03:33:15 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2139.outbound.protection.outlook.com [40.107.114.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEE41126
        for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Apr 2023 00:33:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQ+wtvsRoRawBh98OP3upATu/6Dvwobt3JvI0GTYPgc0nXnJq7LxFQqDHwrX+g61ReEsGeiwsWLRA8f13eHy7l1+8yCqxcCLXD6dF+1y2LHfH9TtMUIiliTTAB5ltz81mxj8pB5aCRysETBmdzTqmqgJtw5Q8zDPZkeSQ4h1H4PIX8LBXU30dtoNBtwbGj87XTTVzxWdU8YYhFwQztwjIYoe8WEXcGclbu501sgWgcjW7V9y57Iof2QlFNqFjEHAR1Pze8U3q8RwDil02L/76YNTkDhTB18f52egJFAAsl0BM7YjpKZU+6Lf4euA+zKswtG56CZkHO6d38km5cCtPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3xD+5o4YCmdr8x5/dzauIULIllSUor89qvH7CTjGGM=;
 b=eOXeVA5xFUfpNkehQjD9m9dKzg+cchvtaasjdvC14PKCuX+rB+8VqoQG3Zdb3SRArJRz3XUkReULfzJrHqs3erFxK2egwWJrDA2dSCGNv8+3MKC7v4+tz9gcnEaZjs1ns9jO0gT4dy+BOXJtX7YIdSCFaPEDUSxJ49CCNpMUe4JbRNw2nDvOF/Fo9SILsJBpIMr2iagCOnudvn7pMTfqhwEgv2VkdujpQPDOigxpuhN2rH8NCfG4WNRi12lObykHBKDrZYFi0dJDEMQGDbwweeH1qR0A2gNklHaDb4OCstxXYFF5ntz4/nu5izn0MFe5gvl8UFffzBYsjSYcBfBZlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3xD+5o4YCmdr8x5/dzauIULIllSUor89qvH7CTjGGM=;
 b=k0abt3zgf+6w0trEjeguVeKU+Mcuj+bjmF14zKTJD2S1hiWK6E4DvGiHl+eK2BGFT6sjKpft2wN3U4Q6H6/0B9eoqFhPckk3varLM2V2S6oW6360aopr9ZmoJEmZpNIZstmggDLtUm/ZMZVLtOnn5AqV1c3kt/1+tkqgs6BDdi8=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYWPR01MB8695.jpnprd01.prod.outlook.com
 (2603:1096:400:167::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 07:33:11 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::ffc4:2acc:f9ca:1633]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::ffc4:2acc:f9ca:1633%9]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 07:33:11 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 3/5] arm64: dts: renesas: r8a779g0: Add IPMMU nodes
Thread-Topic: [PATCH 3/5] arm64: dts: renesas: r8a779g0: Add IPMMU nodes
Thread-Index: AQHZLsrty1X1n3skEUyO5H8IuxS4Cq6uUFGQgGzeJ4CAAALMQA==
Date:   Tue, 4 Apr 2023 07:33:11 +0000
Message-ID: <TYBPR01MB5341EAD6E8FD50D88DED9420D8939@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20230123013448.1250991-1-yoshihiro.shimoda.uh@renesas.com>
 <20230123013448.1250991-4-yoshihiro.shimoda.uh@renesas.com>
 <TYBPR01MB5341A3746DE45EE185E546E2D8CE9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <CAMuHMdWDjVr3udYAkV=FigSVd1JYN4JR=CmhUUPHPp-PbqFpqQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWDjVr3udYAkV=FigSVd1JYN4JR=CmhUUPHPp-PbqFpqQ@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYWPR01MB8695:EE_
x-ms-office365-filtering-correlation-id: 892e5c67-f65b-4374-8d3e-08db34ded7f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VEDMBwtkUqe75fC+ArB05kloJYiOdnmpAeyuC9YdvvbGTZrqeYZKB1hOUrU7L0evuJD9Rjrh17Uo+AvacyuaM9nJuEZ+39mro0VkE7gNjijq/8K/Z4dVR9XMFr9sCCamhbxZtY6OqRYK+GFIweWyWWu6Vkj6wi0hyc1QiYnh/k3efvb42Kc1sdhCS5QV6Cd01GKgELon0SOKLdtMsCSijNw8r54Du61vWneJ6Ay33Ky89TaXuNwCAzA3Ggs9qr9Z2jOKZkLfM5kcDZrr0umGP+339nHpxEulR2AudduthdoCCgI1oTEDscJYke2pQS/5IxsRmcu2faIuSItwhfsicc5N/iUObSOepxvmtDCZKIxAlqUUpRIu0Gju7UKTKegAlJLH3p7VK2q1sqzzCmMWVDrbi697imhLO8nSxQCSSSKu+CnkcMXaropQQVYBrxl7uxUc4xn+QpTp5V7gXehX0/8ro/oQ6Z+qrPRH6jEXhst4NP9ZUhw2mS2frypE73CaM7FBsTksEORvgAKp9o169PWaYlnu92JXLgG/tSPsY9cjL3zduC2dpgUILXhxBe8+LMXzcrWMQaOxo5o0MufY+cUUAln7BK6Cm0iUERRlsyM/vemrgPPR+2YDr3Aqt0ZB
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(366004)(346002)(376002)(396003)(451199021)(86362001)(38100700002)(38070700005)(55016003)(33656002)(9686003)(6506007)(186003)(6916009)(4326008)(53546011)(5660300002)(8676002)(64756008)(66476007)(66556008)(66946007)(76116006)(66446008)(71200400001)(52536014)(41300700001)(8936002)(7696005)(478600001)(2906002)(54906003)(316002)(122000001)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cWlkblo4QkZ1U0ttMS92MERPMW5Cd2VLR1BTazJZTlIrOUlWSFdCMUdsbC94?=
 =?utf-8?B?aWRscXZQSC8yTEo3Nmh2RnJIUU1mSEM1cXpiQkpCSGtzZGs5b3pPU3NYRktG?=
 =?utf-8?B?TjQ2NXVROEd3cVh4cndBUGRSVDJRRlNVa1dMNGVmaDhQUkRCMUZlWThMTG0z?=
 =?utf-8?B?YlA3eFJJTnVFQWtDNjk2Szc4TVlQVmlLbHdOTnVZMEU3ckZndmFjbWYzY1U2?=
 =?utf-8?B?U0YxMFhXdThiV0xrem05Qk5zOENyQlhKR3FtaXhkV0N3ZTlNSStoZ2pMWXJN?=
 =?utf-8?B?a0l6QkNBYUhsaktOUi9yZWROTXBVZVE4d25yOHFJVmd3OGQxaUtWZUpiUEJL?=
 =?utf-8?B?WjFzSGNNSDFMZmhCZUlMMG9KTXpBc3lKWnFzcFJnWkI5MGh0UmoxS3R3MVN3?=
 =?utf-8?B?VXBUc2hvUUhwQVJlZERoM09NelQyVFhZdUg5bVVmVS9UdE5OcWtSOWlOTjM2?=
 =?utf-8?B?LzZHWG5uZUswWWJ6L1d5TTgrK3hna0o3SjM1RVRpTXJhcy9hNG9Nc2txRnlH?=
 =?utf-8?B?Y1hRVDhhdVVWUE1UZjVVMGhVZ01ORTNDd2tVKzlPRmVvSnpNTXk5cU5odldZ?=
 =?utf-8?B?ckdIWllSWk1mekdZdVVrY3oxZlk0VjZwWHhkWFdtOVRwSHBXUFFYNnY1VFln?=
 =?utf-8?B?VGhPNkZZS25lV3R2YjZaZ0JGYVZWMURiTUtMSzF4cFIraFEydWtRdjFaMzNZ?=
 =?utf-8?B?TnZoZ2FOT09UVkJ5VzBIak1CMzBTdGozWEZZbmhMdW42V3ByMkFHZy9tM3k3?=
 =?utf-8?B?ZzB1Qzg2dFpPckJHTGxSZHdINW54OGtTQUpNbE9rd3UyYnRyaUNaZUhNV0lY?=
 =?utf-8?B?SWR1Ryticnc2d0RpN0JKVnd3K1V1V0NRWVBwZVVMUXAzYmoxQzk5eGdhOVFP?=
 =?utf-8?B?YWNaQ0xHK0hQdzdaOCtBWlVnL3R4RE5iOGZhTnk2UVRHa1ErQklDeGJUL3hV?=
 =?utf-8?B?VnlwK2FaKzNjU01mSG9KVGJDRDZmK2VpODYrQU41bHFTa29BdVlDcmlheGs2?=
 =?utf-8?B?YXBqQ2E5WVNkbWU2cE5FdkllNHBmQVI3aXVrc1oySjNRNlgvVHFjRzRaU01G?=
 =?utf-8?B?U01KT1dSUk5YZkRUSE05QTQwL2lUQUE2YWlGM1hKWFhZWEZWMyt0UTlOMmxn?=
 =?utf-8?B?S25qYmdCblFPMkFvYitCWmlycnQ0Tjluc2RJWUNMQnNXd2hzT1BRZm0ydnNH?=
 =?utf-8?B?alBmbmdUM3Nnd29PdXErNjlyK1h0bFdIZVRpZFQ2Nlp1REh5RE11WTAvTEh6?=
 =?utf-8?B?RWJQZ3lkR1R5ekl2SXBEd3lXRmx6OXZtVWppY0owU2FYR21zNGVrZmZGNElG?=
 =?utf-8?B?VDVzK0QwbmhoQUdiYm14QTVHTnVKcDIrOW9DT0F3bnBNTE1FZXlsV2RNd1NC?=
 =?utf-8?B?Y3p5ZnhWcXNMNVJTOW92K1BvNVpoU3ltK0MzbVdNUzh5U24xZEQxUnU3RnU2?=
 =?utf-8?B?RkRUM2VHbVNpTVg0V2trS2Fub2g3UDJpTy9aYkt1dXdxOGhyYlUxMWpuS0c1?=
 =?utf-8?B?SWFwNzBzRExXbmxYY2F0dnZBZG5Nem90YnZYZzM2ZWFUVlR4UWZQWnNmNVBl?=
 =?utf-8?B?MzFtMjhBQ3V0a1Y0V1hReVd5OGRmQzV2WVlaTzlpYjN6MjB5ZFdlNExKb3dH?=
 =?utf-8?B?dFBvVW44eEdEeUIvM2F3WUdLMmwrN200RG9MQmVUL3ZvdUY4NEJlejRoVk9I?=
 =?utf-8?B?UTJsSWNnTWRsTnZyRmlESStIWEJKZnJvcXNhK3J1RUgzMWxydi90L0dwazdU?=
 =?utf-8?B?WlFGQU5Wb3hFV1I0Nkl3eU9TeFI1TmFJQTFUVjAzby9TSFh5RkdHY1A1Zi95?=
 =?utf-8?B?RTlBZFZLM1RGQXlkYWZwVUE2S3M0N0VwMDdkK0FtOG9JckFMNU9oTjFrZjBE?=
 =?utf-8?B?OTRkZG9MbTV4ZEVLZHRndjdmamJkcHYvZWlQZk4vRDlrdCt0cEJGS1NqaWgr?=
 =?utf-8?B?SGl3cG5vR0o1cXIrei93cmZuR3c4SG5vS2lVcUZNbTZ2Tmh0TThaL2cxZnE2?=
 =?utf-8?B?a1VwVnBINTJXK3NUZ2JJS0lxN1d3dHR4WXk1TUxxU1d2dzR2NlQ2cjdFNlp6?=
 =?utf-8?B?d3ZKN2FEMTJUaElKYm44dkQrZ3NmY3dyeStLNVRuMC9rVEh3NXpNY2dHK1FF?=
 =?utf-8?B?SERBcUo1MzBVamE5ZkxZbVJyTEtIb2IwcjdpVlREbVZtcmhqRWFsTDJncUNy?=
 =?utf-8?B?clJGTDNkSHNkdDFTc3pKWWNjNVJEbi9wdFlNam5oOTVwcUtEeitaUlRzVkln?=
 =?utf-8?B?bnM0Y051Ky84Qk5wTjBjYUVFTXl3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 892e5c67-f65b-4374-8d3e-08db34ded7f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2023 07:33:11.3065
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VUll8ko592hDmgPCEMINlEXsS4859T4HF7RR/t6VlfoYhaZoTAZNFA9/8emFeADhGb+bFMwX2+At++L+JQx6eqSZ/UAAy0dJ4T9w7+r6dxsa5QgDaC8OBS7p9OZ9TOmR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8695
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVHVlc2Rh
eSwgQXByaWwgNCwgMjAyMyA0OjIxIFBNDQo+IA0KPiBIaSBTaGltb2RhLXNhbiwNCj4gDQo+IE9u
IFdlZCwgSmFuIDI1LCAyMDIzIGF0IDE6NTLigK9BTSBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA8eW9z
aGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gRnJvbTogWW9zaGlo
aXJvIFNoaW1vZGEsIFNlbnQ6IE1vbmRheSwgSmFudWFyeSAyMywgMjAyMyAxMDozNSBBTQ0KPiA+
ID4NCj4gPiA+IEFkZCBJUE1NVSBub2RlcyBmb3IgcjhhNzc5ZzAuDQo+ID4gPg0KPiA+ID4gU2ln
bmVkLW9mZi1ieTogWW9zaGloaXJvIFNoaW1vZGEgPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVz
YXMuY29tPg0KPiANCj4gPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3
NzlnMC5kdHNpDQo+ID4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5
ZzAuZHRzaQ0KPiANCj4gPiA+ICsgICAgICAgICAgICAgaXBtbXVfaXI6IGlvbW11QGVlZDgwMDAw
IHsNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInJlbmVzYXMsaXBt
bXUtcjhhNzc5ZzAiLA0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAi
cmVuZXNhcyxyY2FyLWdlbjQtaXBtbXUtdm1zYSI7DQo+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgcmVnID0gPDAgMHhlZWQ4MDAwMCAwIDB4MjAwMDA+Ow0KPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgIHJlbmVzYXMsaXBtbXUtbWFpbiA9IDwmaXBtbXVfbW0gMz47DQo+ID4gPiArICAgICAg
ICAgICAgICAgICAgICAgcG93ZXItZG9tYWlucyA9IDwmc3lzYyBSOEE3NzlHMF9QRF9BTFdBWVNf
T04+Ow0KPiA+DQo+ID4gVGhlIHBvd2VyLWRvbWFpbnMgc2hvdWxkIGJlIFI4QTc3OUcwX1BEX0Ez
SVIuDQo+ID4gU28sIEknbGwgc2VuZCB2MiBwYXRjaCBhZnRlciB3ZSBkaXNjdXNzZWQgdXBkYXRp
bmcgZHQtYmluZGluZ3Mgb2YgInJlbmVzYXMsaXBtbXUtbWFpbiIuDQo+IA0KPiBUaGUgYmluZGlu
ZyB1cGRhdGUgaXMgY29tbWl0IGI2N2FiNmZiNjNiYmJlNmQgKCJkdC1iaW5kaW5nczogaW9tbXU6
DQo+IHJlbmVzYXMsIGlwbW11LXZtc2E6IFVwZGF0ZSBmb3IgUi1DYXIgR2VuNCIpIGluIGlvbW11
L25leHQuDQo+IA0KPiBEbyB5b3Ugc3RpbGwgcGxhbiB0byBzZW5kIGEgdjIsIG9yIHNoYWxsIEkg
Zml4IHRoaXMgKCsgcmVtb3ZhbCBvZg0KPiByZW5lc2FzLGlwbW11LW1haW4gaW5kaWNlcykgd2hp
bGUgYXBwbHlpbmc/DQoNCkkgc2FpZCBJIHdpbGwgc2VuZCBhIHYyLCBidXQgSSdtIGhhcHB5IGlm
IHlvdSB3aWxsIGZpeCB0aGlzIHdoaWxlIGFwcGx5aW5nLg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3No
aWhpcm8gU2hpbW9kYQ0KDQo+IFRoYW5rcyENCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiAN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRl
cmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGlu
dXgtbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmlj
YWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2lu
ZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlr
ZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZh
bGRzDQo=
