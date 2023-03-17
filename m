Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC3B06BEA71
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Mar 2023 14:47:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231132AbjCQNrb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Mar 2023 09:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbjCQNra (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Mar 2023 09:47:30 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2121.outbound.protection.outlook.com [40.107.114.121])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F11407C3FF;
        Fri, 17 Mar 2023 06:47:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WmZ5d+pu04DfAticRiTz72DcTtXcwElWYjq2KLppRJJfsFdQzKbSgq0N9DBDZ0N3blrq3x5WuVz7SYgA9VwM0U8qSm+m6MbfiLX9CN/FIX9JUJ+tTy+d3E/PWbPlcxeTJlIdFFQRz2jxnimfLbPttHfaafd2udz9XT4ZgilVq7UDqOwLIbPIgQoN7R3O6KZc3f1ILnQ7DvOSUoMwHNVYxgg8hISXz/SAz6ZcZ3CmD5wHi5XJgTdsoLanqgjXoUMyXlBvEi2hVNY/bfesunhGfa6sL1KNPFoox6J6FuUo5pkCkoDL8uN6ZZneRdG5d7k+Eqm8aRtGD9vw9gvXvzOBYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L0CbNrG9Ba3kUnLI+QMpU8dwtdUGS8z/BIFSgIQJJLw=;
 b=J/yN4GEOiab6mznX3OoSJC8CJOLZwhaFua9QSxUoHoJim6GndOQnQojr+sQyH63iz4JkfFHjdyi25jD2z72iLttAlUI2TuaA6StCdCn6xgt1KvOQKhHUu+p8DL+mTLNU15m+N7+L3feynw7UN8LmDU8oX2dzpteLWNZXw6D3QBZ068TSJatudKZHXaJSrP8TXbamQiHHen45+CcwjMJmZbca9n2MWDlA1I7jFPMvklUvhwCI4AbN5ifxwA5Co1aJrnYlPGwni9IBdcROAYWvPI+efImHQ0JwZp9w+qVdaMQW2lAvzAW+3KtgxED45zMo/U/M/Kbljmg6GDsAautOTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0CbNrG9Ba3kUnLI+QMpU8dwtdUGS8z/BIFSgIQJJLw=;
 b=ZDYM+iG9JdUUP3YUbPZzGOYfL3qRqR0m6nv96zAsO+aJapJFJHIVd3zml4ARlsjM+ZA+SsD+qHaaRm4CCBkX4dly9un0rbqJJ9/5imtVX5TAktx+UXB2dN08qI8NnS6TlaAXfsz+ewisnsqCoEVQCnH7bimBxVH4tlirsDczKpQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB9888.jpnprd01.prod.outlook.com (2603:1096:400:22a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 13:47:24 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207%7]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 13:47:25 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Stephen Boyd <swboyd@chromium.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
Subject: RE: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt handler
Thread-Topic: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt handler
Thread-Index: AQHZWCCS4vXtQ/fzW0yUXUaCYffr6a79lBkAgAAA5oCAABuIgIAA62sggAACXICAAABMkIAAEAYAgAABSMCAAAg9AIAAQyAQ
Date:   Fri, 17 Mar 2023 13:47:24 +0000
Message-ID: <OS0PR01MB59220E5FA2CDC27108DB926C86BD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230316160118.133182-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVX=sM-1y+-3PQDsjf8K3nLoS4WfSYfv6UAP=92T_oHaQ@mail.gmail.com>
 <OS0PR01MB5922EA7DC64F0D2C36B490A986BC9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXgwkJ2O7y98HW6n8SOgbuEx1uFrt1Jc-X2CzpC3y1P0Q@mail.gmail.com>
 <TYCPR01MB593334BB3847CCC45A1B6C7286BD9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <CAMuHMdUN=0aJ-7huv0XrhG3LMu8q_SEuqHU48ytTgGAYEjng5A@mail.gmail.com>
 <TYCPR01MB593390150CAC755AE540D7D586BD9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <CAMuHMdVmz_JNmC7Fk03zpaZY+MiBAgvFUc1Tnr+w=wHjbgeSug@mail.gmail.com>
 <OS0PR01MB59228F2CA5A579AEE793A67486BD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdW5jpnFBsHPbTE9QEbEYUNW9S0Qz93gg3QusLe0aSSbGg@mail.gmail.com>
