Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99E724DAE8F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Mar 2022 11:58:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355215AbiCPLAK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Mar 2022 07:00:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347406AbiCPLAJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Mar 2022 07:00:09 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2124.outbound.protection.outlook.com [40.107.113.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01E20DE81;
        Wed, 16 Mar 2022 03:58:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J2OjPhcTnrzR99nM/AvSucG5GsJbEbLnTAjww+Sa1ScOUhPtLZFPnfpuBgdOg+F0LOfQZkwxXNqRCoyOnfhn/vu8h0zPMzxBFAw8ePR+dACHquTD/QK/GaDuyH9Kh8i//Y1In8llm6HWfff0cl0uNxad3LpasYpck5Vq17XWiK51sRn6X/pYcsXPxefAaXQYDiWB47CT1pXw9b6+7c4jU6cmydJ6enkIBC7Lxr/sbX7UcEa153tTjB95lAshRXwuqcwhK7nuVePHVGG3o5LSGVUUL64u8+uBlNHwLRg3mcdEsjaESgcNM1lTNJtImqozoqM1ichUIjWxUnCm8EKTag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UiWpyKwQJnFErDm2mizjDMm23W0qWMUDXhasirIlxtI=;
 b=hu6h3423Ph41xiMpy757hcXa94ykz4e96PbZ7E0a2lQU0WtYDITuX9veGW8u6j6v6Zn3t+/UvV+bmfye1i0rbctsX2/K9BROp84ObOkVD8UFuzj1ybSBj8QZT5w7x/zJchMKC4eoddssyw3gO48VWDHlThTZK2r2Sei6/K3FEsn+yu6pRA5qhIUXHya7Ugxq8EorwWLOKD8KOqntBZsOAclAUNbPi7AqoQfjjqXLTGqgPtr7wwmTUPDAvOkG5ls2WN2cRZ+anYgn0QLYiGdixGJ7jGXn/9bp/85scgVBx9tRvMjyysvtwgS3ajWJ1/ilJk37bffrDw8M/1CQr9SOqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UiWpyKwQJnFErDm2mizjDMm23W0qWMUDXhasirIlxtI=;
 b=hB4KJmwtDXTFzzmjVfByHirs4XDLlaKyF8qMf/xxCvxBqBqjAJc9VZAdYWP4GwRGX9AeXwj/GLJCptLZDW9iGz8mG8846moaXTUJ2r9g6+3S/Uxc0BnbvrSI60+w66Q3ZhtUy0uHyNAq84b9RGX8U1qVznTlXVcC1MLz2p+HNEo=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYCPR01MB7531.jpnprd01.prod.outlook.com
 (2603:1096:400:f7::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25; Wed, 16 Mar
 2022 10:58:51 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::68f2:6873:c021:1053]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::68f2:6873:c021:1053%8]) with mapi id 15.20.5081.015; Wed, 16 Mar 2022
 10:58:51 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Gilad Ben-Yossef <gilad@benyossef.com>
CC:     Herbert Xu <herbert@gondor.apana.org.au>,
        David Miller <davem@davemloft.net>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Dung Nguyen <dung.nguyen.zy@renesas.com>,
        "cristian.marussi@arm.com" <cristian.marussi@arm.com>,
        Ofir Drang <Ofir.Drang@arm.com>,
        Jing Dan <jing.dan.nx@renesas.com>
Subject: RE: [RFC/PATCH] crypto: ccree - fix a race of enqueue_seq() in
 send_request_init()
Thread-Topic: [RFC/PATCH] crypto: ccree - fix a race of enqueue_seq() in
 send_request_init()
Thread-Index: AQHYNSDFqLtDRGqSOEmo3DJ0n9rCUKy9aZ8AgAEyBHCAA0LbYA==
Date:   Wed, 16 Mar 2022 10:58:51 +0000
Message-ID: <TYBPR01MB53410A6F8EBADFF10F336548D8119@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20220311081909.1661934-1-yoshihiro.shimoda.uh@renesas.com>
 <CAOtvUMc67nT_hVJ8C5pnAQfSGSGtae79OJtadgD8wZC3dcNRLA@mail.gmail.com>
 <TYBPR01MB5341BD89D64F8573575F4A98D80F9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
