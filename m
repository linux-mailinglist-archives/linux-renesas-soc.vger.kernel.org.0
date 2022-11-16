Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DB9362B4CA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Nov 2022 09:15:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238610AbiKPIPE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Nov 2022 03:15:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232343AbiKPIOc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Nov 2022 03:14:32 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2115.outbound.protection.outlook.com [40.107.114.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B2CABC9B;
        Wed, 16 Nov 2022 00:14:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n5HFhymNXFmxeHrByT/a/LYQEOp0o6E0tSCwzUAxFZmz+vUImnsnfyoZoLfBcLpNmDzV31mdgZmGdR5qAmnDfGrnLBU+eRvSXdez+FcPysKsaxMbY6JmLpOeph5lnZpow+Jq8qfxma0BTedF8NAK9cgSlbGC6hdBmEJPJ2L3pEV3IlKe0AP+iaXtf2l999u2h0of1BCn8mHgUOkYhPbVLS4rN8+Bu1yUMPMAvrSK3MYSpR3HhCik3xKKUGV8082JLET5A3dGjZFkGU1ELrJODh3HBe2ZsnJGZAgehOMFuIb4CKY2qOQXMOKq1AM89yulm/JOv/Q+fmetIgTTvQ6u4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=535JB2WUgmnwZo8P07t/A8b1x6AO4wvTCUNaJANX8UQ=;
 b=Bwh77HKTgPm3vkoDAxNUBGjZFrGRqX8J2O0i5nQ/QAgvW3SJiDNkVUXSXkYQ4AfRf5OL7dZLydG5uikRHeXkTQemuidHrBfUNkiVPsADOOxebbBMj+JeyxmCBxpXFl3mfE0VboGBEuahWjpb5YfihMZ369ChZiC4oy5kbJ7nmGMWLbEJzgoNH2MJbdGEwDnQeDkFaFWejvIQ025q78XM3WueqW1xCpPwtF9+3VpW4X+kEyn1QD77hVMlJvD2Fi3XyGRrPBxXYik38lCcx4h2nvGQIvcT776eSv/CzTiGg0TqjHxFgH2E7LLfwnSR3SuzTQ6RbfM/qbzj4fLxQuIETg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=535JB2WUgmnwZo8P07t/A8b1x6AO4wvTCUNaJANX8UQ=;
 b=vumGlpelxJVAsx3zQmPXWljoD+xIei+35sKtppa7jzrz9D3t2fdj/DW3WZNBW8rqkZNFVGwnJgnfxebDSeK3r7wColQRABgaL1onzQt8uy/zcnK/UUWFHnHKDLYY9UK8uhn4UgizjqfYPFW6xM137liIDbu67tQDw1KOYqJ+150=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB8288.jpnprd01.prod.outlook.com (2603:1096:604:1a3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Wed, 16 Nov
 2022 08:14:08 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::5b24:f581:85bd:6ce2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::5b24:f581:85bd:6ce2%3]) with mapi id 15.20.5813.018; Wed, 16 Nov 2022
 08:14:08 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH v2 1/3] dt-bindings: arm: renesas: Document Renesas RZ/V2M
 System Configuration
Thread-Topic: [PATCH v2 1/3] dt-bindings: arm: renesas: Document Renesas
 RZ/V2M System Configuration
Thread-Index: AQHY9SCBIuQl3m8nV0Kf1Ch8X1TBHq45ZpOAgAAH2aCAAB6FgIAABS+ggAUMRDCAAAS2gIAAAUsggAAD6gCAAACZMIAAJtqAgAABIaCAANe1AIABktuQ
Date:   Wed, 16 Nov 2022 08:14:08 +0000
Message-ID: <OS0PR01MB59227B0B3BC90248373E062986079@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20221110162126.103437-1-biju.das.jz@bp.renesas.com>
 <20221110162126.103437-2-biju.das.jz@bp.renesas.com>
 <ae35fd75-64d3-3ab9-8cc0-3cbcc9c34b78@linaro.org>
 <OS0PR01MB59229179DE3D3D00C4963F3186009@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <a7bbfdd1-1abd-2ee5-1d32-47d0bcb7e1f2@linaro.org>
 <OS0PR01MB5922863B8EC8DF54D8E881FE86009@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922C8A590502C8820B05A7186059@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <839d9740-e814-897e-d484-ded3d531a97a@linaro.org>
 <OS0PR01MB59226FC7CA88208AB5C0AED586059@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <a3e5d695-535e-8587-6ccc-4c65fbeba278@linaro.org>
 <OS0PR01MB5922FB7D32AEC159234037D886059@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdU=h_0Ay4U+PkzNQLE6nHP0UQ19fCdN4WPeh6e1H5TBZw@mail.gmail.com>
 <OS0PR01MB59220BB367224A4215365F0E86059@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdV3K9kSvp3_7L+v9Lw2rUPzXS-Ocd=9k4pQQYioCdGoyQ@mail.gmail.com>
