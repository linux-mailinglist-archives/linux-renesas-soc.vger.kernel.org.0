Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D0F86C2D5C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Mar 2023 09:59:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231368AbjCUI7W (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Mar 2023 04:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231395AbjCUI66 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Mar 2023 04:58:58 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2072f.outbound.protection.outlook.com [IPv6:2a01:111:f403:700c::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11D7B3E0B8;
        Tue, 21 Mar 2023 01:57:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hUvrcxG+ZbK7GcOhIli0NDd348XCB9yFIqyj1FI18t4o7ccSWl5fYvrqNBtr0myTOfsYrA5OF4rRkvuT3N905OYvXTXmXzMyOV/bPg/U4Pikbv040t7o9nB7CzmwnMv0X3gFuY61Z5M4JEk9GAVORQr42A6+hTo4VU5SN9pLetercVzP0OQ7vaHflaoJB2LmCqrLn/4ATEmilVpowqnOFhC3sZVkVF526q49JOBJfARCJ7/aVZDMj0IBirzEmLTa8sTNeP7LYQ2FY9hefBatmjkM9IZDlG+dURzs+8E9PoOyslUPoblBxJk/+QRZQemEGzInUvDZCx4xw1SevGis1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UvjG9qIWpZ13WcqVnLOMP+xhg5q44tzRriWwPSZ3EAY=;
 b=ddFa7PO0hqA+W8Tf8vVkcIfR94FAhQgEwIsBUkD2T7vKFqBKpMFE5hSNby+kFFgL5O9t+J2BvgsKJXtHpUwE/DjkIYu9alGn/bzSMif2pCwYP9ZX0PG2XF+NKdwvnME+LN3LrhXh1bl9uKscto1oB12N8FM647DuxeeOiVlBK6rgmp1fj8AyhQq6ilrLezJqkoZaS+FcuMN7A1va88sby1kcqYbSAKYr9vuOaTZ3VrxufVv3bt/L6+iSEoCMJVbQkevxGtyUYowJjn2aTzpxVITFC7aYpr5kzdLAlKCYgCXOL5rlF0BIvw0Lfv07Xs8ZIQjXkdvkp+ptcGLguL8ghQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvjG9qIWpZ13WcqVnLOMP+xhg5q44tzRriWwPSZ3EAY=;
 b=TMd7mMqbtecAoY2KkAaXVXSyuV12qUr0PY2ICi1xxaNej10pXCgT2UHnY29HwziAbgBRuXn4R/LidX3VoppYa33hxpiMl/+7oXwNz47AFml1/l+GPIlkpP12djAVjaWD2wZhQltzqRVHXQoBiucFN1jRLub5OIf0+MYvuas5KhM=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB8175.jpnprd01.prod.outlook.com (2603:1096:400:104::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 08:56:54 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207%7]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 08:56:54 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 5/5] arm64: dts: renesas: r9a07g044: Enable sci0 nodes
 using dt overlay
Thread-Topic: [PATCH v3 5/5] arm64: dts: renesas: r9a07g044: Enable sci0 nodes
 using dt overlay
Thread-Index: AQHZWxpJOyLhy/6kWkSwv+pz/AwLnK8ECjsAgADUi4CAAAtxAIAABQlg
Date:   Tue, 21 Mar 2023 08:56:54 +0000
Message-ID: <OS0PR01MB5922770E0B04DA506ACA922A86819@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230320105339.236279-1-biju.das.jz@bp.renesas.com>
 <20230320105339.236279-6-biju.das.jz@bp.renesas.com>
 <CAMuHMdXJDeWko1W_OeaJn7Xrgo3nBVnKrD_Ce8Xd0foD1nRDWQ@mail.gmail.com>
 <OS0PR01MB59222995B3AD342170AB311D86819@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdVHVFNiu5Eq5E2bRnzTzKRNf0w6QORJsFR3D_6YsoywBw@mail.gmail.com>
In-Reply-To: <CAMuHMdVHVFNiu5Eq5E2bRnzTzKRNf0w6QORJsFR3D_6YsoywBw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB8175:EE_
x-ms-office365-filtering-correlation-id: b1efc1ba-da42-41b9-955b-08db29ea37f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NV69LPxuNm/Q9MM1gCZbNr96WBtgU73FWLdv35uKOT1PGTBWUya9GotChcHSijooMtB+IT5Q5EJe0eRT9iI41D65UxIddGqKPUUUwptegDVBSRPNY3+imLYWYmMOWp+rtm0GeMV7vNUxE1BvE3GW12X5Ytvs2G2KMMmwqz1suzawPxcVIYxbxwEtH6e/xxyi6pb/Yln5wQIV/lwj+TZwv5gzPxnOHMh3qCRcBuS+Hr57/KVPWl4q0PCdNQeHicqINVDthTjPkdMlZApMHrdMWIRFGF5Vpiq8UuZyZWx/4f/lvqXMgR4yJGxjL2HGJOv1GQbZE9pS9XRHopFIkZI4NZ2ho40hJEep3UkURaUbtz7qzTRj+JqUz/rAaLeyHgQK2o56QhXoQQWEfwE0SL2qonOrWC+4kC8wEFQiX7sAItG9HGFcFDehR2ySRGcZhcIcOos0b1ZVWJli99bKGSCG1LPb9s6THwa8cMw/i8MFPHGa2KwOgMNKrqXDyFk00yq/5neym3tFmztFHTu3sjAnD0oAhowEQGKZTbfUoFilNzv7c0rZaXyfcnoPMnv+Q53+BU3cmy/FfYmszmEozCmCLOzexwkZQG8bpOc0A36+AqnssoE+BR227QqKZht4939jeuxi9v/J9EInS+NRmR7+GyqQfzQpnYBxAsyeUmEdeGM6Q+vVeVa43K28USIxKo/X1MMQWk0pgvhy4jTiRz3Pxw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(39860400002)(136003)(366004)(396003)(451199018)(41300700001)(7696005)(107886003)(71200400001)(186003)(4326008)(478600001)(83380400001)(8676002)(316002)(66476007)(66446008)(66556008)(76116006)(64756008)(6916009)(66946007)(6506007)(53546011)(26005)(9686003)(54906003)(52536014)(8936002)(5660300002)(122000001)(38100700002)(2906002)(55016003)(38070700005)(86362001)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bTVUTWxWQzBzdGpvRW9Gc2V0VVpCSy9lTHFkOVJ6TllqOGErNEtrN1RNbkVU?=
 =?utf-8?B?dGNEZU8wSmpEdzhFeG9sdklkYS90UkFhS2tGbzBKdEFwS1V5RGlVZk1wWEhY?=
 =?utf-8?B?ODQzZ2l2UDJGM0JzYnZrejQrbWtmSlpvL2ZEUExzMXh0a1F5TE92K3c1WTFF?=
 =?utf-8?B?Mm5xQm1vZmFtVTFkeWROTVRKWEJXSFlleWtHclgyL2ZuUEE2MDgxenhqd0Vn?=
 =?utf-8?B?M1I3cFRZbTZ3dGlUemlVRGZqbzdaalpsU1NkZUM0My9PUDU2MWtudWRjWnhJ?=
 =?utf-8?B?S3p3a3V1TEdZZUV1U3VnSk1KL2xXRHVFWlEyalBiTkFvdSt3RDlVUXVXVEpF?=
 =?utf-8?B?VERpc0dEQ0xDY3RyWGRsN0thSUFUM2kzMW1lYjV6alhLN0szTXNlMHdGakF4?=
 =?utf-8?B?NFFHZE5Oc0llUjNhUkJzOGFaR1lXRW1JS05HV0NoQnY2eHd3WXMxUXFEdWlv?=
 =?utf-8?B?Skc0VDVJeklOSEN6ZEJRbTF2NTVmWTB2ZTF2YXZYMTcxUkp4MHFIRm5ydjhP?=
 =?utf-8?B?S0hUYzQzdDFIelYvWktpTWdPZmYwc284dGw5dDM1bHJUZWNsTDh3b25HUFFx?=
 =?utf-8?B?dHdsWU9KZVZjNzNnT1M4b3RhMjF0K3kvR0pyQVR3enFuQnpEeC85ZlIzWHdH?=
 =?utf-8?B?dkRWU2trdko1VjJXeUhHNWpJTjVtTVU5Nm04aFlzUm04eU1aRXNVRHZTeTR4?=
 =?utf-8?B?UXNEaTlkL2xTZjRCUTVYWWNIT1dvUGdyWkhvQjZkSC8yclYxK1Q3ZFh5TzFh?=
 =?utf-8?B?ZWE2eDlabWRTdzRJRVdVTG56UkhtTjBYbHVldVFGd0hwOXZZM2UzRlIxemhM?=
 =?utf-8?B?NnBoL05MdWxxbnlvR1pYMS9TUFJSOWZxQVFiSjYwd284VXZXVVNRamp5amNi?=
 =?utf-8?B?eGFZWlR2eVZUR2xEU0FYcDdQRDlyRVk2N2QxK21CZE91ZGdIbDFyaXArMGhr?=
 =?utf-8?B?UVVWb1k0ZVNFS0RvRTR1ZmdoNjdscmYyMGZ1V0VsSVhNRkp0SmMzanlpMEV2?=
 =?utf-8?B?Qm91YTBMSnVPckZrRDFsY213bUdmazJ3TnZlZHZjU2oxN05IQ0hydktvWUtk?=
 =?utf-8?B?Qk1Dc3l5cXkvNENCRXR3U2lnRU5odFdwSW9BVjQ5TUhJNkhpcWxmY0xXZ3BM?=
 =?utf-8?B?d1kwUW1zMHlnVzRrQXlrNS8yUE9ueHhhcFpxYUdUczFadk9ubkVqQ244M1lm?=
 =?utf-8?B?Ti9IR1BCWUszdGw1M1JGanlxUEVIQ0YyRFYrZ0FHWWtId3c1VVFJa1ljcjIx?=
 =?utf-8?B?VEhlTXlRS1hpWFFNV0RkZFVoRytrL0pTbHlzY2MxQWhJcmNqcXNBc0NFYlls?=
 =?utf-8?B?aDZPZW5nbk5YUStobGg4ZE5vY2Q5R1NoUFJqQTgzZ2FCeHZRY2Zxd0R1b1Nu?=
 =?utf-8?B?RTZteDM2ejgyQkM0b1k1aHlpcUhtTXlpQjRLYVlWbkhRQWpSNzRweExXMUVh?=
 =?utf-8?B?SmdGaU1HeVFOYklEaTEzY2tzUkZzSW5DWGtabWpqK3JJbWs5WnVIT2xPcU5T?=
 =?utf-8?B?a1hpa3NZUHptZTZPWE13dmNsRmduR09iekpjamZWT0F4enFrQ0hWWlhLZEdi?=
 =?utf-8?B?dWpiTHhyY2NoZll5MDZEYndUQkFXR1YzOXYxQXBIbVpEYnE3Z09BekphR0Fl?=
 =?utf-8?B?K1VVZkJ0Z21oZy9vR0V5V1pGSmJhODZZY2Jyb0dOWDJ0L2lWemtkQmpLNE1h?=
 =?utf-8?B?ZHFJRmpTZGRDcmVuNUVtQ0Fnd0dGaWFCOVh3ZldUd2xuTGZPLzFPTnUzUUpp?=
 =?utf-8?B?dGM1enVPdUcwY3FmOVBjdzdUcWxTcEpuQXYrT092UHEzTkMxYk5oU3pDcVoy?=
 =?utf-8?B?a04vdXdNbXQ4WHhyRXVmMzg3U3g4aWg0aW11QVNYMGNScGhOZndCbmRObm5B?=
 =?utf-8?B?QWNLcGQ3NzA1WGVubzZPZkQ4RmZCRWR3dGJBM0MycmhQajhhNGZLZjJVZXdW?=
 =?utf-8?B?a05SWU1QVXZXUHVicnRpQjRTcHNjWXhmWU1XOFNrOWIrb1c2VzBCd2M1cGtT?=
 =?utf-8?B?TEdTOUJvZElrK2tZMURqSlJLUWpZYjRld0lCanB6M0FUdHpQV0trM2t0ejNK?=
 =?utf-8?B?eU95cGdGOUd3TUladzE3cTdzTk1RMTJkWDFlQzEwVFhWSkRvMFlxbkdaemFk?=
 =?utf-8?Q?ynY9ut8WDSRqqPnF3fnmICGt2?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1efc1ba-da42-41b9-955b-08db29ea37f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2023 08:56:54.0188
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fAgxqGmjOJUZZVSyzL/wikWY3CO03mJH3BkfvhDspM2MULpBvNtT/XwV+G/ZQpzBJkPBEslQ0WM58sQj891qmtblfzAN7H45pzoGo/ze2Io=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8175
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIE1hcmNoIDIxLCAyMDIzIDg6MzYgQU0NCj4gVG86IEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gQ2M6IFJvYiBIZXJyaW5nIDxy
b2JoK2R0QGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpDQo+IDxrcnp5c3p0b2Yua296
bG93c2tpK2R0QGxpbmFyby5vcmc+OyBNYWdudXMgRGFtbSA8bWFnbnVzLmRhbW1AZ21haWwuY29t
PjsNCj4gbGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIu
a2VybmVsLm9yZzsgUHJhYmhha2FyDQo+IE1haGFkZXYgTGFkIDxwcmFiaGFrYXIubWFoYWRldi1s
YWQucmpAYnAucmVuZXNhcy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgNS81XSBhcm02
NDogZHRzOiByZW5lc2FzOiByOWEwN2cwNDQ6IEVuYWJsZSBzY2kwDQo+IG5vZGVzIHVzaW5nIGR0
IG92ZXJsYXkNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUdWUsIE1hciAyMSwgMjAyMyBhdCA5
OjIz4oCvQU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4g
PiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBHZWVydCBVeXR0ZXJo
b2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiA+ID4gU2VudDogTW9uZGF5LCBNYXJjaCAy
MCwgMjAyMyA3OjE1IFBNDQo+ID4gPiBUbzogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVz
YXMuY29tPg0KPiA+ID4gQ2M6IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBLcnp5
c3p0b2YgS296bG93c2tpDQo+ID4gPiA8a3J6eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3Jn
PjsgR2VlcnQgVXl0dGVyaG9ldmVuDQo+ID4gPiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+OyBN
YWdudXMgRGFtbSA8bWFnbnVzLmRhbW1AZ21haWwuY29tPjsNCj4gPiA+IGxpbnV4LSByZW5lc2Fz
LXNvY0B2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOw0KPiA+ID4g
UHJhYmhha2FyIE1haGFkZXYgTGFkIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNh
cy5jb20+DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDUvNV0gYXJtNjQ6IGR0czogcmVu
ZXNhczogcjlhMDdnMDQ0OiBFbmFibGUNCj4gPiA+IHNjaTAgbm9kZXMgdXNpbmcgZHQgb3Zlcmxh
eQ0KPiA+ID4NCj4gPiA+IE9uIE1vbiwgTWFyIDIwLCAyMDIzIGF0IDExOjU04oCvQU0gQmlqdSBE
YXMNCj4gPiA+IDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+IHdyb3RlOg0KPiA+
ID4gPiBFbmFibGUgc2NpMCBub2RlIHVzaW5nIGR0IG92ZXJsYXkgYW5kIGRpc2FibGUgY2FuezAs
MX0tc3RiLWhvZw0KPiA+ID4gPiBub2RlcyBpbiBkdCBvdmVybGF5IGFzIGl0cyBwaW5zIGFyZSBz
aGFyZWQgd2l0aCBzY2kwIHBpbnMuDQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+
IHYzOg0KPiA+ID4gPiAgKiBOZXcgcGF0Y2gNCj4gPiA+DQo+ID4gPiBUaGFua3MgZm9yIHlvdXIg
cGF0Y2ghDQo+ID4gPg0KPiA+ID4gPiAtLS0gL2Rldi9udWxsDQo+ID4gPiA+ICsrKyBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDMtc21hcmMuZHRzbw0KPiA+ID4NCj4gPiA+
IENhbiB5b3UgcGxlYXNlIGNvbWUgdXAgd2l0aCBhIGJldHRlciBmaWxlbmFtZT8NCj4gPiA+IFBl
cmhhcHMgcjlhMDdnMDQzLXNtYXJjLXBtb2QuZHRzbz8NCj4gPg0KPiA+IEFncmVlZC4NCj4gDQo+
ID4gPiA+ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcGluY3RybC9yemcybC1waW5jdHJsLmg+DQo+
ID4gPiA+ICsNCj4gPiA+ID4gKyZwaW5jdHJsIHsNCj4gPiA+ID4gKyAgICAgICBjYW4wLXN0Yi1o
b2cgew0KPiA+ID4gPiArICAgICAgICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsNCj4gPiA+
ID4gKyAgICAgICB9Ow0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAgICAgY2FuMS1zdGItaG9nIHsN
Cj4gPiA+ID4gKyAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4gPiA+ICsg
ICAgICAgfTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAgIHNjaTBfcGluczogc2NpMC1waW5z
IHsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgIHBpbm11eCA9IDxSWkcyTF9QT1JUX1BJTk1VWCgy
LCAyLCA1KT4sIC8qIFR4RCAqLw0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgPFJa
RzJMX1BPUlRfUElOTVVYKDIsIDMsIDUpPjsgLyogUnhEICovDQo+ID4gPiA+ICsgICAgICAgfTsN
Cj4gPg0KPiA+IE5leHQgdmVyc2lvbiwgSSBhbSBwbGFubmluZyB0byBtb3ZlIHRoaXMgcGluY3Ry
bCBkZWZpbml0aW9ucyB0bw0KPiA+IHJ6ZzJ1bC1zbWFyYy1waW5mdW5jdGlvbi5kdHNpIGFzIHNl
cGFyYXRlIHBhdGNoLCBzaW5jZSBpdCBpcyBTb0Mgc3BlY2lmaWM/DQo+IA0KPiByOWEwN2cwNDMt
c21hcmMtcG1vZC5kdHNvIGlzIFNvQy1zcGVjaWZpYywgdG9vPw0KDQpHb3QgaXQuIEl0IGlzIFNv
QyBzcGVjaWZpYy4gTm8gbmVlZCB0byBtb3ZlIHRoZSBkZWZpbml0aW9ucy4NCg0KQ2hlZXJzLA0K
QmlqdQ0KDQo+IE9yIGRvIHlvdSB3YW50IHRvIGRyb3AgdGhlIHI5YTA3ZzA0My1wcmVmaXg/DQoN
Cj4gDQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3J6ZzJ1bC1zbWFyYy1w
aW5mdW5jdGlvbi5kdHNpDQo+ID4gQEAgLTUwLDYgKzUwLDEzIEBAIGkyYzFfcGluczogaTJjMSB7
DQo+ID4gICAgICAgICAgICAgICAgIGlucHV0LWVuYWJsZTsNCj4gPiAgICAgICAgIH07DQo+ID4N
Cj4gPiArI2lmIChTV19FVDBfRU5fTikNCj4gPiArICAgICAgIHNjaTBfcGluczogc2NpMC1waW5z
IHsNCj4gPiArICAgICAgICAgICAgICAgcGlubXV4ID0gPFJaRzJMX1BPUlRfUElOTVVYKDIsIDIs
IDUpPiwgLyogVHhEICovDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIDxSWkcyTF9QT1JU
X1BJTk1VWCgyLCAzLCA1KT47IC8qIFJ4RCAqLw0KPiA+ICsgICAgICAgfTsNCj4gPiArI2VuZGlm
DQo+IA0KPiA+ID4gPiArfTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArJnNjaTAgew0KPiA+ID4gPiAr
ICAgICAgIHBpbmN0cmwtMCA9IDwmc2NpMF9waW5zPjsNCj4gPiA+ID4gKyAgICAgICBwaW5jdHJs
LW5hbWVzID0gImRlZmF1bHQiOw0KPiA+ID4gPiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4g
PiA+ID4gK307DQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUn
cyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LQ0KPiBtNjhrLm9yZw0K
PiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkg
Y2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxp
c3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlDQo+IHRoYXQuDQo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==