In-Reply-To: <TYBPR01MB5341BD89D64F8573575F4A98D80F9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 566ead4e-9325-44b8-ebfe-08da073bf4ce
x-ms-traffictypediagnostic: TYCPR01MB7531:EE_
x-microsoft-antispam-prvs: <TYCPR01MB7531428FF4706AC43E50953DD8119@TYCPR01MB7531.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 21BKlASdZ1o8TgUdhwI5rkTRQ+GjA23aVz/MQ8XfjyHZO+ZlVHZuMIILkNbZqKKX91Le4auU0cohmCxGWFCOR2zeL4SwF1hZYXWph1qyOZVjl6K6vbgxqe0C8Baxn/y1Ix8GIZ5k6WFT6dficgOtB9yifim8Lc00iyPSU7rLMHFohyWhANubpyI/8JP7uAzKljDj78hjAJq7u4HNY3/uif8WAMb/ktXDaOqAITLMnit2hkN3/7berVNzB1k0Yn5J2KFmUdhm8HNJ7BVHbu6IoWE7cwXZ3jT47qiY/XMDEUf7DiCElNTTLzdvtU3G/dcNxK1D10hen+quOSMOHdYG0uF01GhDoaRG6yvxyskBe0ILfWw0E8sXX5KLC1LmHJCAy8Y68URqMa21iCS0wXfKbzkULbvB3SN4pRZIcayybt+kxOpkJD5CdgSOEG7S6xH7vHb4Jg0ZfZ+IRv8Fdrh1DqXm7RqTWZIb9Mm0ElkIDboMuHC+uKp35Wmihu0kYQHBQOgLmr6ICYpCEOyYQYVe1uHMRSsP3IwlTCLk1Czo43h5FXQZZcUEXodg2/9rDrO4/pBbmljutpOJac2ETQCtWJ4ybsRnRWF3/bcfJNEcQtmSzqEnWyzuBz3Cfn6zM3tsOhzLNVGOgyJUjSXLZTaohQsLYZY3srlhDNCnz41S2lOxuWkFCSKZE70uAVd5N6UpmQOj3t1Ep2xklPGm2b2Jsw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(33656002)(83380400001)(71200400001)(52536014)(6916009)(55016003)(5660300002)(66946007)(9686003)(107886003)(4326008)(8936002)(86362001)(76116006)(316002)(66556008)(8676002)(66476007)(64756008)(66446008)(186003)(7696005)(6506007)(54906003)(38070700005)(38100700002)(508600001)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OHhIOEprenlaczI3T0tDUkVLV2lDb1pac1h5OFNlUlB3RldpQWpIT2tnMlo1?=
 =?utf-8?B?UHpRZVJYbXg0bzBrcnhQVE0ya2U4c0JncytkOHpJTkQxdTVnak0xeFp4aGx0?=
 =?utf-8?B?djg5ZVNuNW5sZ2dGVDYxMVM3U3FtN0Rjc2hzODZSZVVXREFpT2p2c2JBL05E?=
 =?utf-8?B?bnp1RjhHVUFKVG0vc09XMFIxWjlGVGVjMk1NNndJQllZMERBMW1kbnFtaFR5?=
 =?utf-8?B?SVpsT3RTYWhFL25WU0ZweEtsUnp1c1BDekV4UXdwdnF6NkV2UkdLckJsaFE2?=
 =?utf-8?B?N3BXSmNOdnR1SGZnRUxjeWRZczlyWmkyUmU1Tmx2TUNpRmEvSGh3NFowTlNO?=
 =?utf-8?B?ZEEzMkd2NUw5T2ZIVFVLWlhZZDVJbmhMQWx5Z1FyVmRhMEZ3MFNLZnZoaXJK?=
 =?utf-8?B?K25KdEdWWVR6bUpnU1U0bW5PTU01cVhNMWFHS0NOdHlPS2lPc0UwTDNXcjY0?=
 =?utf-8?B?cjRZS1BHWDBrOTdOZUhJQXlHT0JldEJaaVBwL0dNUTZhRmJvc29PWEVDZ1BS?=
 =?utf-8?B?cnBMK2RRWUh6QnlRcDJxbENsU1g3WmVWUjUxRUZleE01Q24vZFZoRkxvVXov?=
 =?utf-8?B?NlRNVlNoa3JJOGUrODJZZVFBTW1ZOGRaakdqamFuYlc4U0c3a2t5M1hLcklH?=
 =?utf-8?B?Zjd6QXdCUE9iTWdEK1crd0pDamYxWkFYdXBtWXBPS0wrMzVWaEpnWE1RWnpE?=
 =?utf-8?B?d3lXVmpqTDREbkdJWWdJZVl4eWFKVU4rNWJkeWRSc0V2RzRvUm85Ykxsb3dZ?=
 =?utf-8?B?aTJUOUlzbE91Q0RuU2l1d2xqZG5IWUNBTlg2L1ArZjBTdXNIeUsyQjYxUU93?=
 =?utf-8?B?V09MM2ZVTVEvc3dVZnljek9CUkN1RW02ekNVU0cySHFjaHd0b1kvUFloYjhk?=
 =?utf-8?B?L3duNnplaE9VM3QvbjloQ0YzYzZWRU5HUVFWR0hPVVh4SWFydWZTL3NRTlN5?=
 =?utf-8?B?QkI0TWswVU1xOGNXM1ZBVzRJdzAvMm1RdEF4TCs0VXZrZDRRNk5ZaFNaNm5z?=
 =?utf-8?B?UkM4SHM2UXdOcmsrVkRQeVhVUWMvSUZOMEJFeHoxeGc1dlh3RlV5b2M2V2JL?=
 =?utf-8?B?cFYrNE1aa3dOVHg2ZmUvTGpXaXZhVERQU2ViK1huYVZwdWVzUFJ5VWNFM3hv?=
 =?utf-8?B?YlRJQnhvcmIvaXp2NkcycUh0RmpKVkFGMWxrckhuNFY2WERtc1lRcDloUnQ0?=
 =?utf-8?B?K2xwT1VXWFJiTHcrN0NCQkprV0dBZHJUbjNDWFJyT2ZYY3FTempsRVMvUDhy?=
 =?utf-8?B?MWxpRUlNUE1COVdqZWVqSFlmMHh1Y3pISUdBZ2hnOTl6Z0YydVRpODNIOUVI?=
 =?utf-8?B?RUNFWTVKRDBKYlI4R1pwZ1o4a3dCaGU3V1Bld1lNaitycW5hOTJ0NHoxSkFJ?=
 =?utf-8?B?ODM4TC9hSUtObzAxNFhCUmtyUXhlYUQyS1gvNnhsVVUyOElMTU5JUlhXTk44?=
 =?utf-8?B?cng1cTVFWGRKMUZnTy9nVXVrMUN0YVozWmJLZ3ErRHYwUFZLamxxSzFFTnBh?=
 =?utf-8?B?Z0dIbGQxUkN4THFhVE1CYkU5Ri93QmwyTUpMUit3NjdqMlFHK28wNGd0YWZZ?=
 =?utf-8?B?L0FXaDBacStrSHdYeC95ZTlFZ2dmcXlZa2xmTy9ta3lLZ3VYSU9nVEJBVmJh?=
 =?utf-8?B?TXpwMG40b0dmY1piV2Y3QTBON1dPeWUwMjJveU1ScGRDVTdlekcrakhOMWlx?=
 =?utf-8?B?cWcrUmV6Q1RLVklndmZ6VW1nRG52SCtRdDNOb2RMNm1Vei85a3h1YlV5RFd2?=
 =?utf-8?B?RFJWQytZRnJadWl2V0hRdEg3UjJyOTFtcXQ2b0wvRFJtYnZ6S2tUWCt6YW1K?=
 =?utf-8?B?d0Q3c0QwMHorSktnSDhTejZacGZzaXpKQitLeVVaa3pNK2NLVXFFR0p3ait2?=
 =?utf-8?B?ZWthNlZGcE94ckN6WTMzcldiekVaYnB0VkxtQndDYnBYODZFTWl3YXpJaXlC?=
 =?utf-8?B?Q1N4blJramh4OW16eTEydFl6dTBFeGhhMGZOSXNQeTB2YnZMcXlyaTFXT3BJ?=
 =?utf-8?B?UFFpYUlwN2p3bHVpQVdWa0pjSElScXNoZEdXR21BN0VERE1xeWF4Mkw1WEQx?=
 =?utf-8?B?Z0FOYnNtdlpqMVJGcVJxSDFpRkw0VXlNSVNzUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 566ead4e-9325-44b8-ebfe-08da073bf4ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2022 10:58:51.6919
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1KpT9nkDB7g3BR0BowIayfjpEXuxx0tc2FmU5JRO3IPvPO7pdQ5fdHEEH8bvzUwOMfOTUOtXXhvPs7YutE+10rVjvtjGMNt1jGEucWqamBUxrbBxe+y9TvS7xGbcZVwt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7531
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGksDQoNCj4gRnJvbTogWW9zaGloaXJvIFNoaW1vZGEsIFNlbnQ6IE1vbmRheSwgTWFyY2ggMTQs
IDIwMjIgNjoxMSBQTQ0KPiA+IEZyb206IEdpbGFkIEJlbi1Zb3NzZWYsIFNlbnQ6IFN1bmRheSwg
TWFyY2ggMTMsIDIwMjIgMTE6NTIgUE0NCj4gPiBPbiBGcmksIE1hciAxMSwgMjAyMiBhdCAxMDox
OSBBTSBZb3NoaWhpcm8gU2hpbW9kYQ0KPHNuaXA+DQo+ID4gSGF2aW5nIHNhaWQgdGhhdCwgYWRk
aW5nIGEgbG9jayBoZXJlIGlzIG5vdCB0aGUgYmVzdCBzb2x1dGlvbi4gVG8gYmUNCj4gPiBlZmZl
Y3RpdmUsIHRoZSBsb2NrIHNob3VsZCBiZSB0YWtlbiBiZWZvcmUgdGhlIGNhbGwgdG8NCj4gPiBj
Y19xdWV1ZXNfc3RhdHVzKCkgYW5kIHJlbGVhc2VkIG9ubHkgYWZ0ZXIgdGhlIHVwZGF0aW5nIG9m
IHRoZSBmcmVlDQo+ID4gc2xvdHMuDQo+ID4gSG93ZXZlciwgd2hpbGUgZG9pbmcgc28gd2lsbCBl
bnN1cmUgdGhlcmUgaXMgbm8gcmFjZSBjb25kaXRpb24gd2l0aA0KPiA+IHJlZ2FyZCB0byB3cml0
aW5nIHRvIHRoZSBoYXJkd2FyZSBjb250cm9sIHJlZ2lzdGVycywgaXQgZG9lcyBub3QgZGVhbA0K
PiA+IGF0IGFsbCB3aXRoIHRoZSBjYXNlIHRoZSBoYXJkd2FyZSBjb21tYW5kIEZJRk8gaXMgZnVs
bCBkdWUgdG8NCj4gPiBlbmNyeXB0aW9uL2RlY3J5cHRpb24gcmVxdWVzdHMuDQo+ID4gVGhpcyBp
cyBieSBkZXNpZ24sIGFzIHRoZSB3aG9sZSBwdXJwb3NlIG9mIGEgc2VwZXJhdGUgaW5pdCB0aW1l
IG9ubHkNCj4gPiBzZW5kX3JlcXVlc3QgdmFyaWFudCBpcyB0byBhdm9pZCB0aGVzZSBjb21wbGV4
aXRpZXMsIHVuZGVyIHRoZQ0KPiA+IGFzc3VtcHRpb24gdGhhdCBhbGwgYWNjZXNzIHRvIHRoZSBo
YXJkd2FyZSBpcyBzZXJpYWxpc2VkIGF0IGluaXQgdGltZS4NCj4gPg0KPiA+IFRoZXJlZm9yZSwg
YSBiZXR0ZXIgc29sdXRpb24gaXMgdG8gc3dpdGNoIHRoZSBvcmRlciBvZiBhbGdvDQo+ID4gYWxs
b2NhdGlvbnMgc28gdGhhdCB0aGUgaGFzaCBpcyBhbGxvY2F0ZWQgZmlyc3QsIHByaW9yIHRvIGFu
eSBvdGhlcg0KPiA+IGFsZyB0aGF0IG1pZ2h0IGJlIHVzaW5nIHRoZSBoYXJkd2FyZSBGSUZPIGFu
ZCB0aHVzIGd1YXJhbnRlZWluZw0KPiA+IHN5bmNocm9uaXplZCBhY2Nlc3MgYW5kIGF2YWlsYWJs
ZSBGSUZPIHNwYWNlLg0KPiA+DQo+ID4gQ2FuIHlvdSBwbGVhc2UgdmVyaWZ5IHRoYXQgdGhlIGZv
bGxvd2luZyBwYXRjaCBpbmRlZWQgcmVzb2x2ZXMgdGhlDQo+ID4gaXNzdWUgZm9yIHlvdT8NCj4g
DQo+IFllcywgd2Ugd2lsbCB2ZXJpZnkgdGhhdC4gUGxlYXNlIHdhaXQgYSB3aGlsZS4NCj4gDQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY3J5cHRvL2NjcmVlL2NjX2RyaXZlci5jIGIvZHJpdmVy
cy9jcnlwdG8vY2NyZWUvY2NfZHJpdmVyLmMNCj4gPiBpbmRleCA3OTBmYTkwNThhMzYuLjdkMWJl
ZTg2ZDU4MSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2NyeXB0by9jY3JlZS9jY19kcml2ZXIu
Yw0KPiA+ICsrKyBiL2RyaXZlcnMvY3J5cHRvL2NjcmVlL2NjX2RyaXZlci5jDQo+ID4gQEAgLTUy
OSwyNCArNTI5LDI2IEBAIHN0YXRpYyBpbnQgaW5pdF9jY19yZXNvdXJjZXMoc3RydWN0DQo+ID4g
cGxhdGZvcm1fZGV2aWNlICpwbGF0X2RldikNCj4gPiAgICAgICAgICAgICAgICAgZ290byBwb3N0
X3JlcV9tZ3JfZXJyOw0KPiA+ICAgICAgICAgfQ0KPiA+DQo+ID4gLSAgICAgICAvKiBBbGxvY2F0
ZSBjcnlwdG8gYWxncyAqLw0KPiA+IC0gICAgICAgcmMgPSBjY19jaXBoZXJfYWxsb2MobmV3X2Ry
dmRhdGEpOw0KPiA+ICsgICAgICAgLyogaGFzaCBtdXN0IGJlIGFsbG9jYXRlZCBmaXJzdCBkdWUg
dG8gdXNlIG9mIHNlbmRfcmVxdWVzdF9pbml0KCkNCj4gPiArICAgICAgICAqIGFuZCBkZXBlbmRl
bmN5IG9mIEFFQUQgb24gaXQNCj4gPiArICAgICAgICAqLw0KPiA+ICsgICAgICAgcmMgPSBjY19o
YXNoX2FsbG9jKG5ld19kcnZkYXRhKTsNCj4gPiAgICAgICAgIGlmIChyYykgew0KPiA+IC0gICAg
ICAgICAgICAgICBkZXZfZXJyKGRldiwgImNjX2NpcGhlcl9hbGxvYyBmYWlsZWRcbiIpOw0KPiA+
ICsgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgImNjX2hhc2hfYWxsb2MgZmFpbGVkXG4iKTsN
Cj4gPiAgICAgICAgICAgICAgICAgZ290byBwb3N0X2J1Zl9tZ3JfZXJyOw0KPiA+ICAgICAgICAg
fQ0KPiA+DQo+ID4gLSAgICAgICAvKiBoYXNoIG11c3QgYmUgYWxsb2NhdGVkIGJlZm9yZSBhZWFk
IHNpbmNlIGhhc2ggZXhwb3J0cyBBUElzICovDQo+ID4gLSAgICAgICByYyA9IGNjX2hhc2hfYWxs
b2MobmV3X2RydmRhdGEpOw0KPiA+ICsgICAgICAgLyogQWxsb2NhdGUgY3J5cHRvIGFsZ3MgKi8N
Cj4gPiArICAgICAgIHJjID0gY2NfY2lwaGVyX2FsbG9jKG5ld19kcnZkYXRhKTsNCj4gPiAgICAg
ICAgIGlmIChyYykgew0KPiA+IC0gICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgImNjX2hhc2hf
YWxsb2MgZmFpbGVkXG4iKTsNCj4gPiAtICAgICAgICAgICAgICAgZ290byBwb3N0X2NpcGhlcl9l
cnI7DQo+ID4gKyAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiY2NfY2lwaGVyX2FsbG9jIGZh
aWxlZFxuIik7DQo+ID4gKyAgICAgICAgICAgICAgIGdvdG8gcG9zdF9oYXNoX2VycjsNCj4gPiAg
ICAgICAgIH0NCj4gPg0KPiA+ICAgICAgICAgcmMgPSBjY19hZWFkX2FsbG9jKG5ld19kcnZkYXRh
KTsNCj4gPiAgICAgICAgIGlmIChyYykgew0KPiA+ICAgICAgICAgICAgICAgICBkZXZfZXJyKGRl
diwgImNjX2FlYWRfYWxsb2MgZmFpbGVkXG4iKTsNCj4gPiAtICAgICAgICAgICAgICAgZ290byBw
b3N0X2hhc2hfZXJyOw0KPiA+ICsgICAgICAgICAgICAgICBnb3RvIHBvc3RfY2lwaGVyX2VycjsN
Cj4gPiAgICAgICAgIH0NCj4gPg0KPiA+ICAgICAgICAgLyogSWYgd2UgZ290IGhlcmUgYW5kIEZJ
UFMgbW9kZSBpcyBlbmFibGVkDQo+ID4gQEAgLTU1OCwxMCArNTYwLDEwIEBAIHN0YXRpYyBpbnQg
aW5pdF9jY19yZXNvdXJjZXMoc3RydWN0DQo+ID4gcGxhdGZvcm1fZGV2aWNlICpwbGF0X2RldikN
Cj4gPiAgICAgICAgIHBtX3J1bnRpbWVfcHV0KGRldik7DQo+ID4gICAgICAgICByZXR1cm4gMDsN
Cj4gPg0KPiA+IC1wb3N0X2hhc2hfZXJyOg0KPiA+IC0gICAgICAgY2NfaGFzaF9mcmVlKG5ld19k
cnZkYXRhKTsNCj4gPiAgcG9zdF9jaXBoZXJfZXJyOg0KPiA+ICAgICAgICAgY2NfY2lwaGVyX2Zy
ZWUobmV3X2RydmRhdGEpOw0KPiA+ICtwb3N0X2hhc2hfZXJyOg0KPiA+ICsgICAgICAgY2NfaGFz
aF9mcmVlKG5ld19kcnZkYXRhKTsNCj4gPiAgcG9zdF9idWZfbWdyX2VycjoNCj4gPiAgICAgICAg
ICBjY19idWZmZXJfbWdyX2ZpbmkobmV3X2RydmRhdGEpOw0KPiA+ICBwb3N0X3JlcV9tZ3JfZXJy
Og0KPiA+IEBAIC01OTMsOCArNTk1LDggQEAgc3RhdGljIHZvaWQgY2xlYW51cF9jY19yZXNvdXJj
ZXMoc3RydWN0DQo+ID4gcGxhdGZvcm1fZGV2aWNlICpwbGF0X2RldikNCj4gPiAgICAgICAgICAg
ICAgICAgKHN0cnVjdCBjY19kcnZkYXRhICopcGxhdGZvcm1fZ2V0X2RydmRhdGEocGxhdF9kZXYp
Ow0KPiA+DQo+ID4NCj4gPiBUaGFua3MgYWdhaW4hDQo+ID4gR2lsYWQNCg0KTXkgY29sbGVhZ3Vl
cyB0ZXN0ZWQgeW91ciBwYXRjaCwgYW5kIHRoZW4gdGhpcyBwYXRjaCBhbHNvIHJlc29sdmVkIHRo
aXMgaXNzdWUuDQpTbywNCg0KVGVzdGVkLWJ5OiBKaW5nIERhbiA8amluZy5kYW4ubnhAcmVuZXNh
cy5jb20+DQpUZXN0ZWQtYnk6IER1bmcgTmd1eWVuIDxkdW5nLm5ndXllbi56eUByZW5lc2FzLmNv
bT4NCg0KVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgeW91ciBzdXBwb3J0IQ0KDQpCZXN0IHJlZ2Fy
ZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo+ID4gLS0NCj4gPiBHaWxhZCBCZW4tWW9zc2VmDQo+
ID4gQ2hpZWYgQ29mZmVlIERyaW5rZXINCj4gPg0KPiA+IHZhbHVlcyBvZiDOsiB3aWxsIGdpdmUg
cmlzZSB0byBkb20hDQo=