In-Reply-To: <CAMuHMdV3K9kSvp3_7L+v9Lw2rUPzXS-Ocd=9k4pQQYioCdGoyQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB8288:EE_
x-ms-office365-filtering-correlation-id: accdeed6-9073-4cd2-a138-08dac7aa890f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nFfu8w2JCxyhq0kmW8KvYofRTFDba9l1ZeMSqvoFqOFHE54UEEvKtRpOUiKCyLn/7q77Kr45IYSZ7nU1XpwQo1dMjWbn0eHu9RaXBlqcUyioSxQJ5+vrh0hPXSx/yT0ZANypYjcMl0/gOiLsZCj0T0H2lLlPvWFAAQr0tDFfnFHzm8mbMIkPTP8HEFnQBavP4ytzIrL4OXuam8VMpbyFwyJXeWjZzwffG4vkvwV4wPnXkVw2C2/SNFDpQ+26XdBFi6RAaDvFFZUDjf1qPIgOAnreumA9u+8LN/D+v9e3YIrKP5ag2EyhQt0h0FqU3BW2loPxxB2ViQNQov2NwOqMvBoPf6QUkNK55JZCS28cK+EVk/wodsiIHM8ZBCLGCE7bRzJckopiyWymIT9ky57YXVFmCqHDjNLsKrlO5tMTHUYMHbxRLbq5Z5O8haA0WKe64ilSPJ+wAc58ilHj9jfOb4OdSWzoDURo8WNPQauh0MPebEb1QsDFyNzSMoLwJiA5IQMFUje41lzbFgYnuYnYWagJz9vL1oijF3y13RmaUNKMSR2kxzi6yBm0c1tddQgCT7mh6a/qJmLD2ey0leTowUApbvawKqp24oybWJNX78k8tMKaiRDCNpuc0dC1h4MBJb1vwNBAeRQhYJfcrj3b+C1BlLP5r/2iRjVCSbYld21QRChywoQEo3IQGNgeKa35vVS+nOosOSBB3pwfRAQXVLyWZSHcBeYl0jPviSoZUNHOxfHq0xzKsdL4kVRDwhL6
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(396003)(376002)(366004)(451199015)(66446008)(33656002)(64756008)(76116006)(8676002)(66946007)(66556008)(4326008)(316002)(6916009)(66476007)(38100700002)(5660300002)(8936002)(122000001)(52536014)(86362001)(41300700001)(186003)(71200400001)(83380400001)(38070700005)(26005)(6506007)(53546011)(7696005)(55016003)(9686003)(107886003)(54906003)(478600001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YmVFYWRXVTNtVWFIQkozVHdBM3E0YVpDY0N2K2k3QVh5S29LU2pOb2NjSHNu?=
 =?utf-8?B?OENyUFRQbHh2WUJ3akVmd1NnNWtTZjhTR3FFQVpVT1JrRTdUcDRMMzhzRERV?=
 =?utf-8?B?cUR4TTJ1TXBGSGR4Y2xxN1M0Y1lPc3NhTmp3YWY1dUEzUE5pb2pLdGpiVW1E?=
 =?utf-8?B?U1ZEV0Z0Ull4eXJQT3BkQWVCVWJOUVNpYTVhQjZQdmdMT044WFc4SHpyY3BY?=
 =?utf-8?B?OUNXb3ZSZVpacWxDbWp2WHAwTUhIcW93eThYS3dZSjdwRHRDS0FGelNLYllB?=
 =?utf-8?B?MXdEWVMrRXNROVBCNXg2MitpWVluVzlsSlE3d2ZBc0hqejVjaW9HVlJkL3Jh?=
 =?utf-8?B?SnN6eUFOaEV0UFhLRjh4cW1YY1QrZTV6YmFsYmluRU9qUzQ5MjFQSU04UnRj?=
 =?utf-8?B?SjMvN2xyZCtQZHBRdmJ4bXh1RldyYmlpY2lzQXVneDhFWUhmc01DQlJIUG5Z?=
 =?utf-8?B?WG01a1dzZFRQRVNBK3BKYWZTQXlMMk1tTmZLdGNoL0o2K0F3TEJpb0hHbnE4?=
 =?utf-8?B?TGVtakxwb3dEK2ladkxKazNlTHY2UEN2MW5yK0pKK2c4ejNCVkl2UXNqRzNw?=
 =?utf-8?B?SG10QWpPYlJwY3RHMjFEcHVXSnQ4WFFVQStJT25uMG5Tc2pTbEIxWHBnZERI?=
 =?utf-8?B?UEZSTC9PY29CM2puYUdYeWF4enFrcGtTKzJjLzlzOW1XM3JkQWZjRUNKUGlv?=
 =?utf-8?B?VmZYenlQMms3K3IwRmpUMlZhOGJQblZnYmdTMGllNXBqMWVFcjZQNS9DZlAr?=
 =?utf-8?B?RkphakRQK05QYmg3eVdkUk5GOUJnUURIbG5sRHRWOEdoVkVac1c2NytYZkNW?=
 =?utf-8?B?ZjZIVVB6U2Mweis1cFVKeDZrT2x1QUhoOTVYVlpNY1hteUZEc05UV3VibDRD?=
 =?utf-8?B?dDdhY2xWZFFXRHlHTDdrZjJITUdZVXNkVnhubW51ZlAreVI5U2tkK3hnN1NI?=
 =?utf-8?B?VW5FMHk4ZXh1OGtxRm9jUVRleFdxZGUxOXN1Y3VpNERweTk4akM5WmxxSmJQ?=
 =?utf-8?B?WDd0RkhKOTF5TTZ2NFdZZk55VTZ3bFNCWExRd1hvVkdSd2NLNGpGQ0pjMzYv?=
 =?utf-8?B?MmFkMjB0d0ExNUtXYXVtMEhNRjJjYzBnWDZaVUhma1JxdW5JWHcxNDdrMHFX?=
 =?utf-8?B?WW81NkppcTNzckVIeGlRbUY4RVVsdGltYVg0V0E5V0V2VEI5Ri9xeUx2bW0w?=
 =?utf-8?B?TVBLaGdCQUhkM1U0cUFvK0hBOGhPNWpteUNTdStTcmxBTHVDVEE0Rncyc1Jo?=
 =?utf-8?B?eXBqYTJJZVgzVEE3Qy9XMlAyTnMwZGwvZkV5dTJuc2Y5NDgwVEdFY0JmTEtv?=
 =?utf-8?B?UEc0bHp2YlFDcFE2MW0waDZqWlNkUm4zYXNiWGtLa0FiYUJxZUZObUxzY3dv?=
 =?utf-8?B?cHlETVE3bGh4R0V1d0NOTWZHYlVPYjlXZkt6c2VDd3lIaXZJRC9PbE9ud2tn?=
 =?utf-8?B?ZTF4U2o0bTF1QlQ4cnlIVXpicFMxdkVBWW5kRmtCWDFvLy9oblBtK0ZFSjRv?=
 =?utf-8?B?cGI5dHBHUUpZYkJmS2p1K0J2VVVPVXJ0dTVqZkVvT3o4QlM0YllDa0JCQ0E5?=
 =?utf-8?B?VjZZc2FZMisrVnVFNDFqa0dhV2tleXJUMWxDQ0xUQnpKRUk4NWFRN0R1QitL?=
 =?utf-8?B?c28xMVBMcjlhbW5iY0Y0QU9XUEFsVXdOSTBTWmltWHlyVko4RU9XNmxXRjVm?=
 =?utf-8?B?aVJCcGI2RWVuczAxbFNqWVFjbTk0d2hJUUZWNkZ4QXhVckg3OWlPMEpiNmxp?=
 =?utf-8?B?dm9ZclArUE9vYW0xREhlbU1UYXRQNmZTSk83UzNQVE5RQWt5bVphR21sUWta?=
 =?utf-8?B?bHRzTFlkbldkbHgyZTdsVW1ta0VUMW4rWW50aDVwNmx1NTlWM21xMlh1SjhF?=
 =?utf-8?B?TlhjTEwzbkphR05EL2ZzYTZPWVc0enpCUVp3WUczQmRqMlhzY1Q0K3NRRDBH?=
 =?utf-8?B?ZlB6YmdibUtSR01JZUpKNVJsK0JXWTc1QXR4YjJ3QkpIazFFaE9zTUNWenQ1?=
 =?utf-8?B?WXA4Vy9XZWI3Qitja0pZdjZ5clk5elVpRVMvS3Iyb3BZVzl0cHhQVHI4TDls?=
 =?utf-8?B?dER6NThlSXJDUWhtUzVJcUpma0tRVWkva2NXRzcxS0JYRmpwMlVGcWF6cTRN?=
 =?utf-8?B?RWY2d1pzZmJydjZ2ZU1lZXM3R0t1NFpuSTdrMFpWODhiemo1QmxNZEVIOFFV?=
 =?utf-8?B?V2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: accdeed6-9073-4cd2-a138-08dac7aa890f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2022 08:14:08.3748
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s/jke1rQY+IhMVkFKbmTU0q0QLL+MKY6sgEmdpXAS4U9PF4nTkwr0y0C0o6UOaFHW04bPLTX6H3I0bb8LKNDQ5ffzD7bJNnVH2QTa/tdmqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8288
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAxLzNdIGR0LWJpbmRpbmdzOiBh
cm06IHJlbmVzYXM6IERvY3VtZW50IFJlbmVzYXMNCj4gUlovVjJNIFN5c3RlbSBDb25maWd1cmF0
aW9uDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gTW9uLCBOb3YgMTQsIDIwMjIgYXQgODoyMiBQ
TSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+ID4g
U3ViamVjdDogUmU6IFtQQVRDSCB2MiAxLzNdIGR0LWJpbmRpbmdzOiBhcm06IHJlbmVzYXM6IERv
Y3VtZW50DQo+ID4gPiBSZW5lc2FzIFJaL1YyTSBTeXN0ZW0gQ29uZmlndXJhdGlvbiBPbiBNb24s
IE5vdiAxNCwgMjAyMiBhdCA2OjA1IFBNDQo+ID4gPiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAu
cmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gPiA+IEZyb206IEtyenlzenRvZiBLb3psb3dza2kg
PGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gT24NCj4gPiA+ID4gPiAxNC8xMS8yMDIy
IDE3OjQ0LCBCaWp1IERhcyB3cm90ZToNCj4gPiA+ID4gPiA+Pj4+PiBJZiB0aGUgaGFyZHdhcmUg
bWFudWFsIHNhaWQgdGhpcyBpcyBjYWxsZWQgImZvby13aGF0ZXZlci0NCj4gbmFtZSINCj4gPiA+
ID4gPiA+Pj4+PiBvciAicno4NTczNmRmbngyIiwgeW91IHdvdWxkIHVzZSBpdCBhcyB3ZWxsPw0K
PiA+ID4gPiA+ID4+Pj4+DQo+ID4gPiA+ID4gPj4+Pj4gTm9kZSBuYW1lcyBzaG91bGQgYmUgZ2Vu
ZXJpYy4NCj4gPiA+ID4gPiA+Pj4NCj4gPiA+ID4gPiA+Pj4gSSBnb3QgdGhlIGZvbGxvd2luZyBm
ZWVkYmFjayBmcm9tIExTSSB0ZWFtLg0KPiA+ID4gPiA+ID4+Pg0KPiA+ID4gPiA+ID4+PiAqVGhl
IHJlYXNvbiB3aHkgd2UgdXNlICJjb25maWd1cmF0aW9uIiBhbmQgbm90ICJjb250cm9sbGVyIg0K
PiA+ID4gPiA+ID4+PiBpcyB0aGUgcG9zc2liaWxpdHkgdGhhdCB1c2VycyBtaWdodCB0YWtlIGl0
IHRvIG1lYW4NCj4gPiA+ID4gPiA+Pj4gImNvbnRyb2wiIG9mIHN5c3RlbSBvcGVyYXRpb24gKHBy
b2R1Y3Qgb3BlcmF0aW9uKS4gVGhpcyB1bml0DQo+ID4gPiA+ID4gPj4+IGRldGVybWluZXMgaG93
IHRoZSB3aG9sZSBMU0kNCj4gPiA+ID4gPiA+PiBjb25maWd1cmUgdG8gb3BlcmF0ZSBMU0ksIHNv
IHdlIHVzZSAiY29uZmlndXJhdGlvbiIgZm9yIHRoaXMNCj4gSVAgbmFtZS4NCj4gPiA+ID4gPiA+
Pj4NCj4gPiA+ID4gPiA+Pj4gQXMgcGVyIHRoaXMgaXQgaXMgbm90IGEgY29udHJvbGxlci4gSXQg
aXMgYSBDb25maWd1cmF0aW9uDQo+IElQLg0KPiA+ID4gPiA+ID4+Pg0KPiA+ID4gPiA+ID4+PiBX
aGF0IHNob3VsZCBiZSBnZW5lcmljIG5vZGUgbmFtZSBmb3Igc3lzdGVtIGNvbmZpZ3VyYXRpb24N
Cj4gSVA/DQo+ID4gPiA+ID4gPj4NCj4gPiA+ID4gPiA+PiBUaGVuIGl0J3MgY2xvc2VyIHRvIGNo
aXBpZCBhbmQgc2hvdWxkIGJlIGluIGh3aW5mbz8NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBZ
b3UgbWVhbiwgc3lzOiBod2luZm9AYTNmMDMwMDAgaW5zdGVhZCBvZiBzeXM6IHN5c3RlbS0NCj4g
PiA+ID4gPiBjb25maWd1cmF0aW9uQGEzZjAzMDAwID8/DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBS
YXRoZXIgYmUgcHV0IGluIGh3aW5mbyBkaXJlY3RvcnkuIFR5cGljYWwgbmFtZSBpcyAiY2hpcGlk
IiwgYnV0DQo+ID4gPiA+ID4gSSBkb24ndCBrbm93IGlmIHlvdXIgZGV2aWNlIGlzIGEgY2hpcGlk
Lg0KPiA+ID4gPg0KPiA+ID4gPiBUaGlzIElQIGlzIGZvciBzdXJlIG5vdCBhIGNoaXBpZC4gV2Ug
Y2FuIGRldGVjdCBTb0MgdmVyc2lvbi4gVGhhdA0KPiA+ID4gPiBpcyBvbmUgb2YgdGhlIGZ1bmN0
aW9ucyBwcm92aWRlZCBieSB0aGlzIElQLg0KPiA+ID4gPg0KPiA+ID4gPiA+ID4gQWxzbyB0aGUg
c2FtZSBJUCBibG9jayBpcyBwcmVzZW50IG9uIHJ6L3YybWEgYXMgd2VsbD8NCj4gPiA+ID4gPiA+
DQo+ID4gPiA+ID4gPiBTaGFsbCBJIHVzZSB0aGUgc2FtZSBmaWxlIHJlbmVzYXMscnp2Mm0tc3lz
LnlhbWwgZm9yIGJvdGgNCj4gPiA+ID4gPiA+IHI5YTA5ZzAxMS1zeXMgYW5kDQo+ID4gPiA+ID4g
cjlhMDlnMDU1LXN5cz8NCj4gPiA+DQo+ID4gPiBBcmUgdGhleSBzdWZmaWNpZW50bHkgc2ltaWxh
cj8gRS5nLiB3ZSBoYXZlIHJlbmVzYXMscnN0LnlhbWwgZm9yIHRoZQ0KPiA+ID4gdmFyaW91cyBS
LUNhciByZXNldCBjb250cm9sbGVycywgd2hpY2ggaGF2ZSBkaWZmZXJlbnQgcmVnaXN0ZXINCj4g
bGF5b3V0cy4NCj4gPg0KPiA+IEkgaGF2ZSBiZWVuIHRvbGQgYm90aCBSWi9WMk0gYW5kIFJaL1Yy
TUEgYXJlIGV4YWN0bHkgc2FtZSwgYnV0IGxhdGVyDQo+IGRvZXMgbm90IGhhdmUgSVNQIG1vZHVs
ZS4NCj4gDQo+IE9LLi4uDQo+IA0KPiA+ID4gSWYgdGhlIFNvQyB2ZXJzaW9uIHJlZ2lzdGVyIGlz
IGxvY2F0ZWQgYXQgdGhlIHNhbWUgb2Zmc2V0LCBpdCBtaWdodA0KPiA+ID4gYmUgd29ydGh3aGls
ZSB0byBhZGQgYSBmYW1pbHktc3BlY2lmaWMgY29tcGF0aWJsZSB2YWx1ZSwgdG9vLCBzbyB0aGUN
Cj4gPiA+IHNvY19kZXZpY2UgZHJpdmVyIGRvZXNuJ3QgaGF2ZSB0byBjb250YWluIGEgYmlnIGxp
c3QgdG8gbWF0Y2gNCj4gYWdhaW5zdC4NCj4gPg0KPiA+IFRoZSBTb0MgdmVyc2lvbiByZWdpc3Rl
cnMgYXJlIGxvY2F0ZWQgYXQgdGhlIHNhbWUgb2Zmc2V0Lg0KPiA+IEJ1dCB0aGVyZSBpcyBubyB3
YXkgdG8gZGlzdGluZ3Vpc2ggYm90aCB0aGUgU29Dcy4NCj4gDQo+IFNvIHRoZXkgcmVhbGx5IGFy
ZSB0aGUgc2FtZSBTb0MsIHdpdGggdGhlIElTUCBkaXNhYmxlZCAoYnkgZnVzZXM/KS4NCj4gDQo+
IFRoZW4gSSBndWVzcyB0aGUgbW9zdCBzZW5zaWJsZSB0aGluZyB0byBkbyBpcyB0byBqdXN0IHVz
ZQ0KPiANCj4gICAgIGNvbXBhdGlibGUgPSAicmVuZXNhcyxyOWEwOWcwNTUiLCAicmVuZXNhcyxy
OWEwOWcwMTEiDQo+IA0KPiBhdCB0aGUgdG9wIGxldmVsLCBhbmQga2VlcCBhbGwgb3RoZXIgY29t
cGF0aWJsZSB2YWx1ZXMgdW5jaGFuZ2VkPw0KPiBDZnIuIHdoYXQgd2UgZGlkIGZvciBSLUNhciBH
ZW4zZSAocjhhNzc5bVgpLg0KDQoNCkkgc3RhcnRlZCBsb29raW5nIGludG8gUFdNIGRyaXZlciBm
b3IgVjJNLiBGb3IgTGludXggd2UgY2FuIHVzZSA3IGNoYW5uZWxzDQpPdXQgb2YgMTYgYXMgb3Ro
ZXIgOSBjaGFubmVscyBhcmUgcmVzZXJ2ZWQgZm9yIElTUC4gIFdoZXJlIGFzIFYyTUEgd2UgY2Fu
IHVzZSBhbGwgdGhlIDE2IGNoYW5uZWxzLg0KDQpTbyBmb3IgY2xrLCB3ZSBuZWVkIHRvIHVzZSBz
ZXBhcmF0ZSBjb21wYXRpYmxlLCBhcyB3ZSBkb24ndCB3YW50IHRvIHJlZ2lzdGVyIGNsb2Nrcw0K
YXNzaWduZWQgZm9yIElTUCB0byBMaW51eC4NCg0KVGhhdCBpcyBvayByaWdodD8/DQoNCkNoZWVy
cywNCkJpanUNCg==
