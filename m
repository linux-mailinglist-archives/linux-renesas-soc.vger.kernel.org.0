Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E1724D7E4A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Mar 2022 10:11:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233944AbiCNJMS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Mar 2022 05:12:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235340AbiCNJMR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Mar 2022 05:12:17 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2110.outbound.protection.outlook.com [40.107.114.110])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B3AA43EDD;
        Mon, 14 Mar 2022 02:11:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SdNMX7dt3iY2TwaPPbOd72a9pEectmNohSCKXagWIXM4jwMMjDVh9rcSYUVsNAiD3canb2D4yULfluy8aR10hYCia4mLUy5YsC3B3Gxw20l0Yo2pE+YGGevu7rvF2lK48b/s0o4jOg6cckB2Cec7bM0eaBAx7VABkNrA4BYUP//lEuIE9tqjhAcXBHU3YTVt8R3PpCmBUtX2teXWbiObeG0gQzTNCgbJIwcQqHIxyfGQTf/RSfPS5CiswVZnx8ijScNJsoUgZB1jDbXVm7/YaAQWNSmGK0AESehgFaeYIPcAkIeLOpW6vK+4wNPvUHMWPN2+t2RuGUmbRF7eplaePg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iOT+LtK8tJ/k1e+hiCYIK9jSQgYGVfiPwscVps4TITk=;
 b=C4OKxBzwQJIz9qFbGHqyfdg8h9wJ4H0ehm6qDerzpRWojJybl7ioW6Iah6qPrlvGgLgqI/1TLL1Ggj2CnJIAhN6ife+u9DjoihR6x3C8qx47kXzD1Y/U3mHyf9DrB5qs+9BKgdPBdzrxNtySpcbFddoFgguXjfAtxiIrqGafriYv3GONM9FUiEApmRBkBgLD3OyXhwxJ7Q140fw+CEI//oiMA+08X9KT6ReQ1HuOiQqxQKjmNYfNpMH34Vyq9FddwzkFCdSBNnqoR3oCnKnb0Nta0J1JnCFweO9yTjV/wgxzRoLWSx/O4micF7iW2Pr7W7LGoolw9gRM6+qBMuAQLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iOT+LtK8tJ/k1e+hiCYIK9jSQgYGVfiPwscVps4TITk=;
 b=XiiHuLnwVqFFvQP/XpkhCi1dLQ6EoHUIu5LH1AgX56dGaUuLH/QFpG6zXrmgu1d4qsQwU1O7BOQOgACtLIu1l9ooCtbCjGPG9rt2dMgguMFvK6XVTUxujitGOT5tYPeA9D2wVrz0VBU7F4SQ0ts6PFRgpBiAgm4jex6TwDhvDhQ=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYAPR01MB5165.jpnprd01.prod.outlook.com
 (2603:1096:404:12e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Mon, 14 Mar
 2022 09:11:05 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::68f2:6873:c021:1053]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::68f2:6873:c021:1053%6]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 09:11:05 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Gilad Ben-Yossef <gilad@benyossef.com>
CC:     Herbert Xu <herbert@gondor.apana.org.au>,
        David Miller <davem@davemloft.net>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Dung Nguyen <dung.nguyen.zy@renesas.com>,
        "cristian.marussi@arm.com" <cristian.marussi@arm.com>,
        Ofir Drang <Ofir.Drang@arm.com>
Subject: RE: [RFC/PATCH] crypto: ccree - fix a race of enqueue_seq() in
 send_request_init()
Thread-Topic: [RFC/PATCH] crypto: ccree - fix a race of enqueue_seq() in
 send_request_init()
Thread-Index: AQHYNSDFqLtDRGqSOEmo3DJ0n9rCUKy9aZ8AgAEyBHA=
Date:   Mon, 14 Mar 2022 09:11:05 +0000
Message-ID: <TYBPR01MB5341BD89D64F8573575F4A98D80F9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20220311081909.1661934-1-yoshihiro.shimoda.uh@renesas.com>
 <CAOtvUMc67nT_hVJ8C5pnAQfSGSGtae79OJtadgD8wZC3dcNRLA@mail.gmail.com>
