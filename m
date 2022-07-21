Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D496C57CAE7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Jul 2022 14:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233060AbiGUMvL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Jul 2022 08:51:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231777AbiGUMvK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Jul 2022 08:51:10 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2113.outbound.protection.outlook.com [40.107.113.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3239D22291;
        Thu, 21 Jul 2022 05:51:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M1z3Hjt4g9O6fl/cu5rZK1tXAxDOk9IQyCEL+UZOS68BGX5C8mNrYnQMsbGNzI4W/U1JCsn5Qd8YudRUBbp5RySkUYGo8dcwl2fKVyN8wjVvq3dxJsGD/XQU35IruoWtI5TE6QHUsrZDcq0yKh5FJSOZqC0xuIBTRGOKz/18xOeiNdKtH4HruipAmtUxUMoE/GMek90ceCaLuTF2ye5elObCYu6Yp0/e5oHakOWkfRie9faNqcshyzio3o+e/ZZt0oUWxEgiWmrQnCWb68HLPtLzfSpR9ZPAoKugwl8iDbcqTRkGaOEmz+k0kpokuiyKb4on9S785L6M5b5iubWYAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRR+JVEg+LVu8fHftPl56+UeX4ds6soXp7rbL+56hp8=;
 b=le3Acy51nLSRWdGBcsjbTunZ1NsxPSNYZ9nU1Yftd+Jey5/bez2Mt6BWi4nTHxwoE2tHQ+7bXbtvyXuVugqL68/9HhCLs9wFNHZvXSu/AO7SD4IuHZxqF++amgbZI3TwM4Zjo3ou/e7UhGZdd3DS6ZQpTaUhXk93gFi5t0oAgXdyawk9VJqUNugp3z8Retx/opWiO84tDAH+cKvc4RQc4CLBqOaDxMBkhqhzNx8JlJh+95oQbNCgkqP/ozKd0v29TZmFiV4eUKJJsLcMf8ruRoR2Biumnl+5hTJJUuUZsw481ECPi4hdyuwHcOErOaUEk3+QGRs/GnehmjKfcaivCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PRR+JVEg+LVu8fHftPl56+UeX4ds6soXp7rbL+56hp8=;
 b=MbpG9nclrTgjssBtW/Gj3X0e3a+nvTaj9eVYQ5CgzmC7E3tXaWLpWn9x9Viadlm5VyfXnMrgL5NO4wKqbZeS0zEZqYFTCSHJ8p3R+tDdW/ko9Z9DNbA0FwEbEAfVVYqkGc+GUDncit9LUGmpRapgmSZuRL17pe8JFuup5YkUGIY=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYAPR01MB5215.jpnprd01.prod.outlook.com
 (2603:1096:404:121::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.19; Thu, 21 Jul
 2022 12:51:04 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::307d:7cc:2021:f45f]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::307d:7cc:2021:f45f%7]) with mapi id 15.20.5438.024; Thu, 21 Jul 2022
 12:51:04 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Phil Edworthy <phil.edworthy@renesas.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Adam Ford <aford173@gmail.com>,
        USB list <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/2] usb: gadget: udc: renesas_usb3: Add support for
 RZ/V2M
Thread-Topic: [PATCH 2/2] usb: gadget: udc: renesas_usb3: Add support for
 RZ/V2M
Thread-Index: AQHYmqyltpFgm8HiQk+Q9huKSROR6q2IwEAAgAAEN4CAAAT1AIAAADWg
Date:   Thu, 21 Jul 2022 12:51:04 +0000
Message-ID: <TYBPR01MB5341BB25BFE06E58EA9F4A34D8919@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20220718134458.19137-1-phil.edworthy@renesas.com>
 <20220718134458.19137-3-phil.edworthy@renesas.com>
 <CAMuHMdXuY_HOphyDtw4edZWu_D4QCi2hi-GWLF5R2jPNMHGcpg@mail.gmail.com>
 <TYYPR01MB7086F7C2A25D70EABB9BD338F5919@TYYPR01MB7086.jpnprd01.prod.outlook.com>
 <CAMuHMdVaHXfyW27G7ZdRvg-VG1Gw4F2zJ1v8K4JuS1W_u5T4ng@mail.gmail.com>
