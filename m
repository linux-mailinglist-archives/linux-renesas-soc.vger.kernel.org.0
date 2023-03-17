Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 177966BE2B9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Mar 2023 09:10:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231347AbjCQIKt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Mar 2023 04:10:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231326AbjCQIKk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Mar 2023 04:10:40 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2116.outbound.protection.outlook.com [40.107.113.116])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FCFC367EB;
        Fri, 17 Mar 2023 01:10:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=REaEYKG9SOvISTtg02pcrtytAgF9DmfhjdeLB3I3tXWFK/KRpyxkX3oCGkYHAl+VZApweTSdT458+UJsOHUvmlvFgGiNMSFKgdeNKa8bL6yAXvYa1KngKcshcdMN2B6Y37l8rAlHQhvuGFjXAdn9EnTlW1MPZ1E7bxP07aJq1Uo9y+R5WWTNruhrCBsttw1Wi7Es7mbu4Ngjn6+L3u0kq8UomZgRc3Vt8k+Ns0b9irgScqHpkAOBo8bnZTNHZvzKtbK5/WO2XY+XaJoV901gOS07I2nV0cjnfsJH52zKVT4J6QHmCUOFJl+tlromVjLw/B74ilVMVwbGAixPoq4A1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZD/UH6vjKGUF+uAdyvIvEdvUJ3wvtGZG9JKNgpRKqdQ=;
 b=X5DZzRH62DsFHjU+9nvdW0Y72ftt8TsgIIqkSWink85CUaYr4jM/c+0K+M+yUM5Lq/SZ5NBBfSEMy1qadNyFzPSD4dZfuADKLWijjB+XAu0jOvSUBtavBZz/9Sch/UFS9QTBybcgKEJjBE4boAowhphvizs4ossLPKCf5zjJBc5UKT/zw+todpOAUBJRq+3lVh4EeMirydcdG9Amm5uLcENEfs5VEsNcP4M22YII4EJD9PE14536qjS1GBoBCR485NZ9vMFSucylzipR8O8imjZnilJz/43Y6MUBmGWXr5xKr77Rou+9gvWVvx8L2ti5L8/PgLMyaDu0obfFmjbvxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZD/UH6vjKGUF+uAdyvIvEdvUJ3wvtGZG9JKNgpRKqdQ=;
 b=d1t+uur35Cf+GFUulj2UGpC0OEL5hv0o8uxZNboxj41CShO2WudH1aFKv/h83EsDVHjyntL7n9je+lCl2JLVufdwYLxykThco61NvUhw5vhirwevywQsXiEhSD57Ygj8jEut1ggsrjPJ7TL+M6vh9YqiJn07ksEs0Ts7pWUUr60=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by OS3PR01MB5686.jpnprd01.prod.outlook.com (2603:1096:604:c3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.33; Fri, 17 Mar
 2023 08:08:41 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::9eb:3c9a:c2bc:af06]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::9eb:3c9a:c2bc:af06%4]) with mapi id 15.20.6178.033; Fri, 17 Mar 2023
 08:08:41 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Stephen Boyd <swboyd@chromium.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt handler
Thread-Topic: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt handler
Thread-Index: AQHZWCCS4vXtQ/fzW0yUXUaCYffr6a79lBkAgAAA5oCAABuIgIAA62sggAACXICAAABMkA==
Date:   Fri, 17 Mar 2023 08:08:41 +0000
Message-ID: <TYCPR01MB593390150CAC755AE540D7D586BD9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20230316160118.133182-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVX=sM-1y+-3PQDsjf8K3nLoS4WfSYfv6UAP=92T_oHaQ@mail.gmail.com>
 <OS0PR01MB5922EA7DC64F0D2C36B490A986BC9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXgwkJ2O7y98HW6n8SOgbuEx1uFrt1Jc-X2CzpC3y1P0Q@mail.gmail.com>
 <TYCPR01MB593334BB3847CCC45A1B6C7286BD9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <CAMuHMdUN=0aJ-7huv0XrhG3LMu8q_SEuqHU48ytTgGAYEjng5A@mail.gmail.com>