In-Reply-To: <CAOtvUMc67nT_hVJ8C5pnAQfSGSGtae79OJtadgD8wZC3dcNRLA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e6de5f50-bc12-432c-2278-08da059a9192
x-ms-traffictypediagnostic: TYAPR01MB5165:EE_
x-microsoft-antispam-prvs: <TYAPR01MB51650CBE443ADF74D599E827D80F9@TYAPR01MB5165.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1jj7C7lWnnXVFL9rgqYzavqnse2MIgoJ83sBaHQN5tinwUSvio97J+5n6wEr94mVqhKko36L+Y7jzIUYk6r1lYMbSPM+qbIqBDac4PavNl9AptykL7jqlKfELDSNnTWPp4GjMQx+9Iqo2BwHDiZ3LUKbIzaVjHvjq3htnUoYmz9Ib05cfGFWQxCf1d/RVb/QpiCg+K7EqDAPZNdR0mdlSUXRTWTcKAJjr0Q6GSmSzC1g/+SYMWxpg+4BF43vv1BoDi19Tpm/Hm9Fek/tsaauNpMUfzWiidIDsnzdvTMuUO7PhguuiQMej09a/rfU1Ks8JuuEjj9BL6ll4z6KiZmrXfW+L0l3KizOqqd024NWx2xYZZHDe2vr8bTSMFkJBTLIqk4CwCHIcM38PXJXHh4LZAIYzOnTGtrbEaPXJ7+pW/WUXV+4ZLhAyvwBgwyMdnEIvxRd0bnvAkxszyCHc+s/rDSJalRzhB2jfYaZ1F9gzLvvqp54HSwgvs6IHeljaagdH7KP75nPK8W106dwheDrp7oJJY3d6SsRb//VR9PwOKvbQaV3EOivrizeNAiDJCBGGiG4Ph9nPcTZKLoXHnvImOPqyRT97dFSyabvXMZPeavEoplXhmJWTRKbrjV5k/0Yu879PE6XFcxcite+0uN5zD6GN6ECYRD18OQYmzLbaiL+KSXwSgksCyNH0pdW0/YFoat83g5aelUMZc2DxpOFbQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6916009)(54906003)(316002)(33656002)(55016003)(76116006)(66946007)(508600001)(38070700005)(71200400001)(8936002)(66476007)(52536014)(5660300002)(2906002)(38100700002)(8676002)(64756008)(66446008)(4326008)(66556008)(122000001)(86362001)(9686003)(7696005)(6506007)(83380400001)(186003)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WXEvcWxXTDV6cmw4OHhZbHYzMjgwcm5EcVN5OXUweDJFSlpuTW9mNlYrUmYv?=
 =?utf-8?B?NGJWV29yczdybU16VndtMFNhdjhqMVhHZEMvQmdMSERwQTRLU1VuM1pWTjNx?=
 =?utf-8?B?MlRqajhOak9rY1NwS2VLTnd6VEZxWjZuOVkralpPd2tJZW1weExRdk80SUx1?=
 =?utf-8?B?dnNMa3JhMlc4ZmtPSDNIQVY4SENSZCswWTd1QVVhbkZ5TVNEeGd1RS8rWjlo?=
 =?utf-8?B?ekM3cERiR3VtSjdTR0FpV0ZUNmpUaG1GS2JPM29WcnpiRFlqYWJSL1grUEJW?=
 =?utf-8?B?UU5FYjc5UERoNk50ellwWFI4dzJCOCtjazYyUCtWSFVIZ0EvbnBWTU1ZQWFG?=
 =?utf-8?B?aHlhOHZ2YkxacnUrbWpvT3dKMkpxelYzeU9ZNVZBT0w2cHozSWJjemUrLy93?=
 =?utf-8?B?dTJQL3hNQkI1ZWxNNnhTbVVSeU9pN09zUmV3WW4yVTQzWkFHV2ZqTWNDUC8z?=
 =?utf-8?B?dFBMMFJKdzdPV09kRlRLWDhpOW55NEYrNFRnLy9SK0lNTjRtVU04L1NPTVlF?=
 =?utf-8?B?a0N0QVJYZFJWRUx2OE8wMjNrQkJwTkxoRmxzZ1g2WlgrbHAwVjRNeHV5QVN5?=
 =?utf-8?B?dCt0aUs2TDl2Q3ZnYWR1RHk0b2NSMnNPaGJicy9mVWl5WnhWTXdIT2F4VG5M?=
 =?utf-8?B?QTROeU0vMWQrVjloNFZERTJ6elFSb3RQa2t6QW9ueURtRE5PdkJ0TTVVeHRI?=
 =?utf-8?B?Q1g3YjJudmVicHMrc2xRY2NNTHFlR0p4bGVHcVBvSzFyTVBBUVc3QkFXNUFI?=
 =?utf-8?B?SDMreklEbFIzSlZlQ1B2aTNmWVl1UjE3LzhveXhZdnNrK3M3eUxCTTBUcVpQ?=
 =?utf-8?B?S2E4ZDVvV0l4K1Q0K3ZOSzMvdzV4dEljYzZQVUZOMWc4Q3d3NnAxQzF1SHFJ?=
 =?utf-8?B?ZEpZQjVGaExXYVFSdmtVUmt4TFY5d1BZYXhhNy91OWxNRWQ0ZHNSb1UxYTdy?=
 =?utf-8?B?TzBKdHhraGh1RW1lbE1HcllHV0ZDYjRqUzc2ZzBOWTRML0dYb3Jtb0greGtv?=
 =?utf-8?B?SXBaTVJkVUx1a1RpVzFUWXRtWVVnNTF1VndYVWI0NWdPemZiNHg3ZFdpSVdx?=
 =?utf-8?B?UUdrcVhOWktuRlJ1N2RGenRrd2pJVXM4c2dSSUszcGRNMkQwY0dmUEFlRjhU?=
 =?utf-8?B?YWxiWjNmbXh4L3ozQzdYdHpxdGwrUnNoNWpZMWlycFNSM3FoZVM0aWF0UUZw?=
 =?utf-8?B?b0dlU2RCQjN3K2tCcWZrNVFWaFZ3M2dnaUlIemtEamFMZWM2NFBCRnN4QlVj?=
 =?utf-8?B?RjFSbk9xVXg1VGxIUVF3VnZOYU1lMnVFOGtyVFA0a0NXM1l0cnFYb3Azekc5?=
 =?utf-8?B?OEtrUmwrSGlBV25kOVlPMFp6T0l0bEJsSkVRWldpazl1U2N2Q05KNjhpZFJ1?=
 =?utf-8?B?azVYd0V4STBlcFhxNllYSXZybW5YdnVDeGVEMm9YaFNMT3lCcWxPNW1VZm83?=
 =?utf-8?B?U2NiU3lyUUZ5MHhKT2pLNFlwZnF1ZTNBSmRJQ050OG9EYXN6UFZqSFZNUytZ?=
 =?utf-8?B?ZC95V01DVTJQQ0FjcUxkL2xGclB5TDBJZTQ1dHhKNTNIeW1lbi9rVHV3YnQr?=
 =?utf-8?B?clQ4Z2ZJVWtLOFJON1N0WndEdC9jT3R4NTYwdUNUb01HNjdka0IrV3pZWUcx?=
 =?utf-8?B?Q21lcEtLNHFJWk5BbU9wRHhYV2NoY05VYzZWYUVIWHNlMHgvY05zZlZzeHVI?=
 =?utf-8?B?QUNURlhvcU9ld2x3YVBDRXVjUlFQZlU0cUY3NU52S0V3Y1pSelpwc2JtWml4?=
 =?utf-8?B?WlFnVysyRE1XbHhvaGZTOG0wN01OaTVtbU94Z2ZqbzhHUWFhdGx2aGFSRmwv?=
 =?utf-8?B?Z3BXZ2V6UWVKUE1rMXMveUdzMTVCZmNVVElZUTZxdStKWWppOXRzeUhNaEFq?=
 =?utf-8?B?MnFUVXJSYm15Szk4M203ZEVuWm9oMDVOWktoa0p3NUZFQ2JSWUhCU3hXQnQw?=
 =?utf-8?B?OW5UcmxCci9SL0JwMVk0OGh1MFVVaGI0TDZ2bDVPcDg3OVBTTlpFTmRXbzEy?=
 =?utf-8?B?VldKMVBaNFlZZ1ZkZ0tnTUhCYitZTk5UY2xuTW5OTWFkSEZ1RWkxeFhVL3l3?=
 =?utf-8?B?RG9JTWRzNm9rSlpJRUkyVDZ0dWwwbUNiUEM5QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6de5f50-bc12-432c-2278-08da059a9192
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2022 09:11:05.1239
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +9b/UPb0nRnbtN3ZtlxKzuV9DJvdIYat5Apt4fduMdRhKGkoBQoXXi7TVW3OZjmOHKsqqu5bcwkDjNFPS/p9KVeKRYv1XWZOTepWMUEsOJJW7JthVmpjmXp0sTZcodNv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5165
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGksDQoNCj4gRnJvbTogR2lsYWQgQmVuLVlvc3NlZiwgU2VudDogU3VuZGF5LCBNYXJjaCAxMywg
MjAyMiAxMTo1MiBQTQ0KPiANCj4gSGksDQo+IA0KPiBPbiBGcmksIE1hciAxMSwgMjAyMiBhdCAx
MDoxOSBBTSBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNh
cy5jb20+IHdyb3RlOg0KPiA+DQo+ID4gRnJvbTogRHVuZyBOZ3V5ZW4gPGR1bmcubmd1eWVuLnp5
QHJlbmVzYXMuY29tPg0KPiA+DQo+ID4gV2hlbiBsb2FkaW5nIGNjcmVlLmtvLCBhZnRlciByZWdp
c3RlcmluZyBjaXBoZXIgYWxnb3JpdGhtIGF0DQo+ID4gY2NfY2lwaGVyX2FsbG9jKCkgYW5kIGNj
X2hhc2hfYWxsb2MoKSAtPiBzZW5kX3JlcXVlc3RfaW5pdCgpIC0+DQo+ID4gZW5xdWV1ZV9zZXEo
KSBoYXMgY2FsbGVkIHRvIHB1c2hpbmcgZGVzY3JpcHRvciBpbnRvIEhXLg0KPiA+DQo+ID4gT24g
b3RoZXIgaGFuZCwgaWYgYW5vdGhlciB0aHJlYWQgaGF2ZSBjYWxsZWQgdG8gZW5jcnlwdC9kZWNy
eXB0DQo+ID4gY2lwaGVyIChjY19jaXBoZXJfZW5jcnlwdC9kZWNyeXB0KSAtPiBjY19zZW5kX3Jl
cXVlc3QoKSAtPg0KPiA+IGNjX2RvX3NlbmRfcmVxdWVzdCgpIC0+IGVucXVldWVfc2VxKCkgd2hp
bGUgc2VuZF9yZXF1ZXN0X2luaXQoKQ0KPiA+IGlzIHJ1bm5pbmcsIHRoZSB0aHJlYWQgYWxzbyBo
YXMgY2FsbGVkIHRvIHB1c2hpbmcgZGVzY3JpcHRvciBpbnRvIEhXLg0KPiA+IEFuZCB0aGVuLCBp
dCdzIHBvc3NpYmxlIHRvIG92ZXJ3cml0ZSBkYXRhLg0KPiA+DQo+ID4gVGhlIGNjX2RvX3NlbmRf
cmVxdWVzdCgpIGxvY2tzIG1nci0+aHdfbG9jaywgYnV0IHNlbmRfcmVxdWVzdF9pbml0KCkNCj4g
PiBkb2Vzbid0IGxvY2sgbWdyLT5od19sb2NrIGJlZm9yZSBlbnF1ZXVlX3NlcSgpIGlzIGNhbGxl
ZC4gU28sDQo+ID4gc2VuZF9yZXF1ZXN0X2luaXQoKSBzaG91bGQgbG9jayBtZ3ItPmh3X2xvY2sg
YmVmb3JlIGVucXVldWVfc2VxKCkgaXMNCj4gPiBjYWxsZWQuDQo+ID4NCj4gPiBUaGlzIGlzc3Vl
IGlzIHBvc3NpYmxlIHRvIGNhdXNlIHRoZSBmb2xsb3dpbmcgd2F5IGluIHJhcmUgY2FzZXM6DQo+
ID4gLSBDT05GSUdfQ1JZUFRPX01BTkFHRVJfRElTQUJMRV9URVNUUz1uDQo+ID4gLSBpbnNtb2Qg
Y2NyZWUua28gJiBpbnNtb2QgdGNyeXB0LmtvDQo+IA0KPiBUaGFuayB5b3UgdmVyeSBtdWNoIER1
bmcgYW5kIFlvc2hpaGlybyENCj4gDQo+IFRoaXMgaXMgYSB2ZXJ5IGdvb2QgY2F0Y2ggYW5kIGFu
IGlzc3VlIHdlIGhhdmUgbWlzc2VkIGluZGVlZC4NCg0KSSdtIGhhcHB5IGFib3V0IHRoaXMuDQoN
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IER1bmcgTmd1eWVuIDxkdW5nLm5ndXllbi56eUByZW5l
c2FzLmNvbT4NCj4gPiBbc2hpbW9kYTogcmV2aXNlIHRoZSBzdWJqZWN0L2Rlc2NyaXB0aW9uXQ0K
PiA+IFNpZ25lZC1vZmYtYnk6IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8uc2hpbW9kYS51
aEByZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiAgSSBiZWxpZXZlIHdlIHNob3VsZCBmaXggdGhp
cyByYWNlLiBCdXQsIGFzIEkgd3JvdGUgdGhlIGRlc2NpcHRpb24NCj4gPiAgYWJvdmUsIHRoZXJl
IGlzIGluIHJhcmUgY2FzZXMuIFNvLCBJIG1hcmtlZCB0aGlzIHBhdGNoIGFzIFJGQy4NCj4gPg0K
PiA+ICBkcml2ZXJzL2NyeXB0by9jY3JlZS9jY19yZXF1ZXN0X21nci5jIHwgMiArKw0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9jcnlwdG8vY2NyZWUvY2NfcmVxdWVzdF9tZ3IuYyBiL2RyaXZlcnMvY3J5cHRvL2NjcmVl
L2NjX3JlcXVlc3RfbWdyLmMNCj4gPiBpbmRleCA4ODcxNjJkZjUwZjkuLmVlZjQwMDIyMjU4YiAx
MDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2NyeXB0by9jY3JlZS9jY19yZXF1ZXN0X21nci5jDQo+
ID4gKysrIGIvZHJpdmVycy9jcnlwdG8vY2NyZWUvY2NfcmVxdWVzdF9tZ3IuYw0KPiA+IEBAIC01
MTMsNiArNTEzLDcgQEAgaW50IHNlbmRfcmVxdWVzdF9pbml0KHN0cnVjdCBjY19kcnZkYXRhICpk
cnZkYXRhLCBzdHJ1Y3QgY2NfaHdfZGVzYyAqZGVzYywNCj4gPg0KPiA+ICAgICAgICAgc2V0X3F1
ZXVlX2xhc3RfaW5kKGRydmRhdGEsICZkZXNjWyhsZW4gLSAxKV0pOw0KPiA+DQo+ID4gKyAgICAg
ICBzcGluX2xvY2tfYmgoJnJlcV9tZ3JfaC0+aHdfbG9jayk7DQo+ID4gICAgICAgICAvKg0KPiA+
ICAgICAgICAgICogV2UgYXJlIGFib3V0IHRvIHB1c2ggY29tbWFuZCB0byB0aGUgSFcgdmlhIHRo
ZSBjb21tYW5kIHJlZ2lzdGVycw0KPiA+ICAgICAgICAgICogdGhhdCBtYXkgcmVmZXJlbmNlIGhv
c3QgbWVtb3J5LiBXZSBuZWVkIHRvIGlzc3VlIGEgbWVtb3J5IGJhcnJpZXINCj4gPiBAQCAtNTIw
LDYgKzUyMSw3IEBAIGludCBzZW5kX3JlcXVlc3RfaW5pdChzdHJ1Y3QgY2NfZHJ2ZGF0YSAqZHJ2
ZGF0YSwgc3RydWN0IGNjX2h3X2Rlc2MgKmRlc2MsDQo+ID4gICAgICAgICAgKi8NCj4gPiAgICAg
ICAgIHdtYigpOw0KPiA+ICAgICAgICAgZW5xdWV1ZV9zZXEoZHJ2ZGF0YSwgZGVzYywgbGVuKTsN
Cj4gPiArICAgICAgIHNwaW5fdW5sb2NrX2JoKCZyZXFfbWdyX2gtPmh3X2xvY2spOw0KPiA+DQo+
ID4gICAgICAgICAvKiBVcGRhdGUgdGhlIGZyZWUgc2xvdHMgaW4gSFcgcXVldWUgKi8NCj4gPiAg
ICAgICAgIHJlcV9tZ3JfaC0+cV9mcmVlX3Nsb3RzID0NCj4gPiAtLQ0KPiA+IDIuMjUuMQ0KPiA+
DQo+IA0KPiBIYXZpbmcgc2FpZCB0aGF0LCBhZGRpbmcgYSBsb2NrIGhlcmUgaXMgbm90IHRoZSBi
ZXN0IHNvbHV0aW9uLiBUbyBiZQ0KPiBlZmZlY3RpdmUsIHRoZSBsb2NrIHNob3VsZCBiZSB0YWtl
biBiZWZvcmUgdGhlIGNhbGwgdG8NCj4gY2NfcXVldWVzX3N0YXR1cygpIGFuZCByZWxlYXNlZCBv
bmx5IGFmdGVyIHRoZSB1cGRhdGluZyBvZiB0aGUgZnJlZQ0KPiBzbG90cy4NCj4gSG93ZXZlciwg
d2hpbGUgZG9pbmcgc28gd2lsbCBlbnN1cmUgdGhlcmUgaXMgbm8gcmFjZSBjb25kaXRpb24gd2l0
aA0KPiByZWdhcmQgdG8gd3JpdGluZyB0byB0aGUgaGFyZHdhcmUgY29udHJvbCByZWdpc3RlcnMs
IGl0IGRvZXMgbm90IGRlYWwNCj4gYXQgYWxsIHdpdGggdGhlIGNhc2UgdGhlIGhhcmR3YXJlIGNv
bW1hbmQgRklGTyBpcyBmdWxsIGR1ZSB0bw0KPiBlbmNyeXB0aW9uL2RlY3J5cHRpb24gcmVxdWVz
dHMuDQo+IFRoaXMgaXMgYnkgZGVzaWduLCBhcyB0aGUgd2hvbGUgcHVycG9zZSBvZiBhIHNlcGVy
YXRlIGluaXQgdGltZSBvbmx5DQo+IHNlbmRfcmVxdWVzdCB2YXJpYW50IGlzIHRvIGF2b2lkIHRo
ZXNlIGNvbXBsZXhpdGllcywgdW5kZXIgdGhlDQo+IGFzc3VtcHRpb24gdGhhdCBhbGwgYWNjZXNz
IHRvIHRoZSBoYXJkd2FyZSBpcyBzZXJpYWxpc2VkIGF0IGluaXQgdGltZS4NCj4gDQo+IFRoZXJl
Zm9yZSwgYSBiZXR0ZXIgc29sdXRpb24gaXMgdG8gc3dpdGNoIHRoZSBvcmRlciBvZiBhbGdvDQo+
IGFsbG9jYXRpb25zIHNvIHRoYXQgdGhlIGhhc2ggaXMgYWxsb2NhdGVkIGZpcnN0LCBwcmlvciB0
byBhbnkgb3RoZXINCj4gYWxnIHRoYXQgbWlnaHQgYmUgdXNpbmcgdGhlIGhhcmR3YXJlIEZJRk8g
YW5kIHRodXMgZ3VhcmFudGVlaW5nDQo+IHN5bmNocm9uaXplZCBhY2Nlc3MgYW5kIGF2YWlsYWJs
ZSBGSUZPIHNwYWNlLg0KPiANCj4gQ2FuIHlvdSBwbGVhc2UgdmVyaWZ5IHRoYXQgdGhlIGZvbGxv
d2luZyBwYXRjaCBpbmRlZWQgcmVzb2x2ZXMgdGhlDQo+IGlzc3VlIGZvciB5b3U/DQoNClllcywg
d2Ugd2lsbCB2ZXJpZnkgdGhhdC4gUGxlYXNlIHdhaXQgYSB3aGlsZS4NCg0KQmVzdCByZWdhcmRz
LA0KWW9zaGloaXJvIFNoaW1vZGENCg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jcnlwdG8vY2Ny
ZWUvY2NfZHJpdmVyLmMgYi9kcml2ZXJzL2NyeXB0by9jY3JlZS9jY19kcml2ZXIuYw0KPiBpbmRl
eCA3OTBmYTkwNThhMzYuLjdkMWJlZTg2ZDU4MSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9jcnlw
dG8vY2NyZWUvY2NfZHJpdmVyLmMNCj4gKysrIGIvZHJpdmVycy9jcnlwdG8vY2NyZWUvY2NfZHJp
dmVyLmMNCj4gQEAgLTUyOSwyNCArNTI5LDI2IEBAIHN0YXRpYyBpbnQgaW5pdF9jY19yZXNvdXJj
ZXMoc3RydWN0DQo+IHBsYXRmb3JtX2RldmljZSAqcGxhdF9kZXYpDQo+ICAgICAgICAgICAgICAg
ICBnb3RvIHBvc3RfcmVxX21ncl9lcnI7DQo+ICAgICAgICAgfQ0KPiANCj4gLSAgICAgICAvKiBB
bGxvY2F0ZSBjcnlwdG8gYWxncyAqLw0KPiAtICAgICAgIHJjID0gY2NfY2lwaGVyX2FsbG9jKG5l
d19kcnZkYXRhKTsNCj4gKyAgICAgICAvKiBoYXNoIG11c3QgYmUgYWxsb2NhdGVkIGZpcnN0IGR1
ZSB0byB1c2Ugb2Ygc2VuZF9yZXF1ZXN0X2luaXQoKQ0KPiArICAgICAgICAqIGFuZCBkZXBlbmRl
bmN5IG9mIEFFQUQgb24gaXQNCj4gKyAgICAgICAgKi8NCj4gKyAgICAgICByYyA9IGNjX2hhc2hf
YWxsb2MobmV3X2RydmRhdGEpOw0KPiAgICAgICAgIGlmIChyYykgew0KPiAtICAgICAgICAgICAg
ICAgZGV2X2VycihkZXYsICJjY19jaXBoZXJfYWxsb2MgZmFpbGVkXG4iKTsNCj4gKyAgICAgICAg
ICAgICAgIGRldl9lcnIoZGV2LCAiY2NfaGFzaF9hbGxvYyBmYWlsZWRcbiIpOw0KPiAgICAgICAg
ICAgICAgICAgZ290byBwb3N0X2J1Zl9tZ3JfZXJyOw0KPiAgICAgICAgIH0NCj4gDQo+IC0gICAg
ICAgLyogaGFzaCBtdXN0IGJlIGFsbG9jYXRlZCBiZWZvcmUgYWVhZCBzaW5jZSBoYXNoIGV4cG9y
dHMgQVBJcyAqLw0KPiAtICAgICAgIHJjID0gY2NfaGFzaF9hbGxvYyhuZXdfZHJ2ZGF0YSk7DQo+
ICsgICAgICAgLyogQWxsb2NhdGUgY3J5cHRvIGFsZ3MgKi8NCj4gKyAgICAgICByYyA9IGNjX2Np
cGhlcl9hbGxvYyhuZXdfZHJ2ZGF0YSk7DQo+ICAgICAgICAgaWYgKHJjKSB7DQo+IC0gICAgICAg
ICAgICAgICBkZXZfZXJyKGRldiwgImNjX2hhc2hfYWxsb2MgZmFpbGVkXG4iKTsNCj4gLSAgICAg
ICAgICAgICAgIGdvdG8gcG9zdF9jaXBoZXJfZXJyOw0KPiArICAgICAgICAgICAgICAgZGV2X2Vy
cihkZXYsICJjY19jaXBoZXJfYWxsb2MgZmFpbGVkXG4iKTsNCj4gKyAgICAgICAgICAgICAgIGdv
dG8gcG9zdF9oYXNoX2VycjsNCj4gICAgICAgICB9DQo+IA0KPiAgICAgICAgIHJjID0gY2NfYWVh
ZF9hbGxvYyhuZXdfZHJ2ZGF0YSk7DQo+ICAgICAgICAgaWYgKHJjKSB7DQo+ICAgICAgICAgICAg
ICAgICBkZXZfZXJyKGRldiwgImNjX2FlYWRfYWxsb2MgZmFpbGVkXG4iKTsNCj4gLSAgICAgICAg
ICAgICAgIGdvdG8gcG9zdF9oYXNoX2VycjsNCj4gKyAgICAgICAgICAgICAgIGdvdG8gcG9zdF9j
aXBoZXJfZXJyOw0KPiAgICAgICAgIH0NCj4gDQo+ICAgICAgICAgLyogSWYgd2UgZ290IGhlcmUg
YW5kIEZJUFMgbW9kZSBpcyBlbmFibGVkDQo+IEBAIC01NTgsMTAgKzU2MCwxMCBAQCBzdGF0aWMg
aW50IGluaXRfY2NfcmVzb3VyY2VzKHN0cnVjdA0KPiBwbGF0Zm9ybV9kZXZpY2UgKnBsYXRfZGV2
KQ0KPiAgICAgICAgIHBtX3J1bnRpbWVfcHV0KGRldik7DQo+ICAgICAgICAgcmV0dXJuIDA7DQo+
IA0KPiAtcG9zdF9oYXNoX2VycjoNCj4gLSAgICAgICBjY19oYXNoX2ZyZWUobmV3X2RydmRhdGEp
Ow0KPiAgcG9zdF9jaXBoZXJfZXJyOg0KPiAgICAgICAgIGNjX2NpcGhlcl9mcmVlKG5ld19kcnZk
YXRhKTsNCj4gK3Bvc3RfaGFzaF9lcnI6DQo+ICsgICAgICAgY2NfaGFzaF9mcmVlKG5ld19kcnZk
YXRhKTsNCj4gIHBvc3RfYnVmX21ncl9lcnI6DQo+ICAgICAgICAgIGNjX2J1ZmZlcl9tZ3JfZmlu
aShuZXdfZHJ2ZGF0YSk7DQo+ICBwb3N0X3JlcV9tZ3JfZXJyOg0KPiBAQCAtNTkzLDggKzU5NSw4
IEBAIHN0YXRpYyB2b2lkIGNsZWFudXBfY2NfcmVzb3VyY2VzKHN0cnVjdA0KPiBwbGF0Zm9ybV9k
ZXZpY2UgKnBsYXRfZGV2KQ0KPiAgICAgICAgICAgICAgICAgKHN0cnVjdCBjY19kcnZkYXRhICop
cGxhdGZvcm1fZ2V0X2RydmRhdGEocGxhdF9kZXYpOw0KPiANCj4gDQo+IFRoYW5rcyBhZ2FpbiEN
Cj4gR2lsYWQNCj4gDQo+IC0tDQo+IEdpbGFkIEJlbi1Zb3NzZWYNCj4gQ2hpZWYgQ29mZmVlIERy
aW5rZXINCj4gDQo+IHZhbHVlcyBvZiDOsiB3aWxsIGdpdmUgcmlzZSB0byBkb20hDQo=