In-Reply-To: <CAMuHMdW5jpnFBsHPbTE9QEbEYUNW9S0Qz93gg3QusLe0aSSbGg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB9888:EE_
x-ms-office365-filtering-correlation-id: 0a244378-0961-4cee-4ab3-08db26ee23f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UBa3D0i8c4gpNdRdB1Jb/2L+3B7peLiO3uUDcImrP6gYqAp7DPLLcpRf6bg02D7ScxSDwr8MRbmWztWn4veDsk8XrXClWQi8cI+kRUmzxqyxSLpacNfHlkv/xSU4rXKMzOP02HfhSwp6DeedEd7ey1HHfiyD7e79XhgQWTV1LiQCEllAoc4gf+mJSy7P9j3RkKIeqlrLCbvIreKOBdL/BuD2Gor77uLjtSYm1KC+tQlsE3kkjl8Wq2G4lj53xlBtVrurDewdRmyx0aJSkW/lE+SyM8Z1pEie4XdLR4+Kkj0yTynJUAY3gF4aAEs14Zz9gicvUQHwE1dT639swoYlVs5a2o1iG2Go49kWBPcVaxFJEn8d4dLchT9fcNg2wlA/NrqFEipWmjgZjN96MC4YDDeiwlBZQW+IO0EjiA8iR0R8HsL4DG8UXGAOU/YBW8UebjpN+C4tPs7VXf3SP4qSPc35mDhWDzRK5LEFTaBg9tsUQJ1fXj5/zU1CPpNiVTPZDn8ZrsImfEOqzgNczcD4ucTAhfqBscNMv1GDVEeZpjBk6zyZilEqHgkL+AQl293Tzh9c3Ql3M7zfIvg9gLKyHBPlCnCzpm5v3fwArpFuKQKiYdWdX0iEKh5gpH1p5Gv5NQzwVqyPvQd8YkaSMRbaab3e/9UCBbOJ47D0Dn2Dl4HCBKeA8A0c7p2lnIWv5/8n
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(451199018)(7696005)(71200400001)(186003)(966005)(83380400001)(478600001)(54906003)(316002)(8676002)(64756008)(6506007)(9686003)(66476007)(66446008)(66556008)(66946007)(53546011)(76116006)(6916009)(4326008)(52536014)(41300700001)(8936002)(5660300002)(38100700002)(2906002)(122000001)(55016003)(38070700005)(86362001)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QjVUM2h1MGtnTitPWTFGdW5YSTgxNHlvbjRwY2hJNzd0eW1hZWsyd2pPNklH?=
 =?utf-8?B?S0x6WlE0a1RxVFZCck9RcVNJK2tlbmN5VU45M05XYktQdmg5OTl1UjdiVWxz?=
 =?utf-8?B?YXk2MFFyNDgvSTlqeDZDV0dQcVVzVmM0SmlGaThXaEVZWHd2VjFVeGlLWHlJ?=
 =?utf-8?B?c2dtaGE1MW9Ed29yN292MXBLbjgzWi92bW1pWGNPZVcxeE1tdmZadkVleXE4?=
 =?utf-8?B?WkpIOTdFU0tjUnB1bDJPNUpqTjBqQTYzK2pGazFRQzMwNkZBMk1lbkY2ZDJE?=
 =?utf-8?B?byszU0xFb1N1UW85T3NXWUJXUUZvZlR2c0I1c0FwMThUd04yemx1Rlc3K2FW?=
 =?utf-8?B?Ykk4dEJYWEJVQnhLTHlwY1lUa3RxVzBIQ3EzNGRZRmhqZ1BySThYTlNsUzlT?=
 =?utf-8?B?eVQveGJnZXF5VTZLYWdsdHVkNG9JT1YzL3o3V0UvbzVwWnZINnFmZ3hqV3M5?=
 =?utf-8?B?NFN4YWlwdklySmdrUjBtK0JKOFJkd0tvL25BYXJMb0lTYUlJUlR3VXJqQVhk?=
 =?utf-8?B?RDdGTUFGc0VaTkgzZFh5b2tTY1NxdlpSZ1ZmMSt4dDBZbXJUR1BMclZ5eGJH?=
 =?utf-8?B?RTdiK244RGd3Y0RlNmNCUkR6cjRXZ3ZUSDY0Rys5RUdIRXBhZGhIQTFVclFQ?=
 =?utf-8?B?RTNTNkFYQ1FsZnFtWm5PeDEvOFRjRms0STFsVTF4ZUE3SzU5UlJSMEFmcWdB?=
 =?utf-8?B?NjdhNDNGVk1wd2hvdTVxTlRlOTltVkxYZUYwamFsR2I4eCtLL0NHWUpQL2wz?=
 =?utf-8?B?bmdJVmRyWm4wRU1rRmVoeWtreTRCQWtyUjQzNlNINFpyWkN1WmZGU1dGaHVJ?=
 =?utf-8?B?RlpsME92VjhoR3RWNlBKRG5MM2xxZnNkWGRwdTdrWURpZU04dytsZDJTbEpE?=
 =?utf-8?B?UFNsYjR4ZVhBdHYzRm43dHNUV3FGTjdNRWlENTV1M0krSVI1S3B3NDlOcUE1?=
 =?utf-8?B?ZGRicFFqMXcxbitIZ1RuVThNWExSTGtjOExDWGJRYnUyWWJLd3ZjNFNEZVEx?=
 =?utf-8?B?UmdwejhvQzJuT1VGSHJhMmVLcDV2Zm84M0I1S2hYb25YbVJMd3BPSjUrWms2?=
 =?utf-8?B?QisrKzB1ZVJ0Y3E3UUxWOXFmajJ5dmlGQUdJSmlYYjgzWlhLRXBEUW1aYXln?=
 =?utf-8?B?SEhDaVBRSjJSTUpxYUdvUTE4b3JpQnhwUkduQ012M3JSOXZoUG90RTUrV3dT?=
 =?utf-8?B?YVkva01vOG5HdEFaWjVGRTdVZVBSOHZzak45K0J4NVB2TFNkem5tQVowK1dM?=
 =?utf-8?B?QTdvRW5iTWtQQyt6dmVJZTM1bDYxMjIzRkNjczZCL3NLSjVsRlFoSU84VE5G?=
 =?utf-8?B?NFlvVzhBREMvYzFoQTBkb3BYTXEwbWF0ZlZTeDFnOExkc29rd0JNVHVZdGVr?=
 =?utf-8?B?dHZ5enVuaFJvb0lMcldFUFB1NkxRT2RNWHZCNTB3ZS9UZGRWVll6aVJIaC9W?=
 =?utf-8?B?OW5VcFIvUVdPcEtnTjV2S0x6eEtsL0ZITnlPblVaTk1TTmZtNDdwVW1HYVBC?=
 =?utf-8?B?YnY0WmFhSysrQ2VGSnJKUUZXUloxM0dkVjZxbnBQd1BlMTc1UTVwd3NuSkxa?=
 =?utf-8?B?eTk2RzVhbUNFdHNDR3dYMzlyM3FESW00Q0hLVmhWL01wb0M0MFI5bXlnMnVG?=
 =?utf-8?B?UEViQmVhVmlhbUYzazNXZm9hbjBocmEyNk53Y2tnT2pwVkZrS1pLbDh3Tm9I?=
 =?utf-8?B?YzQ0UnkxbVRTbU1OU2UvNGJXNFZDMWJUWWRxN3lGQ2o0VXl4dU1lZTgzWEhQ?=
 =?utf-8?B?NHR2OWhoUHFrUGJtTFJjbzZWNzh1ejhXYUZ5NmJzeGNsUUNEeDhjN1ZWZjZG?=
 =?utf-8?B?R1VDVllFY25YZFZybmIwS29JNTdCNU5sOWlCWSs2WXRRWk0rVThHalZMVmFi?=
 =?utf-8?B?VlBpSkFNQ09EeDJpKzM4dU02NVZ2Wkx6cVVJQzRTSkMwMjlQVEhJNXpSeXlB?=
 =?utf-8?B?WkVWeEtrSVQwVHNwM1ZtN2lXSEJLL1pXcFVMbngzNUhTdU9PQzNHL2Z5Ykcv?=
 =?utf-8?B?ZVFWcGM1YmxidXdOUC9SMjlaWHRvd0F4S2VxcXhIbzhML2hiRnphZFVUMTND?=
 =?utf-8?B?OStUeUtkdzF4OWNRQ1NVTFBtL2R6ckU0ZERJMVBPRjlEMXlQblJ2RmN0WlIw?=
 =?utf-8?Q?Y+Mw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a244378-0961-4cee-4ab3-08db26ee23f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2023 13:47:24.9963
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: it1wOzc6rmNn1N/85NlzIOr7wpThyTk7icl2/Y7bl/rZm18mnKy+mqfZ1viAzh5GUyN/c2/LKI7l/OqimPzNweHQSwgbnk3patLNInhZqwQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9888
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0hdIHR0eTogc2VyaWFsOiBzaC1zY2k6IEZpeCB0cmFuc21pdCBlbmQgaW50ZXJydXB0IGhh
bmRsZXINCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBDQyBsaW51eC1zaA0KPiANCj4gT24gRnJpLCBN
YXIgMTcsIDIwMjMgYXQgMTA6MTXigK9BTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNh
cy5jb20+DQo+IHdyb3RlOg0KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSF0gdHR5OiBzZXJpYWw6
IHNoLXNjaTogRml4IHRyYW5zbWl0IGVuZCBpbnRlcnJ1cHQNCj4gPiA+IGhhbmRsZXIgT24gRnJp
LCBNYXIgMTcsIDIwMjMgYXQgOTowOOKAr0FNIEJpanUgRGFzDQo+IDxiaWp1LmRhcy5qekBicC5y
ZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSF0gdHR5OiBz
ZXJpYWw6IHNoLXNjaTogRml4IHRyYW5zbWl0IGVuZA0KPiA+ID4gPiA+IGludGVycnVwdCBoYW5k
bGVyIE9uIEZyaSwgTWFyIDE3LCAyMDIzIGF0IDg6NTnigK9BTSBCaWp1IERhcw0KPiA+ID4gPGJp
anUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+ID4gPiA+ID4gU3ViamVjdDog
UmU6IFtQQVRDSF0gdHR5OiBzZXJpYWw6IHNoLXNjaTogRml4IHRyYW5zbWl0IGVuZA0KPiA+ID4g
PiA+ID4gPiBpbnRlcnJ1cHQgaGFuZGxlciBPbiBUaHUsIE1hciAxNiwgMjAyMyBhdCA1OjM04oCv
UE0gQmlqdSBEYXMNCj4gPiA+ID4gPiA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3Rl
Og0KPiA+ID4gPiA+ID4gPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSF0gdHR5OiBzZXJpYWw6IHNo
LXNjaTogRml4IHRyYW5zbWl0DQo+ID4gPiA+ID4gPiA+ID4gPiBlbmQgaW50ZXJydXB0IGhhbmRs
ZXINCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+IE9uIFRodSwgTWFyIDE2LCAyMDIz
IGF0IDU6MDHigK9QTSBCaWp1IERhcw0KPiA+ID4gPiA+ID4gPiA+ID4gPGJpanUuZGFzLmp6QGJw
LnJlbmVzYXMuY29tPg0KPiA+ID4gPiA+ID4gPiB3cm90ZToNCj4gPiA+ID4gPiA+ID4gPiA+ID4g
VGhlIFJaIFNDSS8gUlovQTEgU0NJRiBoYXMgb25seSA0IGludGVycnVwdHMuIFRoZQ0KPiA+ID4g
PiA+ID4gPiA+ID4gPiBmb3VydGggaW50ZXJydXB0IGlzIHRyYW5zbWl0IGVuZCBpbnRlcnJ1cHQs
IHNvIHNodWZmbGUNCj4gPiA+ID4gPiA+ID4gPiA+ID4gdGhlIGludGVycnVwdHMgdG8gZml4IHRo
ZSB0cmFuc21pdCBlbmQgaW50ZXJydXB0DQo+ID4gPiA+ID4gPiA+ID4gPiA+IGhhbmRsZXIgZm9y
IHRoZXNlDQo+ID4gPiBJUHMuDQo+ID4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4g
PiA+IEZpeGVzOiAzOTJmYjhkZjUyOGIgKCJzZXJpYWw6IHNoLXNjaTogVXNlDQo+ID4gPiA+ID4g
PiA+ID4gPiA+IHBsYXRmb3JtX2dldF9pcnFfb3B0aW9uYWwoKSBmb3Igb3B0aW9uYWwgaW50ZXJy
dXB0cyIpDQo+ID4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ID4gSSBkb24ndCB0aGlu
ayB0aGF0J3MgdGhlIHJpZ2h0IGJhZCBjb21taXQuDQo+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4g
PiA+ID4gPiBPSy4gSSB3aWxsIHVzZSBiZWxvdyBjb21taXQgYXMgZml4ZXMgb25lLCB0aGF0IGlz
IHRoZQ0KPiA+ID4gPiA+ID4gPiA+IGNvbW1pdCB3aGljaCBhZGRlZCBSWi9BMSBTQ0lGIHdpdGgg
NCBpbnRlcnJ1cHRzLg0KPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gY29tbWl0IDhi
MGJiZDk1NjIyOGFlODcgKCJzZXJpYWw6IHNoLXNjaTogQWRkIHN1cHBvcnQgZm9yDQo+ID4gPiA+
ID4gPiA+ID4gUjdTOTIxMCIpDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IFRoYXQgb25l
IGFkZGVkIHN1cHBvcnQgZm9yIFJaL0EyLCBhbmQgaXMgYWxzbyBub3QgdGhlIGJhZA0KPiBjb21t
aXQ/DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gT0sgd2lsbCB1c2UgYmVsb3cgb25lLA0KPiA+
ID4gPiA+ID4NCj4gPiA+ID4gPiA+IEZpeGVzOiA0Yzg0YzFiM2FjY2EgKCJBUk06IHNobW9iaWxl
OiByN3M3MjEwMDogYWRkIHNjaWYgbm9kZXMNCj4gPiA+ID4gPiA+IHRvDQo+ID4gPiA+ID4gPiBk
dHNpIikNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFRoaXMgcmVhbGx5IHN0YXJ0cyB0byBsb29rIGxp
a2UgYSBndWVzc2luZyBnYW1lLi4uIEJlZXAgOy0pDQo+ID4gPiA+DQo+ID4gPiA+IEFscmVhZHkg
dGhlcmUgaXMgYSBnZW5lcmljIGNvbXBhdGlibGUgaW4gZHJpdmVyLCB3aGVyZSB3ZSBzdGFydGVk
DQo+ID4gPiA+IGludHJvZHVjaW5nIFJaL0ExIFNvQyBXaXRoIDQgaW50ZXJydXB0cy4gU28gYWRk
aXRpb24gb2YgdGhpcyBTb0MNCj4gPiA+ID4gaGFzIHRoaXMNCj4gPiA+IGlzc3VlLiBBbSBJIG1p
c3NpbmcgYW55dGhpbmcgaGVyZT8NCj4gPiA+DQo+ID4gPiBUaGUgcmFiYml0IGhvbGUgc2VlbXMg
dG8gYmUgZGVlcGVyIHRoYW4gSSB0aG91Z2h0Li4uDQo+ID4gPg0KPiA+ID4gTG9va2luZyBhdCB0
aGUgY29kZSwgdGhlIGRyaXZlciBhbHdheXMgYXNzdW1lZCB0aGUgZm91cnRoIGludGVycnVwdA0K
PiA+ID4gaXMgQlJJLCB3aGljaCBtYXRjaGVzIHRoZSBSWi9BMSBkYXRhc2hlZXQgZm9yIFNDSUYu
DQo+ID4gPiBTbyB0aGUgNCBJUlEgY2FzZSBpcyByZWFsbHkgYSBzdWJzZXQgb2YgdGhlIDYgSVJR
IGNhc2UsIGFuZA0KPiA+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Nlcmlh
bC9yZW5lc2FzLHNjaWYueWFtbA0KPiA+ID4gaXMgd3JvbmcuDQo+ID4NCj4gPiBPSy4NCj4gPg0K
PiA+ID4NCj4gPiA+IEhvd2V2ZXIsIFNDSShnKSBpcyB0aGUgb2RkIG9uZSAoYWxzbyBvbiBTSCk6
IGl0IGhhcyBURUkgYXMgdGhlDQo+ID4gPiBmb3VydGggSVJRLCB3aGljaCBJIHByb2JhYmx5IG1p
c3NlZCB3aGVuIGRvaW5nIHRoZSBqc29uLXNjaGVtYQ0KPiA+ID4gY29udmVyc2lvbiBpbiBjb21t
aXQgMzg0ZDAwZmFlOGU1MWY4ZiAoImR0LWJpbmRpbmdzOiBzZXJpYWw6IHNoLXNjaToNCj4gPiA+
IENvbnZlcnQgdG8ganNvbi1zY2hlbWEiKSwgbGVhZGluZyB0byB0aGUgYnVnIGluIHNjaWYueWFt
bC4NCj4gPiA+DQo+ID4gPiBOb3RlIHRoYXQgdGhlIGRyaXZlciBuZXZlciBsb29rcyBhdCB0aGUg
aW50ZXJydXB0IG5hbWVzLCBidXQgdXNlcw0KPiA+ID4gaW5kaWNlcyBleGNsdXNpdmVseS4NCj4g
PiA+DQo+ID4gPiBTbyBJIGd1ZXNzIFNDSSBoYXMgYmVlbiBicm9rZW4gb24gU0ggc2luY2UgZm9y
ZXZlciwgdG9vPw0KPiA+DQo+ID4gSSB0aGluayBzbywgYnkgbG9va2luZyBhdCB0aGUgY2hhbmdl
cyBkb25lIGluIHR4IHRvIG1ha2UgaXQgd29yayBvbg0KPiBSWi9HMlVMLg0KPiA+IE9uIFJaL0cy
VUwgYm90aCByeCBhbmQgdHggaXMgYnJva2VuLg0KPiA+DQo+ID4gTm90IHN1cmUgU0NJIGlzIHRl
c3RlZCBldmVyIG9uIFNIIHBsYXRmb3JtPz8NCj4gPg0KPiA+IENhbiBhbnkgU0ggcGxhdGZvcm0g
cGVyc29uIGNvbmZpcm0gdGhpcz8NCj4gDQo+IFNDSSBpcyBvbmx5IHN1cHBvcnRlZCBvbg0KPiAg
IC0gc2g3NzB4LA0KPiAgIC0gc2g3NzUwIChleGNsdWRpbmcgcnRzNzc1MXIyZCkNCj4gICAgIEkg
a25vdyBpdCdzIG5vdCBleHBvc2VkIG9uIG15IGxhbmRpc2ssDQo+ICAgLSBzaDc3NjAsIGZvciB0
aGUgU0lNLXBvcnQsIHdoaWNoIEkgZG91YnQgYW55b25lIHVzZXMuDQo+IA0KPiBGVFIsIEkgdHJp
ZWQgdGhlICJvYnZpb3VzIiB0aGluZyAocmVtb3ZlIHRoZSBydHM3NzUxcjJkLWNoZWNrcyBpbg0K
PiBhcmNoL3NoL2tlcm5lbC9jcHUvc2g0L3NldHVwLXNoNzc1MC5jLCBhbmQgcmVwbGFjZSBzY2lf
YnJfaW50ZXJydXB0IGFzIHRoZQ0KPiBpbnRlcnJ1cHQgaGFuZGxlciBieSBzY2lfdHhfaW50ZXJy
dXB0IGluIHNoLXNjaS5jKSwgYnV0IHRoYXQgZGlkbid0IG1ha2UNCj4gdHR5U0MwIHdvcmsgb24g
cWVtdS9ydHM3NzUxcjJkLg0KDQpJIGFtIG5vdCBzZWVpbmcgYW55IFNIIHBsYXRmb3JtIFNvQ3Mg
aW5bMV0gYW5kIFJaL0EyIGRvZXMgbm90IGhhdmUgYW55IFNDSSBub2Rlcw0KZGVmaW5lZCBpbiBk
dHMsIA0KDQpTbyBTaGFsbCBJIHVzZSB0aGUgYmVsb3cgZml4ZXMgdGFnIGluc3RlYWQsIGFzIGl0
IGlzIGRvY3VtZW50ZWQgaW4gZHQgYmluZGluZ3MgYW5kIGlzIHRoZSBmaXJzdA0KU29DIHdpdGgg
YnJva2VuIGlycSBoYW5kbGVyPz8NCg0KRml4ZXM6IGY5YTJhZGNjOWU5MCAoImFybTY0OiBkdHM6
IHJlbmVzYXM6IHI5YTA3ZzA0NDogQWRkIFNDSVswLTFdIG5vZGVzIikNCg0KV2l0aCBiZWxvdyBj
aGVjayBpbiBkcml2ZXIuDQoNCisJLyoNCisJICogVGhlIGZvdXJ0aCBpbnRlcnJ1cHQgb24gU0NJ
IHBvcnQgaXMgdHJhbnNtaXQgZW5kIGludGVycnVwdCwgc28NCisJICogc2h1ZmZsZSB0aGUgaW50
ZXJydXB0cy4NCisJICovDQorCWlmIChwLT50eXBlID09IFBPUlRfU0NJKQ0KKwkJc3dhcChzY2lf
cG9ydC0+aXJxc1tTQ0l4X0JSSV9JUlFdLCBzY2lfcG9ydC0+aXJxc1tTQ0l4X1RFSV9JUlFdKTsN
Cg0KDQpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
bmV4dC9saW51eC1uZXh0LmdpdC90cmVlL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9zZXJpYWwvcmVuZXNhcyxzY2kueWFtbD9oPW5leHQtMjAyMzAzMTcNCg0KQ2hlZXJzLA0KQmlq
dQ0K
