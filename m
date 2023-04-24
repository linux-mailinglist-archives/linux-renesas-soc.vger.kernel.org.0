Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F2226EC6C8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Apr 2023 09:07:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231262AbjDXHG7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Apr 2023 03:06:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231259AbjDXHGu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Apr 2023 03:06:50 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2123.outbound.protection.outlook.com [40.107.113.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B59D2E6C;
        Mon, 24 Apr 2023 00:06:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gvgp2wtP5yzjC47yHMi26AjFXrA9Qb8LTPXXCjCIPxwwko3XU8+zyCA5rmGdOYFfwO9VBkd5GGqPnWc44wVOBArs2KMYCTgoJ1NnGT3eFYzfsuM43s04VwrgGXz9lU07cZOiIbBr501TeGvhQp1F0qNl+3ltRn62ZGC3ekrh1Sexx9YINqdXls+OHBr8dgi5Hg5LgY30R5ytgJwGGq5eCnRMrd4yy40BKs1GXiDnqxTDIBMRGjWbjrP2opPYUZGP6mxnkmwIn/TqgxLwKxXfkWXx0njqD4IsXrEvrd8lKX3gjYPA76IwjIWs9laXOTXT2NdRfnLc6O3eAlwSR3wFFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=weN3fdyZdBmlQ7T2KO89wxQoeDbohcxqhD45WP2V1js=;
 b=fP/hksNYwy+fROh3TDfm5bz0N4mkKX/zDDXbod6KhtHmFCziFB4VNDDGZodAE3YJu3qUPRlv06ZISjPUvdrAtX/MHdQA00E9D9hE7BAOOgnXyQJy7E+1WE2tw+LP3fXbkUndHYsp6r76iAKu5oZlHSfxA90ccLdpQ+/vX3EFSzE9HZfEFPm0z8hDLm5ZgR/yvI3IqE3OwK4GkU7IqaJNfcK1gV5iTYGcikBB0NXOlSYHKzDQt8lOr/8bWfnY+YKRawRgSEOX95DqpZdfboOXM3dDFoNzZ0ePSv4+KTOw7UnuMd8sQi7eA6bE38y8jqja8SO2XAerq7j2DTI/m8REJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=weN3fdyZdBmlQ7T2KO89wxQoeDbohcxqhD45WP2V1js=;
 b=ht8o1VxVyaz1vUcri1pmyrBLRdC+0ugZ/HLFhgkijouvMsuAOwTD8qQNRwrWVhyiCms6mJYkGBEe+BBfEmPZ4k6CyTCsjTNP1sOIZCwgoVcyljOxrH7f+R1xEteUuOgFbq1tEABb6hJGJJaDF7oKeKykEnjAnhhlD4Fw5CCpzMU=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB10534.jpnprd01.prod.outlook.com (2603:1096:400:316::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 07:06:44 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 07:06:43 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     =?utf-8?B?SWxwbyBKw6RydmluZW4=?= <ilpo.jarvinen@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-serial <linux-serial@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 5/5] tty: serial: sh-sci: Fix end of transmission on
 SCI
Thread-Topic: [PATCH v4 5/5] tty: serial: sh-sci: Fix end of transmission on
 SCI
Thread-Index: AQHZbU46vLY3hndEL0KAfF75mCWnea81ko8AgAAzY4CABFPX8A==
Date:   Mon, 24 Apr 2023 07:06:43 +0000
Message-ID: <OS0PR01MB59227F108EB5B65DD1A15CB486679@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230412145053.114847-1-biju.das.jz@bp.renesas.com>
 <20230412145053.114847-6-biju.das.jz@bp.renesas.com>
 <CAMuHMdUQ05U9oiepVJsShg8xFoHTD6M7XczQ2=Qce+pE+0RPag@mail.gmail.com>
 <1860434a-8915-3ea4-60e1-5f7d4598a16@linux.intel.com>
In-Reply-To: <1860434a-8915-3ea4-60e1-5f7d4598a16@linux.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB10534:EE_
x-ms-office365-filtering-correlation-id: 9b586271-6fd7-45ee-0c71-08db44927603
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jbvmkhj9Khnh0v3wcmS+rPLoPcRXV5rRUrzl6ls/thjI/CjdsQ62LgKdp4HuLsQGvP9O9S6I26VyYZZYEIvQFo3IaTpV7WwMcDcq4we2F1EM3c9GT8fRlH/YZrPiEbySOsBlZRZLKPDt5xIdGogdxs7X8EzMOJeS5cpjQGhJVDDazS5xelTcdF1psPyc490AMh3T57HL23CGQueEzcI13PYYsmDJ3T/NQ6VGuGmaTXTwuPxepVndwZnQ+A/JbVBV5359v5HjI0q2GkL2KbNp4wcFlDL0JW0UWObRY+FNwyYFnqkH+Arzjpurt37bkszxxkEUPUiaK/sL0sH/+Zy1RSia67KPCrGfI6ctKQ65sSP+zBXg/rz534T3an/Ai8IbvB/p2g0scFV2rufClPTbhmuuo0/aycIIJdwsC6Zk9T57geTNs1T3r5M88FHRgh/XcnRIUPs3x45jgJTcdT9LEZBY/iljU/KDOqRtnnNt8e6jCv/SJm9woSZISjAPPnHfECBH49WhiyMcI9MgBsBYOhajSbqOEvYSjNnGlBx/JC6/HekDKMtuKhGVnUqO+OmbJXUN+VrkZIybtPIysIpH1hNeiKuECpmdJsAb/m/WEO9tbZkbSoZRDjtIbkzSOlHR
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(376002)(366004)(346002)(451199021)(9686003)(53546011)(6506007)(26005)(38070700005)(55016003)(83380400001)(186003)(38100700002)(122000001)(66946007)(478600001)(76116006)(86362001)(64756008)(66556008)(66476007)(66446008)(8936002)(8676002)(54906003)(110136005)(52536014)(5660300002)(71200400001)(7696005)(41300700001)(2906002)(4326008)(33656002)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ODQ1aDNORktXazhZZHpIZWJXMXROeElCNGN6QWNWSG5ESW1pTHBwTFlxY1k4?=
 =?utf-8?B?WkFsb2dXZU1oTm5SS0tPUUdWNmlBblN3SEpzMHkzYUpuWWFJR3VjMVVrQVcy?=
 =?utf-8?B?NUJBWTNSRXNxSkU1a3RzVCtvcitZV0dPTDlsUlZXdnVlNjNJTFA5UmljSG42?=
 =?utf-8?B?L0FySGVoSnNsRVVoelJ6L0R4bEI1WXVKMHQ2dVVHanhYV0QwNFNUYzZVaWVm?=
 =?utf-8?B?NU0wbC9YZGdFUzRyM2FYRkN1Z0Y1RnZpN3VsblNPaklVYm1xd1ZLQVd0NXBY?=
 =?utf-8?B?RUpVa011OEQxUTJtU3lTVWc4RlpELzNFVEJTeVRmYUI5Nit3TDZDU2orOFlH?=
 =?utf-8?B?ZEMyR1ZiT2RxdWtvK0RUL0RYZ1dJMWZNRE9JSHJkUHRoMVJDb2owbVBhaVNl?=
 =?utf-8?B?UEFVMGpZa25BQ3ZkeVVUZXNCWGExTS82OFRha2JCRGpjUS9OVEszQ3p3WlV3?=
 =?utf-8?B?SHhIVnZzR0NneXR5S3hYejY4VWJqb09UeFI2alBEbldGMEtjUmNoTXUxZHF6?=
 =?utf-8?B?b0c0YUYzS0xPWEU1a1JKakYxYUJxNmcrUzM4b1NHYktrY1doRU1vQy9sNE45?=
 =?utf-8?B?ZE1rVUdUVVBnZTBNazZqZVVidHFwNjRtRXVteE5DVFdxTG11aWF0ZUZNS0tU?=
 =?utf-8?B?WXVnaGlnZEZvTlBkY3krMjFRbE1Tdm5EVU9UZjU5QXRZak5Hem1wYVFQWTVR?=
 =?utf-8?B?MjdUZUdGb1hEdGFQaWtqUmFBb3hwQm9SNXcwQTREcmtxRTJXaTRqbjdVM1A2?=
 =?utf-8?B?L0RBVWpPQVk4Y2VLSWtreHZQcVZ5aU9QaCt4YVlCK1ZJdWlHKzFyRkJNbStx?=
 =?utf-8?B?R3RjWUtpcmw3T2pKUFUwajBKZUhmZ1dvS3N2eHVUUUNKTGRDY3VvWFYwRmZP?=
 =?utf-8?B?Uk0rYmNUQjlSSENZelRwOENXV2JjYXl3ckVPSWpkTDk5VGtIUDYzMDBTRWov?=
 =?utf-8?B?VmdVWVJleXZyL1RaT0R4WTZVTjd5ZHUyUzNtNUNLcmlkR1U3WThsRVg3bTBI?=
 =?utf-8?B?RUo4WEttRzIzUmlZWTRRSEJCNndBSEllV0Z2cmUyNUxqUnNyR2txUWMxNW1i?=
 =?utf-8?B?T1B0eXp4RnpQbUVXMzU0WGg1ZkpKSGplMFJ2OEhlbGE1TTVDWGF1MnFUZlJD?=
 =?utf-8?B?Qzd2VzZGNEZjVW5qR1R1aE1DWHpQWmtneG1BaW00N2FGQlBWMEswNS9KaTB5?=
 =?utf-8?B?SnFzYlM1dk45Z2RqMCtDK1VKa0JtemVLWi9abXU5OCs1UEpYdGJDWDZFVW9j?=
 =?utf-8?B?K2FCTDBFcU5GYXFFMlhFL2g4ZkhQVzY0djR0eUhQS2JWWTZRZ3dISStoQ0d0?=
 =?utf-8?B?VHgvMEtNM2k1V0d2UkFHTW5JYXpQVlRBRkltOG9vU3MzZ1o1eWlubmZwL213?=
 =?utf-8?B?b1Nkb2Q0NVJOWWtTUDI3WXBhNUpMMDQ4NWwzd3FaWFhQaHAxTDZHUHYzQVAr?=
 =?utf-8?B?d1Ntbmh6N2RMcVZMR1luYWhRYkYrdFREeGdETEprV3NMbDZhcjZVTFovcE05?=
 =?utf-8?B?OFByNlZ0L1NmVUd5a1ZLYXgreVp4U1NPeWZncWRpbWFxeVIyQzUvQTJENHBa?=
 =?utf-8?B?QnZmcFQzVnkxWDlYbkdWdUFwUGV1M3kxdmJoWkdzRDM5NXRFY3B4bTJBWlhv?=
 =?utf-8?B?MS9tZ3UzN01HbmRRYXNqUm5qRTdwU25TcHg2MGFnRm90WU1GeHFQd2F1UFlJ?=
 =?utf-8?B?bjZzZXpadW9GOGFXSXQzN2tWR2RJaE5SWS9tODZhbS96UDFiQTh0V3F1UElS?=
 =?utf-8?B?Mi9LL3ZISHlaN0I1a1haWXo3SlV1QUNtMVYwZEpwKytXT1JjNS80TGVsZlI0?=
 =?utf-8?B?SEdQNkMyVFAxNEFvdTgyUGMzVEwyQ1ZJR1BxaUg3aHRhYXU3T2UxVmJybzVM?=
 =?utf-8?B?di9GYk5KSC8vVE9PSTFUem5VS25pMUsxM1NGdGNJN04rRjVHdS9kVE1CV0RK?=
 =?utf-8?B?aVFnUGt3b3k4MEJLb3RSdUF3cXBCT2h0WElvMk5rMEhkVVVlM0hrSjBtKzdR?=
 =?utf-8?B?WmFnRGQ0dFJNcGlFeXpyaHdTeGhiWFJuUXF4bStpSjZSRnphbDlWNG9BMVdH?=
 =?utf-8?B?OHRab2dVN3lCVkNPQ0FyOWdnWXhSejJ6YW1mMENNWGJlZmpYNVBtdHZqbFFp?=
 =?utf-8?Q?WPWUUoAO6e14xq/DmnXXZGQMl?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b586271-6fd7-45ee-0c71-08db44927603
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2023 07:06:43.8493
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HOHxek3v3qed7+g31vEdm4mExdC0GnVHyiGAh0x/2La7XuHgjwcr6ScQvPzzH3cri2PgzAv8b9dkxiUD8uRJnn9ZEi7akEGL5UMs4jNzHMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10534
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBJbHBvIErDpHJ2aW5lbiA8aWxw
by5qYXJ2aW5lbkBsaW51eC5pbnRlbC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgQXByaWwgMjEsIDIw
MjMgMTo1NCBQTQ0KPiBUbzogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9y
Zz47IEJpanUgRGFzDQo+IDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gQ2M6IEdyZWcg
S3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+OyBKaXJpIFNsYWJ5DQo+
IDxqaXJpc2xhYnlAa2VybmVsLm9yZz47IFlvc2hpbm9yaSBTYXRvIDx5c2F0b0B1c2Vycy5zb3Vy
Y2Vmb3JnZS5qcD47IGxpbnV4LQ0KPiBzZXJpYWwgPGxpbnV4LXNlcmlhbEB2Z2VyLmtlcm5lbC5v
cmc+OyBQcmFiaGFrYXIgTWFoYWRldiBMYWQNCj4gPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBi
cC5yZW5lc2FzLmNvbT47IGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZw0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIHY0IDUvNV0gdHR5OiBzZXJpYWw6IHNoLXNjaTogRml4IGVuZCBvZiB0
cmFuc21pc3Npb24gb24NCj4gU0NJDQo+IA0KPiBPbiBGcmksIDIxIEFwciAyMDIzLCBHZWVydCBV
eXR0ZXJob2V2ZW4gd3JvdGU6DQo+IA0KPiA+IEhpIEJpanUsDQo+ID4NCj4gPiBPbiBXZWQsIEFw
ciAxMiwgMjAyMyBhdCA0OjUx4oCvUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMu
Y29tPg0KPiB3cm90ZToNCj4gPiA+IFdlIG5lZWQgdG8gc2V0IFRFIHRvICIwIiAoaS5lLiwgZGlz
YWJsZSBzZXJpYWwgdHJhbnNtaXNzaW9uKSB0byBnZXQNCj4gPiA+IHRoZSBleHBlY3RlZCBiZWhh
dmlvciBvZiB0aGUgZW5kIG9mIHNlcmlhbCB0cmFuc21pc3Npb24uDQo+ID4gPg0KPiA+ID4gU2ln
bmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+DQo+
ID4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiA+DQo+ID4gPiAtLS0gYS9kcml2ZXJzL3R0eS9z
ZXJpYWwvc2gtc2NpLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9zaC1zY2kuYw0K
PiA+ID4gQEAgLTg0Nyw2ICs4NDcsMTEgQEAgc3RhdGljIHZvaWQgc2NpX3RyYW5zbWl0X2NoYXJz
KHN0cnVjdCB1YXJ0X3BvcnQNCj4gKnBvcnQpDQo+ID4gPiAgICAgICAgICAgICAgICAgfSBlbHNl
IGlmICghdWFydF9jaXJjX2VtcHR5KHhtaXQpICYmICFzdG9wcGVkKSB7DQo+ID4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICBjID0geG1pdC0+YnVmW3htaXQtPnRhaWxdOw0KPiA+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgeG1pdC0+dGFpbCA9ICh4bWl0LT50YWlsICsgMSkgJg0KPiA+ID4g
KFVBUlRfWE1JVF9TSVpFIC0gMSk7DQo+ID4gPiArICAgICAgICAgICAgICAgfSBlbHNlIGlmIChw
b3J0LT50eXBlID09IFBPUlRfU0NJICYmDQo+IHVhcnRfY2lyY19lbXB0eSh4bWl0KSkgew0KPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY3RybCA9IHNlcmlhbF9wb3J0X2luKHBvcnQsIFND
U0NSKTsNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGN0cmwgJj0gflNDU0NSX1RFOw0K
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgc2VyaWFsX3BvcnRfb3V0KHBvcnQsIFNDU0NS
LCBjdHJsKTsNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybjsNCj4gPg0KPiA+
IFNvIG5vdGhpbmcgYWZ0ZXIgdGhlIHdoaWxlIGxvb3Agc2hvdWxkIGJlIGRvbmUgYW55bW9yZT8N
Cj4gPiBXaGF0IGFib3V0IGNsZWFyaW5nIFNDU0NSX1RFIGluIHNjaV9zdG9wX3R4KCkgKHdoaWNo
IGlzIGNhbGxlZCBhZnRlcg0KPiA+IHRoZSB3aGlsZSBsb29wKSBpbnN0ZWFkPw0KPiANCj4gWWVz
LCB0aGlzIGFkZGVkIGZyYWdtZW50IGRvZXNuJ3QgcmVhbGx5IHNlZW0gdG8gYmVsb25nIGludG8g
dGhlIHR4IGxvb3AuDQoNClRoZSBkaWZmZXJlbmNlIGlzLCBNYXliZSB0aGlzIElQIGRvZXNuJ3Qg
aGF2ZSBGSUZPIGNvbXBhcmVkIHRvIG90aGVyIFNDSUYgSVBzLg0KYW5kIENhcnJpYWdlIHJldHVy
biBpcyBub3QgaGFuZGxlZCBwcm9wZXJseSB3aXRob3V0IHRoaXMgZml4Lg0KDQo+IFRoZSByaWdo
dCBkaXJlY3Rpb24gd291bGQgYmUgdG8gYWltIHRvd2FyZHMgY29udmVydGluZyB0aGUgd2hvbGUg
dHggbG9vcA0KPiBpbnRvIHVzaW5nIHVhcnRfcG9ydF90eF9saW1pdGVkKCkuDQoNCkJ1dCBsb29r
cyBsaWtlIHRoaXMgY2hhbmdlIHdpbGwgaGF2ZSBiaWdnZXIgaW1wYWN0IGFzIHdlIG5lZWQgdG8g
dGVzdCB3aWRlIHJhbmdlIG9mIFNvQ3MNCmluIGJvdGggaW50ZXJydXB0IGFuZCBETUEgbW9kZS4N
Cg0KQ2hlZXJzLA0KQmlqdQ0K
