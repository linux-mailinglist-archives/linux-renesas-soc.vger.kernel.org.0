Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1971F563AA4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Jul 2022 22:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231985AbiGAUCD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Jul 2022 16:02:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230183AbiGAUB6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Jul 2022 16:01:58 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2106.outbound.protection.outlook.com [40.107.114.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE36753EC7;
        Fri,  1 Jul 2022 13:01:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SmucPvRyRKwix1BoGQzzg0zkLu21Q9/ODd0xsMVN9IT0/4AEEchvgK3P2RLLhd5OTxuJs0HE8zlemjxITqd/rQZcJhsloVRsn2Sd0wdexzM24vnKVAK1u7AP7otDzXiH5MLHdb4C4fipSHUe94XGv4Sj1Fk93CO1wX4aYYGT5ucfoJ/5JT9I1q7HA/USqaXW1i9cC7Lh+qZ/MCEtKgkUBMwzDW5jO7Bk2D2epnItzRXFNwg4Rr84AX/tqmiZAFY5dB1KBuGDEQC8+454R4hoIUb+3f4Ftkq0PotqYEFbTgUg4xGZBm1oHE3e109GIR+XF/YlcIoL1VU08bkNg5DtfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/MS6QBrnqug+kkiKEyrgzTC6RJNayR6ptErFrzZRn4=;
 b=l6knt4A4zklExmi8x7S/iXrXr8uYBo9oUTJF8ccKZvoUqF/NouJC5j6THGgvATWjTKU/PCAHqxzpTbgHLov+td7MtDCa1HbNElRo2xB4nj+G/+m8B2doVBNdVVD0wYkUOgGioPotS8oG4gkF0tS0Fo2CE1NgxNgIma+oa9NbNQ/ehGE9oxVtNgt32fIcC2/DwimkBThyO6MGuCzmo3xLEzUlETmZaTgZvahYYGSwUsR6+lORGwtyZkK6In3rD5o+Q61HTAVvomr4svwznnQFy/nRxgh4QnofO0YQZH3WAvwDABYRhFvXetaLE8bPBh86sBjp54VFbZ0scO0bMFB/hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/MS6QBrnqug+kkiKEyrgzTC6RJNayR6ptErFrzZRn4=;
 b=AyudlFxude8nmD47UBFibk35XWnMujhPFgGJbJ5gGCLd9r0JKaGYbBwqBfFhlpg+Ob+ZFfDE6ISgHRMY7VOKF8Bz7Nuvl9c8tnZYLADv8Ak1JbYmsHCQsPyhwtKc7MMzKYCGAiTpgPd8xzTKttq3c2A5l28WTg/u4L7aBp0+Pmg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB7192.jpnprd01.prod.outlook.com (2603:1096:604:14c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 20:01:43 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::dc06:eb07:874:ecce]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::dc06:eb07:874:ecce%9]) with mapi id 15.20.5395.017; Fri, 1 Jul 2022
 20:01:43 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH 1/2] ARM: dts: r9a06g032: Add CAN{0,1} nodes
Thread-Topic: [PATCH 1/2] ARM: dts: r9a06g032: Add CAN{0,1} nodes
Thread-Index: AQHYjWbnIRCcsS99TUyDaD42WE61ta1p116AgAAU1/A=
Date:   Fri, 1 Jul 2022 20:01:43 +0000
Message-ID: <OS0PR01MB592244D0344A1874D7F59B2486BD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220701162320.102165-1-biju.das.jz@bp.renesas.com>
 <20220701162320.102165-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdUNm+HubG_JWwGWcSu4rJc=0-YUf1+1BpQQ6QX-5LOYrw@mail.gmail.com>