In-Reply-To: <CAMuHMdUN=0aJ-7huv0XrhG3LMu8q_SEuqHU48ytTgGAYEjng5A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB5933:EE_|OS3PR01MB5686:EE_
x-ms-office365-filtering-correlation-id: 679e7d1c-276e-4faa-b4d0-08db26bed26a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lP7QtCpQl3d+h3tdMn3E1fQByKR3I/YtKEgNRBQxlmAkTvzg7uP8YM/nSfJV9XX4emImPtuOoWfI/pT6Lx1Q9iIZjC/C5xOU2dGu695YAY0WAOO2byrvCZz+F7Pva7L7KVX0QGgZYc0PLKh5apXLwEPmO7lArvryW1bBeTDp97DTk9SwmHfZXfMLC3w6CtshT8/YvEZCylPiV6FobYD3eqho9BdZVabD29w6JImM0t5w8ZlEPLT254ZA2+Ldniv8gc9tq+qO7YqgoX7HaiwRXsBipVA6f967UXg0qjg9/ejWqOA8Ak/tv9v1JXkm4PkYmXvPqvOaKwN7W9Xg/zBeH/HXuTQM3NBNJ9BewnBXJ+p78DwVg783Z5/4VlhBkTmcG6YVYszbaSuuKJSfJwdJ6cPSEMB+U2LIfwT8SNdesb87S2T5W1d2zS00T0CPKW0CHkvMIiT5SZV6+viKOVtD72x9NLn0xW5TSEwTsFO08GG/xrI2+yGgBOyLZVB+0dvdfqKMutkDpF0n5B6rbYDNKKiu2/1XAc93t5gJ8EmN7dEHv0DT18KQHizXQNmgPrLSxc1PtMZCbg7BLU3ybDEDVmtyyK/X2xUyYtWjJOcTWVmJkTiiWn/JWimAwWDuGxUzMDEgY4XRnB4ddeGzCljSBnGjG67u0X9tOoYdmWu9lRMfjRw2RFRAJXzxvJNFghxyySAiBXkg8xFF/55ma6WC3g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(136003)(376002)(346002)(366004)(451199018)(38070700005)(33656002)(86362001)(38100700002)(122000001)(2906002)(41300700001)(8936002)(52536014)(5660300002)(55016003)(26005)(71200400001)(53546011)(6506007)(9686003)(4326008)(186003)(316002)(54906003)(6916009)(66556008)(8676002)(66476007)(76116006)(7696005)(478600001)(66946007)(66446008)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N1VGQVNBU2lqd3RNMzB1OUJycjNLdm1NMHFxbEc2c0VmMmR3Tmx1M2IzN29M?=
 =?utf-8?B?MjdUdFgrYkVZQ1pocUNLNEtwdlM1Tk5CdkZYR3JYTksrOTMzU2hrejA5c2ZY?=
 =?utf-8?B?WFhHT0xZWkpWcUFZdU5nSmpabmF1Zkh3anJNOW8xRmZ2WktrVlpscDg2VGs1?=
 =?utf-8?B?eEdWVmJBekw0VklPU0Q5M3ZNOW0rb0Q1dU1QNithOUlmc2pnMzdVdTF6L3NQ?=
 =?utf-8?B?SXBmSzFMMi9YNk5QY3BVWjczNW92SjVVNXpxVUcvTEN6dFpWbmZ1Q0c3L1FR?=
 =?utf-8?B?UmFzU25HakhTMFNjdEs1bUY2K3VaNm1iZ0pyVmFTc3VTeFVwaGVlc3dWd2dY?=
 =?utf-8?B?c1hINldlRFYyZUhLaE1ybWJ5Q3MwK0JaWmYxL2h2aDJsTHhUcm55Qk9pZFRP?=
 =?utf-8?B?T3V3TFVHb01ldHlXMW82dVRVRDQvTDhMbVdHd0hGQi93dTJvY0xUS09FbGRJ?=
 =?utf-8?B?Ty9LbnhDemw5eDVVS2hDcGhCTFJtMUFJNjluRXhVQXZQcWErV2NMa2NpU3c2?=
 =?utf-8?B?Smw2Q0YrVkIrZXVWR01tanNVeGlNbUNlRHpNNjZHdVowc1hMejR1QXM2WnpI?=
 =?utf-8?B?L0Z1Uzd1RHNPSFlPcW5vbStONVJXMTR0N29tL1N4RUhkdEI4MG8xcHlKYnp4?=
 =?utf-8?B?bjd4ckFSUGNkaG1XeVdNOE5lT1E1M3p4bEFmdlZoZEhjVW5LWFMyQ01qMzRu?=
 =?utf-8?B?eDBZa2p5cWFsc0F5UlNMT3hlVnc1TnB5TWIxS1p2SWRLZms1d0lzOFZjai85?=
 =?utf-8?B?ZnF5ckdiNnpGa1VLaThBOWVibXJwRE1UdDVtRitXVUFVNUg5bnBMMHpuRnJn?=
 =?utf-8?B?N1lZWGR0S1piQVZyR29yYk1pSWlTZndkdVVBdVBGVHBadk5iN09qVXlXbVhK?=
 =?utf-8?B?TGdlMFVGaFNYTzdIdVlxUUI1Q0N1RXZuQnVNZGlXRitXTkVDdURnQ3VyaXh3?=
 =?utf-8?B?bHJ3bHlWY21sUkovRldkRll5bVFGOVgrTUlIZmxiU2VhY1hvUjc2Z2R5Y0NN?=
 =?utf-8?B?bHVsaGFBUll4ZU1nNW1yNVhKL3NKcVNWSzNmNHNuMTI2dGxRK245b2FsNDBG?=
 =?utf-8?B?dktvek4wMVZkTmJFTXZ5eUlKY3gxeXF3SjRXTjlWMlFMeVRDZWRUdDA3NjJh?=
 =?utf-8?B?bWxZOVZkeWloeDE3RjVQa2MwR0NuT2JhZWVyWVp4R2gzbm1RbSs5R2h5cXlH?=
 =?utf-8?B?S2FIQ3JIZnlvVHl3V1RObVJzS2pUQjZDN0JNTEpRT2NtYTdBWFNYdyszQ0tl?=
 =?utf-8?B?SGdOVXZBQlRpMkZiQWtHSmtvSXRFSXVBeXNSN3BtSzJYZmJpWkFTTUdlaEdM?=
 =?utf-8?B?WS9wbU1sTVpsVTJtYkRxQy9lb0tCQU9ObEd0WVRuQURjdDd2RE53L2F4c1I0?=
 =?utf-8?B?U0hYbnlKcGVERVI2bVp3eXVjWUhoRkxPWjhvWVJDQVQwRWtBdTgxaWZIQ1Vr?=
 =?utf-8?B?U2tqaHl2dlBpeVVkbjAxbjRNVnJtdVdUS0poUlYyNDVvTEtGT0s1R2x5aFJR?=
 =?utf-8?B?elNlT3lVUWx0bHVIY0NQNnk1MkVHOWlMYmhXZVZidTIwbFlsU3c0dWNlVGx3?=
 =?utf-8?B?NmEvTk9HU2ZZQkZCb0hXQ1hWWXl0NDRjam54ekZEeFRrdDBCWThUWGxRdTBa?=
 =?utf-8?B?TEhEellMbjRnN090bG55NEdKYXJUTnB5ai9ZRUJsMHExTHNka2RHL2VFZmNH?=
 =?utf-8?B?Yy82NndtVnlJYVNiVzQ0Wkdrdm1iaGk3bXhmWEJtTTB5UmJDOHJjT0hMRG8y?=
 =?utf-8?B?ckZKTjh5YmRhSjUxSHFrNUFXYSt1aHppRzUrMytPWWp5SFNEck5QZm55aUJv?=
 =?utf-8?B?QTNnUFNod0FkdkVXWldvWXdWWVFkdXkxR0JLY1V2clpuWmxCTTRuRnMrYkpw?=
 =?utf-8?B?WDRFQ01HVEdzLzAvZ1ZRTGZSbjhoaVE5RGtjVXdsMStKQXcyYWY3U3ZVNlFp?=
 =?utf-8?B?dGlnMC9uWlBRWEw2cVBxNmtKY2gvZDYyMkFXLzNmOWl6NUhuellxT0lpYTFD?=
 =?utf-8?B?SFhKa09FdTdLSm92VUl6QVpFU0oxSXVUdXlPRnA1dDNIdHk3VGJYSjJvUytV?=
 =?utf-8?B?RzdEbWlQY2MwWklrTkd0VVVLRG1YQ1E5ckFXd1F1RWtaL3E2bytyT01vWFZl?=
 =?utf-8?B?bVJGK2NHTlJFUTlGU3BsYzNEbHFKUnBCb0xkUlRCV0UvQ2U1aFREYklVMWhT?=
 =?utf-8?B?dEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 679e7d1c-276e-4faa-b4d0-08db26bed26a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2023 08:08:41.8751
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SZR9idHq4/mQhdQ/FPJszP7JwofRLmIHwp3ruRZexWIlqJzwAmPNkp4uvkNfHi5UilC5Cwf+Jglnbl/MLNlcKnUFsigx7qf4TSpY1AZCcX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5686
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gdHR5OiBzZXJpYWw6IHNoLXNjaTog
Rml4IHRyYW5zbWl0IGVuZCBpbnRlcnJ1cHQgaGFuZGxlcg0KPiANCj4gSGkgQmlqdSwNCj4gDQo+
IE9uIEZyaSwgTWFyIDE3LCAyMDIzIGF0IDg6NTnigK9BTSBCaWp1IERhcyA8YmlqdS5kYXMuanpA
YnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSF0gdHR5OiBz
ZXJpYWw6IHNoLXNjaTogRml4IHRyYW5zbWl0IGVuZCBpbnRlcnJ1cHQNCj4gPiA+IGhhbmRsZXIg
T24gVGh1LCBNYXIgMTYsIDIwMjMgYXQgNTozNOKAr1BNIEJpanUgRGFzDQo+IDxiaWp1LmRhcy5q
ekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSF0g
dHR5OiBzZXJpYWw6IHNoLXNjaTogRml4IHRyYW5zbWl0IGVuZA0KPiA+ID4gPiA+IGludGVycnVw
dCBoYW5kbGVyDQo+ID4gPg0KPiA+ID4gPiA+IE9uIFRodSwgTWFyIDE2LCAyMDIzIGF0IDU6MDHi
gK9QTSBCaWp1IERhcw0KPiA+ID4gPiA+IDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4g
PiA+IHdyb3RlOg0KPiA+ID4gPiA+ID4gVGhlIFJaIFNDSS8gUlovQTEgU0NJRiBoYXMgb25seSA0
IGludGVycnVwdHMuIFRoZSBmb3VydGgNCj4gPiA+ID4gPiA+IGludGVycnVwdCBpcyB0cmFuc21p
dCBlbmQgaW50ZXJydXB0LCBzbyBzaHVmZmxlIHRoZSBpbnRlcnJ1cHRzDQo+ID4gPiA+ID4gPiB0
byBmaXggdGhlIHRyYW5zbWl0IGVuZCBpbnRlcnJ1cHQgaGFuZGxlciBmb3IgdGhlc2UgSVBzLg0K
PiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IEZpeGVzOiAzOTJmYjhkZjUyOGIgKCJzZXJpYWw6IHNo
LXNjaTogVXNlDQo+ID4gPiA+ID4gPiBwbGF0Zm9ybV9nZXRfaXJxX29wdGlvbmFsKCkgZm9yIG9w
dGlvbmFsIGludGVycnVwdHMiKQ0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gSSBkb24ndCB0aGluayB0
aGF0J3MgdGhlIHJpZ2h0IGJhZCBjb21taXQuDQo+ID4gPiA+DQo+ID4gPiA+IE9LLiBJIHdpbGwg
dXNlIGJlbG93IGNvbW1pdCBhcyBmaXhlcyBvbmUsIHRoYXQgaXMgdGhlIGNvbW1pdCB3aGljaA0K
PiA+ID4gPiBhZGRlZCBSWi9BMSBTQ0lGIHdpdGggNCBpbnRlcnJ1cHRzLg0KPiA+ID4gPg0KPiA+
ID4gPiBjb21taXQgOGIwYmJkOTU2MjI4YWU4NyAoInNlcmlhbDogc2gtc2NpOiBBZGQgc3VwcG9y
dCBmb3INCj4gPiA+ID4gUjdTOTIxMCIpDQo+ID4gPg0KPiA+ID4gVGhhdCBvbmUgYWRkZWQgc3Vw
cG9ydCBmb3IgUlovQTIsIGFuZCBpcyBhbHNvIG5vdCB0aGUgYmFkIGNvbW1pdD8NCj4gPg0KPiA+
IE9LIHdpbGwgdXNlIGJlbG93IG9uZSwNCj4gPg0KPiA+IEZpeGVzOiA0Yzg0YzFiM2FjY2EgKCJB
Uk06IHNobW9iaWxlOiByN3M3MjEwMDogYWRkIHNjaWYgbm9kZXMgdG8NCj4gPiBkdHNpIikNCj4g
DQo+IFRoaXMgcmVhbGx5IHN0YXJ0cyB0byBsb29rIGxpa2UgYSBndWVzc2luZyBnYW1lLi4uIEJl
ZXAgOy0pDQoNCkFscmVhZHkgdGhlcmUgaXMgYSBnZW5lcmljIGNvbXBhdGlibGUgaW4gZHJpdmVy
LCB3aGVyZSB3ZSBzdGFydGVkIGludHJvZHVjaW5nIFJaL0ExIFNvQw0KV2l0aCA0IGludGVycnVw
dHMuIFNvIGFkZGl0aW9uIG9mIHRoaXMgU29DIGhhcyB0aGlzIGlzc3VlLiBBbSBJIG1pc3Npbmcg
YW55dGhpbmcgaGVyZT8NCg0KUGxlYXNlIGxldCBtZSBrbm93Lg0KDQpDaGVlcnMsDQpCaWp1DQo=
