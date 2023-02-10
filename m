Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1514369261B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Feb 2023 20:15:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232762AbjBJTPR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Feb 2023 14:15:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbjBJTPQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2023 14:15:16 -0500
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2094.outbound.protection.outlook.com [40.107.255.94])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23B5D7A7D5;
        Fri, 10 Feb 2023 11:15:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FSdfx3gXwFIvIqkq1/vQRIbDluveEXUM7P3rwntwM5AJy4I1zoo2Edxe3BSjBmd529prUbtxuMGg/gJ4CJRtJxJ3i9rMLgmwPn8Csu+EI49d5QqBfkfIHl/ZgSmUQKRxwMiuo8FawqKvJsL1ENlQ7UF2wmXQtxkOVMM+7SdJ3+ffBBOdjoLkZQEFXV4sIvlDOqEPoGyEx3bcIKztirbGBAuCYIoJCSZrqNX36LQNHUDAxyzfGHfXYsRzVzVQpIS4G0mwE5eUsQu0JTKoUJ2e0TL1rZzH24QzIO/b7UN6mayUUDw4oUr5l/jPkYYkSqWlzy1BpRFhxiGM0554PwL4fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XwG90VSYMT8+ij5JgsTyKxf0Tpw36lIuspC/swrPkyc=;
 b=NkgQconKMsa7/EhNFSKiHU9W7qHqnV8GaR0+tV78D6Woc5DhIWadSGifMbIVvzKSchMHJgEjiGZfr1UOkYZZySbW8c4o4QKk7XkiXsJ/RDmlpKrg0/r6JjwatQFk/PK0z61StlpXhYcs0ic5HI/0rzp6/CsoBFp+NtQyxt0KBaqSJRxoKpakDolRZZx8zyWqc3Ek+uNYHDwRxuvhvjiGltJkJQ+nxdWaiGKbYaILXwEiHACjO/Uk/+uK2KeHwM/Zu+CeMauj2M5rXIa2JyTz8P2VGPcD5jttXfZ0UKWfI9kImQCK0+fmuFi8eLyh4z5LWnc4ke5Jgqd1bvw89hjLHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XwG90VSYMT8+ij5JgsTyKxf0Tpw36lIuspC/swrPkyc=;
 b=Mau6dcscBwDwAPkaejtkb2plm4QaNkLwnbHl12LsdV0Bm65+VyGJeZ3Kor2pciQ/HpAF3V4pONcGj2lfUZuai4WG/TCLuCLFfHoKjXk82gWnEm9sFt3tFzRXU2cx/9XYpSCQBy8YbvfQwAyyls4HBXffuGehC2ycRT3WleiZdxI=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB11141.jpnprd01.prod.outlook.com (2603:1096:400:3bd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Fri, 10 Feb
 2023 19:15:10 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%8]) with mapi id 15.20.6086.021; Fri, 10 Feb 2023
 19:15:10 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     =?utf-8?B?SWxwbyBKw6RydmluZW4=?= <ilpo.jarvinen@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial <linux-serial@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 3/3] serial: 8250_em: Add serial_out() to struct
 serial8250_em_hw_info
Thread-Topic: [PATCH v2 3/3] serial: 8250_em: Add serial_out() to struct
 serial8250_em_hw_info
Thread-Index: AQHZPWY1DPXNGdAFkkCRWvMr19HFFK7IVICAgAAAkkCAAC9FAIAABUbQ
Date:   Fri, 10 Feb 2023 19:15:10 +0000
Message-ID: <OS0PR01MB59221B2945D5751E34F1ED4986DE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230210154140.338352-1-biju.das.jz@bp.renesas.com>
 <20230210154140.338352-4-biju.das.jz@bp.renesas.com>
 <954bb490-b516-6624-5bb9-e82434fc95f0@linux.intel.com>
 <OS0PR01MB592222F997B7CB5976B7618186DE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdVMiMhNXRUDDS1XsKVF--p7F42t1LXNokJi0sDhvpeSig@mail.gmail.com>
