Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EED5704940
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 May 2023 11:30:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230425AbjEPJaR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 May 2023 05:30:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230203AbjEPJaQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 May 2023 05:30:16 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2111.outbound.protection.outlook.com [40.107.113.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FC51FD;
        Tue, 16 May 2023 02:30:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aXKthydgdYd5ZGiJ0XiiPZMwlVdHCmFLeEwCgKLYVEZPhAUjfbACy06f+y5oYp1bQsfiF2Uh5visV9w+Wb6CX3GY5wISPyG9ha+QgcLk7WGZd2PRdB8jdTxyYCnByTn0VwbShctjYMHaJttSMA6JYZ05EwQ/hBEt2wpXjjPdnVQZDbHqDHuhrJNMYXdGS1UBDGdnSk6/JeiTbzKbmNWba+GallJAFx7eUfd7HaH3fSUJTXw6AUY0lQso+ptA9hg5K20ndO91/1uAv+asnKwVPdx7/W7d8+2tncERnPMP7dDxOODqwU+drqA9nemwSvyvYn9Yly5QvIgAGc/YwBEXtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xPc+6wSSPVgqMJUH8P3PRpxAb1UUAYLWPs+cXIRU/g=;
 b=Pzq6DjmBUfYw4dsUn8RFhD5/prIxxGoIVF8971laQqdq0e76uzIM41EfA0Qow+AK1b4q7BYMqFcki9FpIJRkWAIVwIb4IZPKSCC62VAFy0Q38TqOR6OrZ7NwUPTukkqFvwOFuu/YsTNvXPiPVSO9lV0amReRtYYB5eiM2WKoAR/okF/4p0EyLzsBQbMozXrTHjGXKBlISnsvfxHlW/3V9cdvuH1rvKGA5aWMiT6XHA72ej5Ob2IMw9f1cuzZyQzR7f5lNkxYCDotQHnvR99wfLJagqnCo/sgul/fBQBAdSA9QffqQ4PFwpjabEk5kha/cjLAoAbwYoYLOA7Sp+eSGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xPc+6wSSPVgqMJUH8P3PRpxAb1UUAYLWPs+cXIRU/g=;
 b=Rzy6B47BR6vZYn9WHL1FrWhF6xbuzX+ki/OQJQKaCEldQNevly2V7f6dHFt0Y2BJkYnao32z1jCMCb8N5PR+emT357f5aQfn4rbggISsNKA6gTd3DkkJhKH2oyp/jdYMlyTBnkE3gflZ8NOvcPBi8gOinTikO1G0YyzDrsUFDoQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB8294.jpnprd01.prod.outlook.com (2603:1096:400:15a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.32; Tue, 16 May
 2023 09:30:11 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 09:30:11 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH v3 3/5] dt-bindings: mfd: Add Renesas RAA215300 PMIC
 bindings
Thread-Topic: [PATCH v3 3/5] dt-bindings: mfd: Add Renesas RAA215300 PMIC
 bindings
Thread-Index: AQHZhbtbMOqhbQvWykaInHFTxQ/ddq9cjXkAgAAOw6A=
Date:   Tue, 16 May 2023 09:30:11 +0000
Message-ID: <OS0PR01MB59222B5EE44743343B34BE7D86799@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230513165227.13117-1-biju.das.jz@bp.renesas.com>
 <20230513165227.13117-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdXpHgU3p1OE5_Vea8feqdyFbiSuyporhw6gEUwn=HX73Q@mail.gmail.com>
In-Reply-To: <CAMuHMdXpHgU3p1OE5_Vea8feqdyFbiSuyporhw6gEUwn=HX73Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB8294:EE_
x-ms-office365-filtering-correlation-id: e0b5b834-1775-4300-1249-08db55f0258d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tjUsihJ9NHB822R1L9W9GM5tP210mFNSOggU2HdE0v88TEkL9RmmnIMypwjVkPKp5k6KhJvPXqxaSpYSTlKu2M4X3t+j37kK32GMB04lvJXveB95Bg6n5NGv3B/mWsJ0IfTxiD8/On9gsM/PmwQaS8YxvrvqfTGnjXkKwe7L8YwErclcrKimkTnZ5wshrhIVna3b5W1ST1YIA0smXD3E0u6pjMD/H26wJ5m8wnFFxVcmZ3XayZG1rzjkmamcAuQhaDnuPr8qnXUtUWupYyScwgc2XGDX4TRdFZE5gkDSW2EwyT0XEYC7LPaP8K6Zl+MEE8llkVzYXgqnyp/orW/uYJ4aOv47U0nLJ5A2EIiDxxuuM9sYvTnak4y9I7m1ffcRuHpp41pgmj12ijB57+zzlBa/MZolvSuxhgw8pnQyHzi10xNSR5RrppE/HuUHEHntnDanz3XAj5JLsnApG9AY8B4su1oF5RA2/nN04ozVPjRwKGBx5tYqCNwztSmKEuXb18CeJoRSJmQx9kXsN804KaaouZ0oTCE8sNGy3a+fXzumVO18eqrJZGBVPIUduQN42C6GsSGzlBdGukJcb5PNyo4Dr1mTeZAdOC32ok71QOPe32T7FOlEjOHnw/5xudpR
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(451199021)(66899021)(478600001)(71200400001)(6916009)(66446008)(4326008)(66556008)(52536014)(76116006)(64756008)(66476007)(66946007)(5660300002)(33656002)(8936002)(83380400001)(2906002)(8676002)(41300700001)(316002)(122000001)(38100700002)(55016003)(86362001)(54906003)(6506007)(9686003)(186003)(26005)(53546011)(107886003)(38070700005)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SWw5cGczdDB3UVliTnRYMDExTEZwUHB2cEl5VU56TFFTUWx5SXRpRXFTWTkz?=
 =?utf-8?B?RFg5UW1Bd3VTbkRaMnJYTzZ1Mktia0RHMTN4Y2FLNWl6VXhSOXFrbmRHV3k2?=
 =?utf-8?B?MGNFTEFUY3JsZzlnSzNQbkZUK3psTlVnTEJCbFRLL0MyNk1iUStyeTk0QlNJ?=
 =?utf-8?B?M2s5djhCZkZJRkFkdW4xb0VzSlRVdFllak9vb09mQmlOQ1J3NFU5WnRMd1dj?=
 =?utf-8?B?Y2syN053ZUgxbFNQN0M2N0VzUW9WSFBHNnd4Y2JmQmh1bEtiRENOMkpsY3Ja?=
 =?utf-8?B?QTgyK2doWHo3bFBTdW5XVkc4UWRQcXM4Sjg1R0xlMDFFYXlaZ3pJQThNRldu?=
 =?utf-8?B?dWh4cWozVUpWcE5nNU9Zb0tHOE1tWXNkRmY2NFMyNVROSzVUb3Y4N3k4RjZT?=
 =?utf-8?B?bFVsZDg3U0h5V1VlYWVFTmRTVlpobXYyT1lVSGFsOUVKSHBjMWxYMG82a2R4?=
 =?utf-8?B?SE9EaE0xajh6S2s0K1BRUE1MNEJZby9wVWVteTBTcVEyS3ZDd0hGN0dNck9s?=
 =?utf-8?B?ejN2dE9JNVhMeUlNWlB1QU5XVmZKdHcydFI1UHdtRXdIOUFwSUZ3bTROdlEy?=
 =?utf-8?B?cGgyb1p2UEtxdEhkRk1FYnpSQk94Y2dFYnBWZUZieVhGaDdtc1laa0tSb014?=
 =?utf-8?B?UjJUMFI3RU1nRTgxa3ZZTXViR01YTWFxbEZISEpIQzhwNUEzbTRScDU3QXdJ?=
 =?utf-8?B?NHpkU0xkbDZFS0l0NElES1VtN1RXYUhkN0U3ZGtPOCtMVmhPdlZaaVpYUVNE?=
 =?utf-8?B?T0h6aVlyOTlNTEl5aURneDZPV2E3TExNaitNZXNKL3V4czdXRkE2U0FQZDdY?=
 =?utf-8?B?cU1oc3BDdit0djB2MEY5Sy9XY0lNYlFsQlg2Z0ZUaUhubXdjbkRoVE0xUUpX?=
 =?utf-8?B?NzBQaitmMFlWZlltWEdndEFKdEtyc0tJeXh6dDMrUGtUNkkvNUYraTJ0NEs5?=
 =?utf-8?B?STdwZ2d0ZGwvZmhicFRKQWpMUnBDejhUa1FKbU9KSENDYWROV1AwVFE4Mmox?=
 =?utf-8?B?T0hvc0I4SlhXOTBST0ZhRDdZcE5URklyaE5wck85RFFIekZ5U21GR0JMZXI2?=
 =?utf-8?B?Qmp1L1ZvMmxhVUtlY011alYvanZRSU80OHJJaFpQTFo2WGt5QzB4Q2VReHNj?=
 =?utf-8?B?L1RJZDZWZGgvRzlxVnNhdDJIeFEwZzZYN3h1Wm9qRkI0aU91Q2lSUzV1UVFP?=
 =?utf-8?B?RW9nNy95Q1dGYlFrOVE4M1FLajZpSWc5UDBCejJHQjJyZml5QllHRS9IbHNj?=
 =?utf-8?B?cFBnazZwZUtVU2wycUhnNS80aHFHbm83ZTF5NXoxQmhpVVJVU1U4VGJpL0hI?=
 =?utf-8?B?VGtPTzNyVGViR3I5WE9qN091Ni8zSzFtVXVhQkNXdXRpZU5hN0V1Zjh0VHBa?=
 =?utf-8?B?cUN4KzVNUjVnd0RyaVJWK2RwQ3dUM0EyZXFBakI3VkpoVTEwR2QrSnM0MWJy?=
 =?utf-8?B?NGhONmxXUmFMMFJWT2N3NDVxcGRiV3RnYUZWdU82WmN2aC9LRUFXSEw2em4x?=
 =?utf-8?B?TS96emgyWDNEaVE1bG1MVi93cWJEVVQyUktvMytXTDNnWitKaEYyZU1hejRX?=
 =?utf-8?B?NlVKQnpTQ3B6NXVFNWpvZE5JN2FWaWRtVmRwb1MyM0djS2FQWk5Vc2RaS2NJ?=
 =?utf-8?B?eW9jK29ucVJJTkRWYzJtY3dBOHJleWFZcVQyZ0RWNHlUUnRmV0dFdDJwTXBx?=
 =?utf-8?B?bC9rREVqbEdyeDBabGRCSjdjcjE2RWtFWGVKNC9nVXRXbk43NFhDZ3lxTzU4?=
 =?utf-8?B?YWFnV1kxbzV0c0V4b0RHbmM2VHlYSjJOWjJsV0Z3L081RnZSMEI5ZE9INDVs?=
 =?utf-8?B?UnVDZllYU3RScDlUbjVwWEEwdGJuUi9uOGJZSVdQcEZZdG5lMnV5MWtFUFRp?=
 =?utf-8?B?U1hMV1Fhd2h5ZS9TSFoxKytTTTZsN0IwYzFEeUJIeFJacjdkaVFPU0prcGNX?=
 =?utf-8?B?cVpITzN6MEpLVDdoRFpXREpOSHhRbWVRV3g4dFFWSG5Tc2UyVkI5ODBLSnJT?=
 =?utf-8?B?VUlQNnhZYzFKdXRqRnc1YlN4Tkova1FtTFFoaUllWEtkT1RIK3NvRTdHdHJK?=
 =?utf-8?B?ZzhoL01ZQ3Z0QkRzSGJ6SzlCZGpjcUtnN2oyU2xwZHFPQWFhaTRFelcvYTAy?=
 =?utf-8?Q?ThmuDePQUV3UO0LwyCeDroypw?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0b5b834-1775-4300-1249-08db55f0258d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2023 09:30:11.3415
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ns9AxdPULJ46GA13ikLuPP+1q56o136opuSk5Wa3wpRrQWtvxKFHwtRNN4xL8sgWpKhhCjW/0ecPDsZ06dleYgRnzEFrSK+P0dKaDDExqGc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8294
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIE1heSAxNiwgMjAyMyA5OjAwIEFNDQo+IFRvOiBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IENjOiBMZWUgSm9uZXMgPGxlZUBr
ZXJuZWwub3JnPjsgUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz47DQo+IEtyenlzenRv
ZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZz47IE1hZ251cyBE
YW1tDQo+IDxtYWdudXMuZGFtbUBnbWFpbC5jb20+OyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9y
ZzsgbGludXgtcmVuZXNhcy0NCj4gc29jQHZnZXIua2VybmVsLm9yZzsgRmFicml6aW8gQ2FzdHJv
IDxmYWJyaXppby5jYXN0cm8uanpAcmVuZXNhcy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djMgMy81XSBkdC1iaW5kaW5nczogbWZkOiBBZGQgUmVuZXNhcyBSQUEyMTUzMDAgUE1JQw0KPiBi
aW5kaW5ncw0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFNhdCwgTWF5IDEzLCAyMDIzIGF0IDY6
NTLigK9QTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0K
PiA+DQo+ID4gRG9jdW1lbnQgUmVuZXNhcyBSQUEyMTUzMDAgUE1JQyBiaW5kaW5ncy4NCj4gPg0K
PiA+IFRoZSBSQUEyMTUzMDAgaXMgYSBoaWdoIFBlcmZvcm1hbmNlIDktQ2hhbm5lbCBQTUlDIHN1
cHBvcnRpbmcgRERSDQo+ID4gTWVtb3J5LCB3aXRoIEJ1aWx0LUluIENoYXJnZXIgYW5kIFJUQy4N
Cj4gPg0KPiA+IEl0IHN1cHBvcnRzIEREUjMsIEREUjNMLCBERFI0LCBhbmQgTFBERFI0IG1lbW9y
eSBwb3dlciByZXF1aXJlbWVudHMuDQo+ID4gVGhlIGludGVybmFsbHkgY29tcGVuc2F0ZWQgcmVn
dWxhdG9ycywgYnVpbHQtaW4gUmVhbC1UaW1lIENsb2NrIChSVEMpLA0KPiA+IDMya0h6IGNyeXN0
YWwgb3NjaWxsYXRvciwgYW5kIGNvaW4gY2VsbCBiYXR0ZXJ5IGNoYXJnZXIgcHJvdmlkZSBhDQo+
ID4gaGlnaGx5IGludGVncmF0ZWQsIHNtYWxsIGZvb3RwcmludCBwb3dlciBzb2x1dGlvbiBpZGVh
bCBmb3INCj4gPiBTeXN0ZW0tT24tTW9kdWxlIChTT00pIGFwcGxpY2F0aW9ucy4gQSBzcHJlYWQg
c3BlY3RydW0gZmVhdHVyZQ0KPiA+IHByb3ZpZGVzIGFuIGVhc2Utb2YtdXNlIHNvbHV0aW9uIGZv
ciBub2lzZS1zZW5zaXRpdmUgYXVkaW8gb3IgUkYNCj4gPiBhcHBsaWNhdGlvbnMuDQo+ID4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+
ID4gLS0tDQo+ID4gdjItPnYzOg0KPiA+ICAqIEFkZGVkIG1vcmUgZGV0YWlsZWQgZGVzY3JpcHRp
b24gZm9yIHJlbmVzYXMscnRjLWVuYWJsZWQgcHJvcGVydHkuDQo+IA0KPiBUaGFua3MgZm9yIHlv
dXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3JlbmVzYXMscmFhMjE1MzAwLnlhbWwNCj4gDQo+ID4g
KyAgcmVuZXNhcyxydGMtZW5hYmxlZDoNCj4gPiArICAgIGRlc2NyaXB0aW9uOg0KPiA+ICsgICAg
ICBUbyBpbmRpY2F0ZSBSVEMgaXMgZW5hYmxlZCBvbiB0aGUgUE1JQy4NCj4gPiArICAgICAgRW5h
Ymxpbmcgb2YgdGhlIFJUQyBpcyBiYXNlZCBvbiBzeXN0ZW0gZGVzaWduLiBTeXN0ZW0gZGVzaWdu
ZXJzDQo+IG1heQ0KPiA+ICsgICAgICBjaG9vc2Ugbm90IHRvIHBvcHVsYXRlIGJ1aWx0LWluIFJU
QyBieSBncm91bmRpbmcgWElOIGFuZCBYT1VUDQo+IHBpbnMuDQo+ID4gKyAgICB0eXBlOiBib29s
ZWFuDQo+IA0KPiBQZXJoYXBzIHlvdSBzaG91bGQgZ28gZnVsbCBEVCBtb250eSBhbmQgcmVwbGFj
ZSB0aGlzIGxvZ2ljIGJ5IGEgY2xvY2tzDQo+IHByb3BlcnR5IHBvaW50aW5nIHRvIHRoZSBleHRl
cm5hbCBjcnlzdGFsPw0KDQpPSyBmb3IgbWUuIEtyenlzenRvZiBLb3psb3dza2ksIFJvYiBhcmUg
eW91IG9rIHdpdGggdGhpcz8NCg0KPiANCj4gSG93ZXZlciwgYXMgSSBvbmx5IGhhdmUgdGhlIFNo
b3J0LUZvcm0gRGF0YXNoZWV0LCBJIGFtIHdvbmRlcmluZyB3aGF0DQo+ICJCdWlsdC1pbiAzMmtI
eiBjcnlzdGFsIG9zY2lsbGF0b3IgKHdpdGggYnlwYXNzKSIgcmVhbGx5IG1lYW5zPw0KDQpJdCBp
cyBub3QgbWVudGlvbmVkIGluIG9yaWdpbmFsIGRvYyBhcyB3ZWxsLg0KDQo+IERvZXMgdGhpcyBt
ZWFuIHRoZSBSVEMgY2FuIHdvcmsgd2l0aG91dCBhbiBleHRlcm5hbCBjcnlzdGFsLCB1c2luZyBh
bg0KPiBvbi1jaGlwIG9zY2lsbGF0b3I/DQoNCkkgYW0gY2hlY2tpbmcgd2l0aCBoYXJkd2FyZSB0
ZWFtLiBJIHdpbGwgdXBkYXRlIHlvdSBvbmNlIEkgZ2V0IHRoaXMgaW5mby4NCg0KQ2hlZXJzLA0K
QmlqdQ0K