In-Reply-To: <CAMuHMdVaHXfyW27G7ZdRvg-VG1Gw4F2zJ1v8K4JuS1W_u5T4ng@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e2fb008-22c0-4537-9b32-08da6b17ac63
x-ms-traffictypediagnostic: TYAPR01MB5215:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UoQ0QVbITsqAmsCHH4J/Q0zEjrsSWwmqxRRotDtDXkE29I01bl6Y9QbGUz+ESg/+8e3clh6z6JGb2cH24aPO0yPdda9qsSkL9JKdhOVP6+QZdabMzqCOtofD4I5wqVMcpzzE7eSMrGLlPY5Ye/3S7bOSJkiMeFYgAmmqT72FJRKb/Sh9yeY42qR/vLuVKCNflJ0nDcOl1AXOIxhzT4gyj/v3CZQ6EHcgiXUDwje+0wmMOHXbEPWUqmAWe0RVwAq95qTK0SAMjoDRm6mElYG1U+bjXugU4nDCiIzHHVrxujkVMNhyvNyM1C6GoJUhT/8kSRlObB0OdtWcKEB8OUSI6deiZLsZEC67QisnC25eb+EgBsYhc5MFlQF8ISx0NL2KwaLn6Lzug3xfD3SmOrH3/JrB3LTNBScevq0hwoODxazYIZIbgyiQjqhe39WsenHiRmpqhRms37mI7JxmIc7/FF2VTlrR+GyT/pcnB0CFe04OuckOeNj2XBdNmgPsmEbI2olEEPPybhM/T3J546jAnAT2c9zpTTdCF6dhWS1zKg2RUZPV1QAMSDMHQN7haUcBcctMpBreKcZevb1zfV+4JqBpwohTPr5rWU6yogUwtmS53R0/7GpmQAFCg8MyQE4lN3IcvU6+t5yAvPyApHJ+g0NshH2n/VSWrDkx0HjXZ4AV0sfDiceiv/C1iMZEPDca78EPqGgjbVMbffyOw2KQVDeaqUnCXfHvimQ0/YFDKJ9zZsPWuF2ZRCbu0Qq8+GLobZ+/RVPdq0hD7hmvgvDe4IkpFQGvyCFXPyUxwawHxudda9dWE3LPzSVB9X8I4v4C
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(366004)(136003)(376002)(396003)(71200400001)(478600001)(86362001)(38070700005)(9686003)(6506007)(7696005)(53546011)(41300700001)(316002)(54906003)(110136005)(6636002)(186003)(38100700002)(55016003)(66946007)(66446008)(8676002)(5660300002)(8936002)(52536014)(66556008)(64756008)(66476007)(76116006)(83380400001)(122000001)(33656002)(2906002)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RytYaUNtSTZCa1IydDJicUxLRWZsbTlTMFFiTXRhRUhEODhTdVlSVmxvUDIw?=
 =?utf-8?B?OWduLzlnYTJ2ZFROdEY0UUdCSG9YWmtTUFBLM1ZuZUkwbnZ6WHlyYmJvenJ0?=
 =?utf-8?B?UVp3Vnk1RmV4VTdjcXB0NUhOelVjMCtwUjN5QVZpSS9sdUxuY3ZRQXcwcVo5?=
 =?utf-8?B?SjN3eStUMnRtWHhSVHAvaXVDUkRUcXJ5QVYya3RBbFcvWVRiakdJTk9aZzlL?=
 =?utf-8?B?MmM3dG1qQjU4Z2lyT3M0NGZNbnNqV1piZEkwaXVSbVJ3OHo2MVhvcVpJVjF4?=
 =?utf-8?B?K2RpcmRLYS82WTgzazlDWTNmcFNMRUtWM1VnS3E5R1RVRm54WTBkZlVLaU02?=
 =?utf-8?B?R2lpc2pBT21wN0pCN2owWmI3Zzk0Z3pxY3pXSlpuRE4vZGJBQ2habEtOVUdi?=
 =?utf-8?B?M1JISXBWUnd3K2c0Tnlrd2s0bEFRc1BLTDRPQ0JWaks4SkVpL3laWWxYZUh6?=
 =?utf-8?B?cjMzVHNibWtZSE5pK1FQOFhHOWk0RUl4MUVvWDlLT09Oa2gzVDZEcFB5SVRO?=
 =?utf-8?B?c1p1SzVIbkt6TVNkV1hoa2dFRDZjNGVCeTVTc1dqZEloSzNIdjJjSXZqemtN?=
 =?utf-8?B?U0ZNZUJTbVozYnZ3anlaUGMvakFNZGJXMjJxWnRVZXZsUGFOR1I5dXp3eGsw?=
 =?utf-8?B?aHJCajRMU1ZKUElYTis1Q0M3dWVUSW5tTEdoYzBUTmJnaUVqaW42M3pPNEI1?=
 =?utf-8?B?TDUwR2JQcjQvK0JwcHJzRnVEaDlWTVhNelRGY0lpZk5iWDRFUVdqUytpREpt?=
 =?utf-8?B?Z3lPdm5iZHNqZUcwVHJOZkViZ3hwMDV1d203K3YyUXNNSnBjWkk0UDE3N3VP?=
 =?utf-8?B?anNrLzJXdjFmS29aRk8ySWlqdEFNeEFmY2xZUHdlR2xzaTlxeXhoY3lMTjJW?=
 =?utf-8?B?dHkybDFNdlVKdWZaaUtMcEl3cjFLRkMrWkIxT2l1RTEyclFvRXp3RFJNMHU3?=
 =?utf-8?B?Y3JxNW9FVHkwSHRqT2cwcDhPM29iWThFZkZXQm5qWW9WMC9KQTFJcmVWaTB5?=
 =?utf-8?B?cGtabkJXWFc4R3BkQ2hhZ09WcStZNitVWjJORWRHQm5CbGN4UjNUdSt5UTVB?=
 =?utf-8?B?WXhsWXdRVTFGYzcwSlhWQzNmOVd4Q3k3Ynd3UzZKc216d3dkYUxPR2ZvQ3NW?=
 =?utf-8?B?cEEyWkNLK2hiR3BhTnpVQWVkbmRJSStEVjFURlRWUlJrNWtuVUNrYUJQSGkw?=
 =?utf-8?B?U3BhUlhTYzBqc2ZESStuTTBZeDJtWmVtNkhnYlo4M3djdzByYkloRXA5SlJN?=
 =?utf-8?B?MkFSZEhCbVczUWdwZHdDb04ydElLdDZzcWZPazhBSllUcmNlRGhqU2lVQ09P?=
 =?utf-8?B?RjlrZkxqbWdFTjg1bzIzditISzFjVFJxT0VrdWx5QzFseWZoRUhnT1BKRWlq?=
 =?utf-8?B?c1YyOGo1OVYxeEJ4MHNRR3RUdC9zOVZJNW5CbEFIRkE3b0dPVWVIK0x3eHFW?=
 =?utf-8?B?RFZLSDVlOVZvMk1icTRGcjdOTldIMk5FWmdwdVo4QU50cGQrQzhOZnpWNG5j?=
 =?utf-8?B?a2V4UE9RQjZNbEkzRlZvZzRCSkZscXNMcHZURGdyMXpvZmJiR3BsU09nOWFU?=
 =?utf-8?B?a0hGaGdlZEVza1VYWE82TkdQSGZiSmQvMjhEenl6VlBUN3RzS1A0bnU5SGhm?=
 =?utf-8?B?M3Q4cHdYRG1VQkhOT1pJeVJWVWt2amd6TW96U0ZYU3RSNU5vQUpqRUpHM1Bj?=
 =?utf-8?B?VW8zYVkvUmVtRFN6cVFJalV1NE9zYzR5OUdkbFVWOXI0MlJHdVdrc2ZHaFN4?=
 =?utf-8?B?UW5ueDNGZ1ZnK1p4anIwN1pXY3FZekRRL1BvVFNDdmVqbFVZMFlDdmFBbXVB?=
 =?utf-8?B?Z0NKSFQwRHVHN2FGcnVKUjVtcGdPUTZLc2JObGZaNHhuODZJOGtqMmJvS1JW?=
 =?utf-8?B?L1p0TGhQVGlaNGo4a216enJ0b0dHOHBQSTNnTTJJbnJSZ1FsNmx1eWpKRE91?=
 =?utf-8?B?U29mRU1tZk5sRVRadHhiS2ZIMmN6dnREdGxKMk42TmhyTHYrVldLUndiVmVJ?=
 =?utf-8?B?M0lPNm5rcG5CUTlscEdycDMzTCt1cXBQYXhmTE5PTUpXN2pqWTZDa0cxZUNm?=
 =?utf-8?B?OVpXM1B2RzhJUmpWWmZHYk1nWGIrQTJBVjlzMGJOdHZjcG9way9LSHI4ODEr?=
 =?utf-8?B?eW85aThIOVN0MG9YVjBxeWpkc0xJdlRqOTFKYnFvdFBGa2tBc2xDYzlPSFc1?=
 =?utf-8?B?a3VUK0YrZ3Y0bjZoMUNyejZtemozcHZGaDg4cWhYRmR2V0lwaGVvRWJGZTMy?=
 =?utf-8?B?L0dueTR3aWsybUx2S3dXZlpUcnZBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e2fb008-22c0-4537-9b32-08da6b17ac63
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2022 12:51:04.6819
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iF/xRb3tSu8AHDfl6DftUokKTTlAmQ9XuxPJOZdCJfMSdAbV47cnZ8p+OIhX9TocNzyHGdLby351O7Bcs+IEoD+6RvanEe7brOq7kx11dgY54B/Wa+I/jncwwdnY38SC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5215
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLCBQaGlsLXNhbiwNCg0KVGhhbmsgeW91IGZvciB0aGUgcGF0Y2ghDQoNCj4g
RnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuLCBTZW50OiBUaHVyc2RheSwgSnVseSAyMSwgMjAyMiA5
OjQzIFBNDQo+IA0KPiBIaSBQaGlsLA0KPiANCj4gT24gVGh1LCBKdWwgMjEsIDIwMjIgYXQgMjoy
NSBQTSBQaGlsIEVkd29ydGh5IDxwaGlsLmVkd29ydGh5QHJlbmVzYXMuY29tPiB3cm90ZToNCj4g
PiBPbiAyMSBKdWx5IDIwMjIgMTM6MTAgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiA+ID4g
T24gTW9uLCBKdWwgMTgsIDIwMjIgYXQgMzo0NSBQTSBQaGlsIEVkd29ydGh5IHdyb3RlOg0KPiA+
ID4gPiBSWi9WMk0gKHI5YTA5ZzAxMSkgaGFzIGEgZmV3IGRpZmZlcmVuY2VzOg0KPiA+ID4gPiAg
LSBUaGUgVVNCM19EUkRfQ09OIHJlZ2lzdGVyIGhhcyBtb3ZlZCwgaXRzIGNhbGxlZCBVU0JfUEVS
SV9EUkRfQ09OIGluDQo+ID4gPiA+ICAgIHRoZSBSWi9WMk0gaGFyZHdhcmUgbWFudWFsLg0KPiA+
ID4gPiAgICBJdCBoYXMgYWRkaXRpb25hbCBiaXRzIGZvciBob3N0IGFuZCBwZXJpcGhlcmFsIHJl
c2V0IHRoYXQgbmVlZCB0bw0KPiA+ID4gPiAgICBjbGVhcmVkIHRvIHVzZSB1c2IgaG9zdCBhbmQg
cGVyaXBoZXJhbCByZXNwZWN0aXZlbHkuDQo+ID4gPiA+ICAtIFRoZSBVU0IzX09UR19TVEEsIFVT
QjNfT1RHX0lOVF9TVEEgYW5kIFVTQjNfT1RHX0lOVF9FTkEgcmVnaXN0ZXJzDQo+ID4gPiA+ICAg
IGhhdmUgYmVlbiBtb3ZlZCBhbmQgcmVuYW1lZCB0byBVU0JfUEVSSV9EUkRfU1RBLCBVU0JfUEVS
SV9EUkRfSU5UX1NUQQ0KPiA+ID4gPiAgICBhbmQgVVNCX1BFUklfRFJEX0lOVF9FLg0KPiA+ID4g
PiAgLSBUaGUgSURNT04gYml0IHVzZWQgaW4gdGhlIGFib3ZlIHJlZ3MgZm9yIHJvbGUgZGV0ZWN0
aW9uIGhhdmUgbW92ZWQNCj4gPiA+ID4gICAgZnJvbSBiaXQgNCB0byBiaXQgMC4NCj4gPiA+ID4g
IC0gUlovVjJNIGhhcyBhbiBzZXBhcmF0ZSBpbnRlcnJ1cHQgZm9yIERSRCwgaS5lLiBmb3IgY2hh
bmdlcyB0byBJRE1PTi4NCj4gPiA+ID4gIC0gVGhlcmUgYXJlIHJlc2V0IGxpbmVzIGZvciBEUkQg
YW5kIFVTQlANCj4gPiA+ID4gIC0gVGhlcmUgaXMgYW5vdGhlciBjbG9jaywgbWFuYWdlZCBieSBy
dW50aW1lIFBNLg0KPiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBQaGlsIEVkd29ydGh5
IDxwaGlsLmVkd29ydGh5QHJlbmVzYXMuY29tPg0KPiA+ID4gPiBSZXZpZXdlZC1ieTogQmlqdSBE
YXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4NCj4gPiA+IFRoYW5rcyBmb3Ig
eW91ciBwYXRjaCENCj4gPiA+DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMv
cmVuZXNhc191c2IzLmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9yZW5l
c2FzX3VzYjMuYw0KPiA+ID4NCj4gPiA+ID4gQEAgLTM2Myw2ICszNjgsNyBAQCBzdHJ1Y3QgcmVu
ZXNhc191c2IzIHsNCj4gPiA+ID4gICAgICAgICBib29sIGZvcmNlZF9iX2RldmljZTsNCj4gPiA+
ID4gICAgICAgICBib29sIHN0YXJ0X3RvX2Nvbm5lY3Q7DQo+ID4gPiA+ICAgICAgICAgYm9vbCBy
b2xlX3N3X2J5X2Nvbm5lY3RvcjsNCj4gPiA+ID4gKyAgICAgICBib29sIHI5YTA5ZzAxMTsNCj4g
PiA+DQo+ID4gPiBBbnkgYmV0dGVyIG5hbWUgZm9yIHRoaXMgZmVhdHVyZSBmbGFnPw0KPiA+IE5v
dGhpbmcgc3ByaW5ncyB0byBtaW5kLiBXZSBjb3VsZCB1c2Ugc2VwYXJhdGUgZmxhZ3MgZm9yIGhh
c19yZXNldHMsDQo+ID4gaGFzX2RyZF9pcnEsIG1heF9ucl9waXBlcyBidXQgSSBhbSBzdHJ1Z2ds
aW5nIHRvIGNvbWUgdXAgd2l0aCBuYW1lcw0KPiA+IGZvciB0aGUgb2Zmc2V0IHJlZ2lzdGVycyBh
bmQgbW92ZWQgYml0cy4gQW55IHN1Z2dlc3Rpb25zPw0KPiANCj4gT0ssIHNvICJpc19yenYybSI/
DQoNClRoZSBmbGFnIG5hbWUgbG9va3MgZ29vZCB0byBtZS4gSG93ZXZlciwgSSBkb24ndCBsaWtl
IHRoZSBmb2xsb3dpbmcgdXNhZ2UgaW4gbWFjcm9zLg0KLS0tDQotI2RlZmluZSBVU0IzX0RSRF9D
T04JCTB4MjE4DQorI2RlZmluZSBVU0IzX0RSRF9DT04JCSh1c2IzLT5yOWEwOWcwMTEgPyAweDQw
MCA6IDB4MjE4KQ0KLi4uDQotI2RlZmluZSBVU0JfT1RHX0lETU9OCQlCSVQoNCkNCisjZGVmaW5l
IFVTQl9PVEdfSURNT04JCSh1c2IzLT5yOWEwOWcwMTEgPyBCSVQoMCkgOiBCSVQoNCkpDQotLS0t
DQoNCkFib3V0IHJlZ2lzdGVycycgb2Zmc2V0L2JpdCwgSSB0aGluayBoYXZpbmcgc3BlY2lmaWMg
bWVtYmVycyBpbnRvDQphIG5ldyBzdHJ1Y3QgaXMgYmV0dGVyIGxpa2UgYmVsb3cuIEJ1dCwgd2hh
dCBkbyB5b3UgdGhpbms/DQoNCnN0cnVjdCByZW5lc2FzX3VzYjNfcmVnIHsNCgl1MTYgZHJkX2Nv
bl9vZmZzZXQ7DQoJLi4uDQoJdTMyIG90Z19pZG1vbl9iaXQ7DQoJLi4uDQp9Ow0KDQpzdHJ1Y3Qg
cmVuZXNhc191c2IzIHsNCgkuLi4NCglzdHJ1Y3QgcmVuZXNhc191c2IzX3JlZyByZWdzOw0KCS4u
Lg0KfTsNCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0K