In-Reply-To: <CAMuHMdUNm+HubG_JWwGWcSu4rJc=0-YUf1+1BpQQ6QX-5LOYrw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 46c099b0-7d12-4a76-687f-08da5b9c8555
x-ms-traffictypediagnostic: OS3PR01MB7192:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BfUJRzL/hGimjKx3SeGGlm/vXs1mCg/h7u6rHkPw1A/TEbh1+agKqj+gj3bcS0NseSNKQz1RbogX6mTpGeFDv0Y1lX2AqlF7jxT9x9izKo6RzJZcwceXXrkgPBW0tQMW4KCLo6dWIn3L7aQfIDafTwJUxai0ryOpouFS8Oy+pw6S3mCdk7d0r6v8W/onougxFElyMFyT+lGOCsAGAbLKkZ3ahJqt6WBLRIh0RvmF5d+PTu9GgzwGSLv+hGFfpvipCT63EuBbS2hbtPwqI8BWQNasnMZxjVwCXq0zJpAaMV1GJf+V9P1OTzXdK+AqfHZurPcoJvTQht5by1oyhRV+WgCxdogDKm0A28h7sm8fROui6GnMmXasLbqlQJ11oUtGz6Ws2VbjltZHLXi8fHfzK0uP1q02S3BR1R29CC9W9kth2x8hDQy88TZVdsIKMTyafJ4YDMjx/EqbdRQLswdxerrvB5kER4zKaqpqn5SxjZkXBYTG/fN0FCtyUiH/g4EDDeVRM/flQLXvHOMcDvBLNQu5ex9zvr6bQ7gi4X2A2Zsc0Kth5WAl1pVRi6KwiY31dNNtW/t+s4TEWdteOJLzeY6CEYUGG4ycIQ99DJAcrCyNEzIhm/kMESlgPqBzs3sQXfRymB5ZiAye2qRtYuuiBOi/dhoj3zwr1D+YMk2U6pY4mLl6EwQv3TpH9SuJohn1qAogLECa2obFKsbC17FRbm6WMCTXG6QYMcHfTI9ufPAUkzx4a6tju/s9tokwPRxo9BzxQ/2E9RHfcdGaS+PiQda69mDTziF49ET4Ro1YFUlnon8fdtf0ihE+WQI1FOLX5tVz1AFlfCloCsOwXXAm7RiOjxw7wegrzHxvU19FxBptHK9rkX00iMJeaqkEKxEP032O5l4NUWZAX09+btR1lg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(346002)(39860400002)(376002)(396003)(8936002)(6916009)(52536014)(186003)(83380400001)(76116006)(26005)(38070700005)(66946007)(9686003)(86362001)(316002)(54906003)(53546011)(33656002)(107886003)(2906002)(966005)(8676002)(71200400001)(4326008)(64756008)(7696005)(66446008)(66556008)(66476007)(478600001)(41300700001)(5660300002)(55016003)(122000001)(6506007)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVgyQ0FtUTZwaUhySEhtcUVyMmtSUGhvOEZmbzN1TStYVkRORHJKRm5Ja2VJ?=
 =?utf-8?B?ZVdnR3FUQ3F5SU4xY01PSXZ6RlloNGhPcXJtYnpqdjBFNTFmcHhCOXFWcUtR?=
 =?utf-8?B?VG5UdjZVWkpyV3c1UkNXMDRBVXVtNWJUS3BBUVhxbUpIQVJPc3drTXplbG9Y?=
 =?utf-8?B?cUJSd2Ryckx3Vm92a2czTU1SdXh2WTlRaWU2b2x3amIvNmJVd21aNUpmN0Zh?=
 =?utf-8?B?aXkvUm5zMm43cnVBa2ZvbWNoMEU0dW0rYTRSRklSWlpUcVU2YytJZU5kS1cz?=
 =?utf-8?B?NzNzc3BuQ0ZmaDMwK0d3NDJDT0FkS2pNaDdHTkJYdUpGc0RCcFpMWDF5VFFz?=
 =?utf-8?B?TmlFWXNNOWxvY0hRaUZ0NkxLTDRRK1B3MGdxbExoN20xTk5GeitzVXFzajZY?=
 =?utf-8?B?eGpoMzhqWlhDWUNPSlNaUXcwNkhyek1BOTMzYjdmRnRUQXpEYTNaYUx2eG8r?=
 =?utf-8?B?MGwyZ2tRVmFudVUxOW16SDRVTUNtbDQvNFFBeHZPQ012dTBtMklyYUFiUWxy?=
 =?utf-8?B?c28xYzNBR2V4UitXN01UdFdxbTBWTUdBOFBIS1lpSE1mUXlsdHlSdkNtb3hW?=
 =?utf-8?B?S1JhWHFsQlZoSXBlVURHWUtEaUd6SzZNejVDcDdJWWFnQ1daRE41N25lUVJs?=
 =?utf-8?B?YTVDU0pFYnJ1QmIvZXRhOXZGUk12UGpmd2taYjQrSS91RFBNRzJ1OGt4WU9l?=
 =?utf-8?B?RjN3M0hsbXBNRGFYWFJRSEozT1RTa2FhSnVjVFBDNEVvenB2R2J6bGo3SFJI?=
 =?utf-8?B?bTVYYXBNb0ZQc2hvWUdBSU9OeE9WdXFmMmh6L2NjcGphRnNjSHlJbS9XK2dq?=
 =?utf-8?B?NWdYOUp4bC9MR1J2L290ZjJjT1dJK2Fyc2xuTmtFdHZQeW1rRmdJL0FmdG5U?=
 =?utf-8?B?UjhSZTdTdXZ4UXFZdjNBZ1h5ejFZR0dyR2xTS2hLZUVVT1BuZkNHckYvaFFm?=
 =?utf-8?B?RGRyZFBST25JUUdZNjdKT2V1dzdubTRWdzU1UW1BRWl2aVNQUkRIelF4OXd5?=
 =?utf-8?B?cEkzUXRmeExqaFVmdllZMDdLMitjR0o2WHdPeDF1ZzI0N3RCdTAwdEVmMFl1?=
 =?utf-8?B?WkRnaUcrSFIweFREZllxN2Z6eXhGTmx6YWNQVTVPMUVoaEJoV1J3SDRXWFJH?=
 =?utf-8?B?SGxxUytlTVllNDh6SkIxc1ZoKzF1TDlIUmdFN2M1WS9oRzFzalp5MWhCRDM1?=
 =?utf-8?B?ZVhNdlpJRk8rQTFxZGFuYUJjMHNxUDZUYXg1SnVkcHQ4UG9CVWxlMXloWCtP?=
 =?utf-8?B?bUo4RW5DZ0dtWlA3bnpWZklIdkVRR3phdW5PdkY3a0RsN0JycWFVenozS2k4?=
 =?utf-8?B?WHdJbVByU3VzQzZvZVFJRXpVMGdEcTdZSEkybVpNSDkyR0FSend1alFkaHNt?=
 =?utf-8?B?d1BzbzZ6SVZjYW1OM3Y2U29CUG9IazJtclBOSXo4cDdoclVPQW45NThXdjJs?=
 =?utf-8?B?Q0VJTjRYbWJmZHhZbEtWTExhTHVFRWVKdGp0OUE3VFkrc1o4dStHSitjdWFi?=
 =?utf-8?B?cFJENVIzdUhkVVBvQUl2ZEExTzNRK3lBVnY5OVplVWQ5SVd6dTIySWd2VDdR?=
 =?utf-8?B?MGlTVmYyWmlBcUxvVitlRDl0bnZYWnJHNlUxTmJOdnhrc2hQek53QUt1N3BB?=
 =?utf-8?B?MnowcGR5eG9DWU13bVcwbTZ0OXlLOEE3S0FEbHdyUVRWdUlKWnJYbTgvd2ZB?=
 =?utf-8?B?d2NhaVNkeS9RU0hrLzZEZjdtanRSOExFZjFsZVEwK0ZuOFdxcHBPMXA5T2cx?=
 =?utf-8?B?a3NaQUZDeTBKT3BZR204Z2RET0Nod2llbXZIMmMwYVIrbVF5d0FCbnNYRlRS?=
 =?utf-8?B?QW9uWVJiQndkVkZ2aXZ0YUw2QTRiWVNOaWt3Mzl2eW1qVlZNRkNydCtrK1h6?=
 =?utf-8?B?Tk4yOXl1TDRlRjIvVVZFYW5HQ0d3c1hCZGd4Q2I1N1JKZU5TN1JUMTUrTkJB?=
 =?utf-8?B?NmJUMzVISmVNNUdKMUR3YllKa2FMZFlIUmdQY1J1Rk5pYWIwU1BNTGRqOER6?=
 =?utf-8?B?a3UyK3VLRjh4eEFaTnlwMFdpd3k2M2VIR1ZrcmJMSGlqV0FOVzk1VW5kdmRT?=
 =?utf-8?B?TTlCK1k5c2NPak1wNUZGWllVOFI1ZS9GSkNxcVlTMGFpakV1VTV0MUpFU01O?=
 =?utf-8?Q?FtaVFDeUDQS7rjmdYHsoW5HBc?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46c099b0-7d12-4a76-687f-08da5b9c8555
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2022 20:01:43.6026
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uum3AxFaZc2kMSiPs53BLbVq9jbp0nII4c024/r69F3VGIh28WChFUoBR+T/kp3YOJEdsShImho87xrWjNdHxfTnXOefvoJ7bYBALztos30=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7192
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMS8yXSBBUk06IGR0czogcjlhMDZnMDMyOiBBZGQgQ0FOezAsMX0gbm9kZXMNCj4gDQo+
IEhpIEJpanUsDQo+IA0KPiBPbiBGcmksIEp1bCAxLCAyMDIyIGF0IDY6MjMgUE0gQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiBBZGQgQ0FOezAsMX0g
bm9kZXMgdG8gUjlBMDZHMDMyIChSWi9OMSkgU29DIERUU0kuDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3Mg
Zm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3I5YTA2ZzAz
Mi5kdHNpDQo+ID4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvcjlhMDZnMDMyLmR0c2kNCj4gPiBA
QCAtNDIzLDYgKzQyMywyNCBAQCBnaWM6IGludGVycnVwdC1jb250cm9sbGVyQDQ0MTAxMDAwIHsN
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0NCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDxHSUNfUFBJIDkgKEdJQ19DUFVfTUFTS19TSU1QTEUoMikg
fA0KPiBJUlFfVFlQRV9MRVZFTF9ISUdIKT47DQo+ID4gICAgICAgICAgICAgICAgIH07DQo+ID4g
Kw0KPiA+ICsgICAgICAgICAgICAgICBjYW4wOiBjYW5ANTIxMDQwMDAgew0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAibnhwLHNqYTEwMDAiOw0KPiANCj4gSXMgdGhp
cyBibG9jayAxMDAlIGNvbXBhdGlibGUgdG8gdGhlIG54cCxzamExMDAwIGJsb2NrLCBvciBkbyB3
ZSBuZWVkIGFuDQo+IFNvQy1zcGVjaWZpYyBjb21wYXRpYmxlIHZhbHVlPw0KDQpZb3UgYXJlIHJp
Z2h0LCBXZSBuZWVkIFJlbmVzYXMgU29DIHNwZWNpZmljIGNvbXBhdGlibGUgdmFsdWUgdG8gYWNj
b21tb2RhdGUgdGhlIGJlbG93IGZlYXR1cmVzDQoNCjEpIE5vIGNsb2NrIGRpdmlkZXIgcmVnaXN0
ZXIgKENEUikgc3VwcG9ydC4NCjIpIE5vIEhXIGxvb3BiYWNrKEhXIGRvZXNuJ3Qgc2VlIHR4IG1l
c3NhZ2VzIG9uIHJ4KS4NCjMpIFdlIGNhbiB1c2UgdGhlIGNsayB0byBnZXQgdGhlIHJhdGUgIA0K
DQo+IA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDUyMTA0MDAwIDB4ODAw
PjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZWctaW8td2lkdGggPSA8ND47DQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDk1IElSUV9UWVBF
X0xFVkVMX0hJR0g+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwmc3lz
Y3RybCBSOUEwNkcwMzJfSENMS19DQU4wPjsNCj4gDQo+IEFjY29yZGluZyB0byB0aGUgKG9sZCkg
YmluZGluZ3MsIHRoZSBjbG9jayByYXRlIGlzIHNwZWNpZmllZCB1c2luZyB0aGUNCj4gbm9uLXN0
YW5kYXJkICJueHAsZXh0ZXJuYWwtY2xvY2stZnJlcXVlbmN5IHByb3BlcnR5IiAoc2VlbXMgbGlr
ZSBib3RoDQo+IGJpbmRpbmdzIGFuZCBkcml2ZXIgY2FuIHVzZSBzb21lIG92ZXJoYXVsKSwgYW5k
IGRlZmF1bHRzIHRvIDE2IE1Iei4NCj4gQWNjb3JkaW5nIHRvIHRoZSBSWi9OMVMgZG9jdW1lbnRh
dGlvbiwgdGhlIENBTiBjbG9jayBpcyA0OCBNSHo/DQoNClNhbWUgZm9yIFJaL04xRC4gTWF5IGJl
IHVzaW5nIFNvQyBzcGVjaWZpYyBjb21wYXRpYmxlIGFzIHN1Z2dlc3RlZCBhYm92ZSwgd2UgY2Fu
IHVzZSB0aGUgZ2V0IHJhdGUgdG8gZ2V0IHRoZSBjbG9jayBzaW1pbGFyIHRvIFsxXT8/IE9yIHNl
dCBkZWZhdWx0IG9mIDQ4TUh6IGZvciBSZW5lc2FzIFNvQz8/IA0KDQpbMV0gaHR0cHM6Ly9naXRo
dWIuY29tL3JlbmVzYXMtcnovcnpuMV9saW51eC9jb21taXQvODg4MTdkNzgzNjU4YmRmNmNjY2Zj
MWE2ZThhZDQxNGFkN2E3YzE3Nw0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsNCj4gPiArICAgICAgICAgICAgICAg
fTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgIGNhbjE6IGNhbkA1MjEwNTAwMCB7DQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJueHAsc2phMTAwMCI7DQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4NTIxMDUwMDAgMHg4MDA+Ow0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHJlZy1pby13aWR0aCA9IDw0PjsNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgOTYgSVJRX1RZUEVfTEVWRUxfSElH
SD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZzeXNjdHJsIFI5QTA2
RzAzMl9IQ0xLX0NBTjE+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJk
aXNhYmxlZCI7DQo+ID4gKyAgICAgICAgICAgICAgIH07DQo+ID4gICAgICAgICB9Ow0KPiANCj4g
R3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0K
PiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBi
ZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFs
IGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFj
a2VyLg0KPiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJw
cm9ncmFtbWVyIiBvciBzb21ldGhpbmcNCj4gbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