In-Reply-To: <CAMuHMdVMiMhNXRUDDS1XsKVF--p7F42t1LXNokJi0sDhvpeSig@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB11141:EE_
x-ms-office365-filtering-correlation-id: 36799c28-0c3d-4e1d-f774-08db0b9b2122
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7JYaqd6ZuRknfV/bDrPeeua+5NAj5U03e6cm5vuLxGv1wp8Ff5BF+maHD/oghkCfABZ0k3M1QEIq1Jf3pLuksrBqd8rAcPJdITX00LqUv1LWWA/PzeoCUCusMxfnp/ARK1FbFiEvfxiwuOufmlhz/+yAy7Ya6nsUEdSR9o4rBoGelCs9KAk0mCaKeaa6sR2H8AfWueXCYpGgYz+mCiaqIxVPG8/dNGa5IS8yCvcUjY4Wba8e/xy9RjXlAjbo0t8PmsLl6+yqvF85/vQIeLonyOD6NN6NTLZCXUShn5W/UVuC3zmVoYT8ulseZdd0MwtptM+G3iv7e6Yd8iv03IitY4zXGGZK+os7nDoCkCFcQhRoIki0kVrpT9d9tGxuqp2cxBkAEOyTSezXB1VKUgCbye13rcc5N+HW3s3pYZhnGKY1vobUe4PY+V1QYtGjU3fJ6shH7AXPjn1Wv0VJ7ltDsC4B/MmcjE8R49707baXVAxCYCKHtoaghwt8kyp5sMlKmR4APE1LJTw2+Ltivkn7Cbrr+waouT9o0UkRv3KWIs+FecHQr3y2WqPfE3rmb+AIKGsExUn5CIHql5IE2hUCmvJ/mqaITA48ojnRa1Sy2RDFrn0c9yawyC+GfcXFfWNdklJ7d36SuSHMfR4G8LJt7P2P+TF4LzFsLZ3ZrnLvmhDT1qm18FP7o2UfENhXyNIGB1ZyOi1gI2RqnNGa+BPZMA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(136003)(366004)(396003)(346002)(451199018)(71200400001)(7696005)(478600001)(83380400001)(55016003)(38070700005)(86362001)(33656002)(122000001)(38100700002)(53546011)(6506007)(9686003)(54906003)(41300700001)(8936002)(52536014)(316002)(64756008)(6916009)(8676002)(4326008)(186003)(26005)(5660300002)(2906002)(76116006)(66446008)(66476007)(66556008)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K2VvY2pRLzhpK2xnOWRnaXBRU0Vkdng0MDdRMGp5cFYvZGlFZXpSZ3BJRk55?=
 =?utf-8?B?bDNoY2l2SDlaNUJURW5BN0NLOHltZTJKU1F3MDBFVmJJNGdQaVY2YWplYUxu?=
 =?utf-8?B?ZGNDeUJib2ZITyt2Zk5nR3N3V1drb3QvZExLK1FCYTFrQ3puWGFRcUk3SGFQ?=
 =?utf-8?B?c2wrZkFuaXhSUTlLc0k5TzhVVENjeDk5SURYZ2hxbFkvNXowTUZRN0phZE9w?=
 =?utf-8?B?RjZlb3ZESHROU2dzUytQNzR1MVRRcVdrUGRLc2VPUXRZRVlSRlgrVVNSN3lr?=
 =?utf-8?B?Smt4UFpKcUQzWWlDdjdKcVVqTENubkVjbWZ0cDFCeGZ2VmZobXRaSGJQL0ZH?=
 =?utf-8?B?TjlHKzdoTWYwc2xhWWFPZVIzZ3licDJFRURsWkpWQ1BDV3FIMVovQkpLTXdV?=
 =?utf-8?B?YU5lUUo2YjRMYVlRRVhMZHRpNndDTUp6MTh2VEVmU0R1QlE5WEx2NmIrTzVD?=
 =?utf-8?B?Mk12dWxjOWRRVU9jeThOK3F6a0F6R3BRQzJVajdlWmt1djJjTi80cWpvRVRU?=
 =?utf-8?B?ZUJTcTVyUE85NENvaEhRVU1CYzk1WisvTitxaGdFQmJXUnFLR3BPWUpFQjFn?=
 =?utf-8?B?ZlFpWXdFdHE3Um1PalRQbGUySW1ZaG00MytiUmtlTXcxWlNoYlNhYmhwNDl5?=
 =?utf-8?B?dGVkUFJOallxeTVQOUdOY3dTMHlVZktqZzdjTFBZN0hUZGRxNXFWbUtqcnUr?=
 =?utf-8?B?TmZuVFAwUE4yWDJ1Qm9kQi9WL2ZueW10YjdWMERZRE1VL2hBM0cxS2Naa05q?=
 =?utf-8?B?dzJGN1lIZG5ld1A0SkVITFVvQzNic3ZuNHFUYXJ5KzQzellIZDFuRlY1WUF6?=
 =?utf-8?B?UkhMejNnbHVydWZQeFA4MllzaFZtMDNISUtZaDErcDhabXRSaEdjdEhCWFJh?=
 =?utf-8?B?a0Z5ZkZ6WHpiYTd0eGlMSVlzbm1BM1J5T1IxZnBWZ1EvMHB1SzY2aExFTFh1?=
 =?utf-8?B?RWw4b2RjNWhpRytuY3JzaTVFNlZLb1NMYVJ6aHdJQkc0dW5LOW52SlFHRFFp?=
 =?utf-8?B?TlBZWm5HNUVteHNBeW1OZFRwOEx3dlZZKytSajdDMmJERkFMekM0Y2ZxdW9w?=
 =?utf-8?B?bDlhc3NpZEtndHJ4dG0zOFJqZmtXOWpQdjZMVVRmNUFhdE9reWhDMEQvNGZ2?=
 =?utf-8?B?eUY5RysrZ3JMclVqZEpYUkcwcWJqSXo0R2xUQ2NJMFBBcmMxdkhDditzK2px?=
 =?utf-8?B?MjRkYUF3Z3BtMU4xRTMyZDJpRTZXcmQ1WXhRNGF5ZUJlbWUrWml6dXRGc2pV?=
 =?utf-8?B?Y2lxc0hkWjllUHE2bUc2TW5HcVllYWYvaHRYT1h6ZEJDbzVYZTdIUnRBM0lI?=
 =?utf-8?B?Y3BWUURneGx6UlB0bGdUYWNkV0t2ZXcvTnFZdWZubkRCNmRnUkxNY0R4MFFL?=
 =?utf-8?B?RVhDcHVZbWtkcWt3SlVzOFhTaDFmNXl0VXlXOHdMZXRJMmx0OHd3RmtOU0I0?=
 =?utf-8?B?SWdqRjdVZk1wTzUxd2lKNHU0WUNrUjRsbGIvWStER3p4NmZOU2hZcjg5Yng4?=
 =?utf-8?B?OW5vVnlucDFnc1BobGVvTmxvajV2L3BYV3NXam1jMmdEVHhvdGpZNE44ejBY?=
 =?utf-8?B?TmJpN3F0bHhSaGRGY0w4L1gvSzFUaVNqdnJBSjVlSmdYM3l2MUwvcnJ4b0JI?=
 =?utf-8?B?SmlOWlVRUVZEaU5jaXlldXFhTDVkZzhEVHB6NFNVN3Z0UElCcjI2N3ZoeUNQ?=
 =?utf-8?B?RzZGK1RYVzc5VSt3RC92cldaNnpPbjMvU2xBSm1pbjJqdXYwNG03ZkpSdHZa?=
 =?utf-8?B?Yk1aeHg5MUcyUXNSYXJ3dEZFa21YSVEzQXBacWF5TmYzUnFRTXhkOE4yRXFT?=
 =?utf-8?B?T29KWTRUUGlVMXFjZnZYZTZtT3RUYytEbDJ2ZXljT096S3hjQVNpUTBQTEh3?=
 =?utf-8?B?dCs4Mnh3QVByb2RYd2ljQVZHei9LeUhWRHRVWjBDUkg4dWpqNGVMdEpyeUhY?=
 =?utf-8?B?Tm15NnF1VVJEZEFBNEtibmMvZUdrSmRqY0s2L1BCRDNKeGJjUzQ4Smsva3ov?=
 =?utf-8?B?U0xPZU1uOURtVWFKeDlNZzhOQUJOY3FsMWNjMjdGU1hsVm5OMHlydzAwcVlE?=
 =?utf-8?B?VnlUZGdaM2xEeElmdU9jUTNjNUszbUJSaGJJZktrb0g4YzhmVzJLYmVIQXE4?=
 =?utf-8?B?SWtneFR0SzFwdWhrcERLUmFaNlQxMERpbUdGcWI0ZVZVZUpqY3FpUUx5b21y?=
 =?utf-8?B?aEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36799c28-0c3d-4e1d-f774-08db0b9b2122
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2023 19:15:10.6208
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M+MP+pKJ5GoI8wJtj7vwqSn3wvkc3Ri8elmt4pPhS0SYRyssc6njKxKyMR4DZPpBc7L0B+RWzrEcaxcrBOa+kOoSIh3Je2HBXN7TBOOC86I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11141
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgMy8zXSBzZXJpYWw6IDgyNTBfZW06IEFkZCBzZXJpYWxfb3V0KCkgdG8gc3RydWN0
DQo+IHNlcmlhbDgyNTBfZW1faHdfaW5mbw0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIEZyaSwg
RmViIDEwLCAyMDIzIGF0IDU6MDEgUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMu
Y29tPiB3cm90ZToNCj4gPiA+IE9uIEZyaSwgMTAgRmViIDIwMjMsIEJpanUgRGFzIHdyb3RlOg0K
PiA+ID4gPiBBcyBwZXIgSFcgbWFudWFsIHNlY3Rpb24gNDAuNi4xLCB3ZSBuZWVkIHRvIHBlcmZv
cm0gRklGTyByZXNldCArDQo+ID4gPiA+IFNXIHJlc2V0IGJlZm9yZSB1cGRhdGluZyB0aGUgYmVs
b3cgcmVnaXN0ZXJzLg0KPiA+ID4gPg0KPiA+ID4gPiBGQ1JbNzo1XSwgRkNSWzM6MF0sIExDUls3
XVs1OjBdLCBNQ1JbNjo0XSwgRExMWzc6MF0sIERMTVs3OjBdIGFuZA0KPiA+ID4gPiBIQ1IwWzY6
NV1bMzoyXS4NCj4gPiA+ID4NCj4gPiA+ID4gVGhpcyBwYXRjaCBhZGRzIHNlcmlhbF9vdXQoKSB0
byBzdHJ1Y3Qgc2VyaWFsODI1MF9lbV9od19pbmZvIHRvDQo+ID4gPiA+IGhhbmRsZSB0aGlzIGRp
ZmZlcmVuY2UgYmV0d2VlbiBlbW1hIG1vYmlsZSBhbmQgcnovdjJtLg0KPiA+ID4gPg0KPiA+ID4g
PiBETEwvRExNIHJlZ2lzdGVyIGNhbiBiZSB1cGRhdGVkIG9ubHkgYnkgc2V0dGluZyBMQ1JbN10u
IFNvIHRoZQ0KPiA+ID4gPiB1cGRhdGlvbiBvZiBMQ1JbN10gd2lsbCBwZXJmb3JtIHJlc2V0IGZv
ciBETEwvRExNIHJlZ2lzdGVyIGNoYW5nZXMuDQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYt
Ynk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+ID4gPiA+IC0t
LSBhL2RyaXZlcnMvdHR5L3NlcmlhbC84MjUwLzgyNTBfZW0uYw0KPiA+ID4gPiArKysgYi9kcml2
ZXJzL3R0eS9zZXJpYWwvODI1MC84MjUwX2VtLmMNCj4gPiA+ID4gQEAgLTMxLDYgKzM1LDQwIEBA
IHN0cnVjdCBzZXJpYWw4MjUwX2VtX3ByaXYgew0KPiA+ID4gPiAgICAgY29uc3Qgc3RydWN0IHNl
cmlhbDgyNTBfZW1faHdfaW5mbyAqaW5mbzsgIH07DQo+ID4gPiA+DQo+ID4gPiA+ICtzdGF0aWMg
dm9pZCBzZXJpYWw4MjUwX3J6djJtX3JlZ191cGRhdGUoc3RydWN0IHVhcnRfcG9ydCAqcCwgaW50
DQo+ID4gPiA+ICtvZmYsIGludCB2YWx1ZSkgew0KPiA+ID4gPiArICAgdW5zaWduZWQgaW50IGll
ciwgZmNyLCBsY3IsIG1jciwgaGNyMDsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgaWVyID0gcmVh
ZGwocC0+bWVtYmFzZSArIChVQVJUX0lFUiA8PCAyKSk7DQo+ID4gPiA+ICsgICBoY3IwID0gcmVh
ZGwocC0+bWVtYmFzZSArIChVQVJUX0hDUjAgPDwgMikpOw0KPiA+ID4gPiArICAgZmNyID0gcmVh
ZGwocC0+bWVtYmFzZSArICgoVUFSVF9GQ1IgKyAxKSA8PCAyKSk7DQo+ID4gPiA+ICsgICBsY3Ig
PSByZWFkbChwLT5tZW1iYXNlICsgKChVQVJUX0xDUiArIDEpIDw8IDIpKTsNCj4gPiA+ID4gKyAg
IG1jciA9IHJlYWRsKHAtPm1lbWJhc2UgKyAoKFVBUlRfTUNSICsgMSkgPDwgMikpOw0KPiA+ID4g
PiArDQo+ID4gPiA+ICsgICB3cml0ZWwoZmNyIHwgVUFSVF9GQ1JfQ0xFQVJfUkNWUiB8IFVBUlRf
RkNSX0NMRUFSX1hNSVQsDQo+ID4gPiA+ICsgICAgICAgICAgcC0+bWVtYmFzZSArICgoVUFSVF9G
Q1IgKyAxKSA8PCAyKSk7DQo+ID4gPiA+ICsgICB3cml0ZWwoaGNyMCB8IFVBUlRfSENSMF9TV19S
RVNFVCwgcC0+bWVtYmFzZSArIChVQVJUX0hDUjAgPDwgMikpOw0KPiA+ID4gPiArICAgd3JpdGVs
KGhjcjAgJiB+VUFSVF9IQ1IwX1NXX1JFU0VULCBwLT5tZW1iYXNlICsgKFVBUlRfSENSMCA8PA0K
PiA+ID4gPiArIDIpKTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgc3dpdGNoIChvZmYpIHsNCj4g
PiA+ID4gKyAgIGNhc2UgVUFSVF9GQ1I6DQo+ID4gPiA+ICsgICAgICAgICAgIGZjciA9IHZhbHVl
Ow0KPiA+ID4gPiArICAgICAgICAgICBicmVhazsNCj4gPiA+ID4gKyAgIGNhc2UgVUFSVF9MQ1I6
DQo+ID4gPiA+ICsgICAgICAgICAgIGxjciA9IHZhbHVlOw0KPiA+ID4gPiArICAgICAgICAgICBi
cmVhazsNCj4gPiA+ID4gKyAgIGNhc2UgVUFSVF9NQ1I6DQo+ID4gPiA+ICsgICAgICAgICAgIG1j
ciA9IHZhbHVlOw0KPiA+ID4gPiArICAgICAgICAgICBicmVhazsNCj4gPiA+ID4gKyAgIH0NCj4g
PiA+ID4gKw0KPiA+ID4gPiArICAgd3JpdGVsKGllciwgcC0+bWVtYmFzZSArIChVQVJUX0lFUiA8
PCAyKSk7DQo+ID4gPiA+ICsgICB3cml0ZWwoZmNyLCBwLT5tZW1iYXNlICsgKChVQVJUX0ZDUiAr
IDEpIDw8IDIpKTsNCj4gPiA+ID4gKyAgIHdyaXRlbChtY3IsIHAtPm1lbWJhc2UgKyAoKFVBUlRf
TUNSICsgMSkgPDwgMikpOw0KPiA+ID4gPiArICAgd3JpdGVsKGxjciwgcC0+bWVtYmFzZSArICgo
VUFSVF9MQ1IgKyAxKSA8PCAyKSk7DQo+ID4gPiA+ICsgICB3cml0ZWwoaGNyMCwgcC0+bWVtYmFz
ZSArIChVQVJUX0hDUjAgPDwgMikpOw0KPiA+ID4NCj4gPiA+IFBlcmhhcHMgaXQgd291bGQgbWFr
ZSBzZW5zZSB0byBpbnN0ZWFkIG9mIHVzaW5nIHJlYWRsL3dyaXRlbCgpDQo+ID4gPiBkaXJlY3Rs
eSB0byBjYWxsIHNlcmlhbDgyNTBfZW1fc2VyaWFsX2luL291dCgpIHNvIGFsbCB0aGUgb2Zmc2V0
DQo+ID4gPiB0cmlja2VyeSB3b3VsZG4ndCBuZWVkIHRvIGJlIGR1cGxpY2F0ZWQgaW5zaWRlIHRo
aXMgZnVuY3Rpb24/DQo+ID4NCj4gPiBIQ1IwIHJlZ2lzdGVyIGlzIG5vdCBhdmFpbGFibGUgZm9y
IGVtbWEgbW9iaWxlLiBJcyBpdCBvayBpZiBJIGp1c3QgZG8NCj4gPiByZWFkbC93cml0ZWwgZm9y
IHRoYXQgcmVnaXN0ZXIgYW5kIHJlc3Qgd2lsbCB1c2UNCj4gc2VyaWFsODI1MF9lbV9zZXJpYWxf
aW4vb3V0KCk/Pw0KPiANCj4gQWNjb3JkaW5nIHRvIFIxOVVIMDA0MEVKMDQwMCBSZXYuNC4wMCBp
dCBpcyBhdmFpbGFibGUgb24gRU1FVjIsIGFuZCB0aGUNCj4gbGF5b3V0IGxvb2tzIGlkZW50aWNh
bCB0byBSWi9WMk0uDQoNCk9LLCB3aWxsIGFkZCBIQ1IwIGFzIHdlbGwuIE5vdyBvbmx5IGlzc3Vl
IGlzIHJlbGF0ZWQgdG8gZmNyIGFzDQp0aGUgdmFsdWUgb2YgVUFSVF9GQ1IgYW5kIFVBUlRfSUlS
IGFyZSAyLiBCdXQgdGhlaXIgYWRkcmVzcyBvZmZzZXRzDQphcmUgYXQgMHg4IGFuZCAweGMuIFNv
IEkgbmVlZCB0byB1c2UgcmVhZGwocC0+bWVtYmFzZSArICgoVUFSVF9GQ1IgKyAxKSA8PCAyKSk7
DQpmb3IgcmVhZGluZyBGQ1IgYW5kIEkgd2lsbCBhZGQgYSBjb21tZW50IGFib3ZlIGl0Lg0KDQov
Kg0KICogVGhlIHZhbHVlIG9mIFVBUlRfSUlSIGFuZCBVQVJUX0ZDUiBhcmUgMiwgYnV0IHRoZSBj
b3JyZXNwb25kaW5nDQogKiBSWi9WMk0gYWRkcmVzcyBvZmZzZXQgYXJlIGRpZmZlcmVudCgweDA4
IGFuZCAweDBjKS4gU28sIHdlIG5lZWQgdG8gdXNlDQogKiByZWFkbCgpIGhlcmUuDQogKi8NCg0K
Q2hlZXJzLA0KQmlqdQ0K
