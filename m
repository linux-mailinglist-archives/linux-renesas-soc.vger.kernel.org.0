Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FE237C7B84
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Oct 2023 04:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbjJMCKx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Oct 2023 22:10:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjJMCKw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Oct 2023 22:10:52 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2094.outbound.protection.outlook.com [40.107.114.94])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38686B7;
        Thu, 12 Oct 2023 19:10:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0AE6WzTwj0RLTIdyIrbbBpCIQL8vHDVdJvFWDLiDolRyc7dEcTMTlA6Qj1bFSMEvez/Ika2zz+ESdtS3oEx316gBBp9RsNHoXP55YcZ9AJRlpe80ITYEfcmEubqmjd20GzgrBvlLzODYdLcEE8G0dT8PQRvsnt9ZDiectH2qj284bBe2AJhPcvB0A33mijPL6QYhOWN2FWr6ugmLsmokQzCOIj7QOJA6AqGPTY5vlSUTaF0fm/P4CZVwY3m/1J2rvzejLK/EdHP59bFCBv9Lx6fEcOJf3bqHZ/NufLweNyDCiU3mkv+Sqb6wsHLr8zXEmKPI1KT5mxXMJdkY1+zCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YO3/HA97PFprjJe1XsIOh9hdwjaXaTmT8yhoozezVpI=;
 b=QiBqUHQpIy/jDU7qyccyE8bIQVnzsdUcXhglEb6ITcVLthfPXbjziAPnK5wTH3pKjAnKCgS4QwaJiIacf30fIQE3KUTQrpl9pzeMLHY3rlsb7cn+jXqP10hgTkDGs7lIN86/1isl9KPIUk4rxl3n5QJhSowd9OtFra0GDV6njZbhu7mBGleOkGvvQ4FarIetEb36naiOMr5rL+nKkjFeAOzRsqotEDl1SAdaOD2Sy6ynU4QJc2iP1dwhHB2N605Mxl2mmaDB8YGCHr/kLDSGBEo8k07+U7dMlQQ3s/Oi2FHygosg5Ik4xB4MzSueVeeqADp7wBg4wT52Iy3Ey/Ab7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YO3/HA97PFprjJe1XsIOh9hdwjaXaTmT8yhoozezVpI=;
 b=Vbf0qIJq9S+OG4bE/B7Epb9B/sbTje0GY1l+2HFemPoRoad+t3XHazWsq6f3O+nDSCU+F/du13LubunGgLGF1SIdCKk2hx/AvqgCCb81Bas4EsETen2DuzR1i25AfaNDyCJI/QxMhntmWJVkwnsDHLs3H9jTK284yqZqs5nofP0=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OS3PR01MB8652.jpnprd01.prod.outlook.com
 (2603:1096:604:19a::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.46; Fri, 13 Oct
 2023 02:10:43 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::1dc4:e923:9916:c0f7]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::1dc4:e923:9916:c0f7%7]) with mapi id 15.20.6863.046; Fri, 13 Oct 2023
 02:10:43 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     "s.shtylyov@omp.ru" <s.shtylyov@omp.ru>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "edumazet@google.com" <edumazet@google.com>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net-next] rswitch: Add PM ops
Thread-Topic: [PATCH net-next] rswitch: Add PM ops
Thread-Index: AQHZ/QXyGwTSvnuvKE+t4wejKpfSH7BGFwMAgADbmiA=
Date:   Fri, 13 Oct 2023 02:10:42 +0000
Message-ID: <TYBPR01MB5341F5AAE321E3E373012E4DD8D2A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20231012121618.267315-1-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdWAk9kJBGGq9K-RnC0HFZk1XbaosTBO2OW1kpYFPh1Mqg@mail.gmail.com>
In-Reply-To: <CAMuHMdWAk9kJBGGq9K-RnC0HFZk1XbaosTBO2OW1kpYFPh1Mqg@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|OS3PR01MB8652:EE_
x-ms-office365-filtering-correlation-id: fd0b3d0f-80ca-4971-b97e-08dbcb919ac4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ydvMXrWlyY1UJFaiaKYJgqvjXh3rMvcmsApIL5/gMa4dFssO5mujlJd3mBnRuEYv8Ue+/2LJ24T5Lm7UmYdu9U6OmTSMJz8vJkOQxYtbHBs2NYdMLQ00UQbFTkFm7HT6xr+JB87C+ACei990aOolu3CB35Cph3q73XpQdRzkv2Ap8+5pmXgoy0LmqFo79yY4GKvrvktOX2w6WAU9xuCtMk2K5Xn63oKglyDPGl6+qExOV/IpxqcPp1l0nTg9s+c/v1avzDYJLsQYyNVcRZ+qRSLEehMV1B81mbS58Lb+jT7hqKj7ZLcCwwEUZtNOlY5sWVsCGFBK5C0aujzgSYroeQ5ozvjMYRD5o/vdsZSCe1E0DTUdnr3JQ7UDiaoqOLwglwxVNdUaVBf4FzqUhgcMmh9tAx7mteZ7Q/i/f1KhArWgBLs4oj/ntvA6aBxLDKgn9boinOdy6nsFtfu3pREUrN/QfLwn61pj8h4Ra7KYmKuLiq/DqNWa9RJCTveabeKEHCICCH7y9NotwuwayZ8UdlAO1u9CDzbgqHeyA3BC5/vW2aEmq0n5y53/3nKvp/7B+CRAq5sVHlQcWzuuDU8Ri69I1IbfsZmR/gZJ7K6HzMNVqttfBTQdgltFrDf3xWAK
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(376002)(396003)(366004)(346002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(2906002)(122000001)(478600001)(38070700005)(38100700002)(86362001)(53546011)(9686003)(7696005)(71200400001)(6506007)(83380400001)(41300700001)(8936002)(4326008)(66946007)(33656002)(64756008)(6916009)(54906003)(66556008)(66476007)(316002)(76116006)(66446008)(5660300002)(52536014)(55016003)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QitpaUc2OXR1aEhzQStYWm9KOEpuMHhheFRqNU1vaHkvZHc0YTlOUDNWNWM4?=
 =?utf-8?B?WWNFa3RuamdKWW9Ub1FsNU44TUJtdDdZYjhrOXBGVVBaNEZIRWhZNEd3NGxZ?=
 =?utf-8?B?STdFWXRNQURSQk9UaEl2Mkp3NHpUd3BXeGF3UUt5Z00vU201dmFHb2Z1N24r?=
 =?utf-8?B?eFNKcEhEaE5PYWQwNCtvWkw3a3ZvRkJDL25KSnlXdVlzR2ZpUjI4TE1WZlB6?=
 =?utf-8?B?My85NmdpUUFjRjVPcWZ3aHRhcDF2S3dZTENXa21mS0p2M1hUeThiSzFrd0Uz?=
 =?utf-8?B?S0FwM0FFdUkwY1dqRitNSjV6RGxsbzkxdDN4TjlOT3o2Sks5L3QrSldnZSt6?=
 =?utf-8?B?enU2K3hzRUczdlhnVkJEN3V3akxsUzlhTG9vdFJNOVVzTDBYanN4cTh3ZDhl?=
 =?utf-8?B?ZGhrdTc5SW5mcjN2cXZhTWE3MFJKMUtEMFhlYllyMUdHcnNVQi9lZk1rY2ZK?=
 =?utf-8?B?VmprbVo3OTByRzZJT08wK1hVb0dKKzYxSGViSTJmQUh0RWorTjNhTVp3THlC?=
 =?utf-8?B?UE4ydGl0Mk1NN2QrNkJBRnRJNEtRRmdmbkY0QitiYzQwTHNPWWk2MUV1RnJn?=
 =?utf-8?B?Mm5ueTZTUEFzREc3T2Y0SHZaTEZtSmZVaFFGZ2VrbE1qTXVjSnRTTmZ0OFB2?=
 =?utf-8?B?ZWFXd3ZJOFhKZThkMGRXVHRKcFFpeDZ6cTFHeWF4TmVWSGZzYk9LdTREaGxK?=
 =?utf-8?B?aGxpUHFXeVl3dndHcHNpN2Jlcnp5UkhDWlJZbFpGQnpMcWRBNDhCaHo1aTQ0?=
 =?utf-8?B?bFA4c1c3bDhnQWhNWEwrSGlwK0hseWdlVG9oNmc5K0ZaSnh6ZE9sOVRLN1F0?=
 =?utf-8?B?Wlpoc3hzVy81T0RqbGJOamU1ZVZqNmN3WjNaRFJEMHI2ZEpNcUdOZndBWFMv?=
 =?utf-8?B?ZFRwUFJnaHVHRXQwamxOMGRXTG81dW1nNi9RZGxNVjk0eGhoVmZRa0o4c3Zo?=
 =?utf-8?B?WThHaEdkMXp6VHRCSmMrOHY2NDZkZ2Vsb1NjMHlyRVdZZkZaVnRrRXFqTHFT?=
 =?utf-8?B?TVVYU3hjVTUrb3lQdzVLWEg4bWRjU2VsaXNhdTROdXNjemNwVWxpa0R0V0dv?=
 =?utf-8?B?OTZ4Z3FtdjYwN3YxSS9hb0loRFo5NEJXVHV0Vm5kbXVEbWZGQlgySlRNemNX?=
 =?utf-8?B?MG9vcENKUHB4MExXSSsrRUhyZFc5Y01rUVhOMHBhTmNESE4zTVZzUk1WN05s?=
 =?utf-8?B?dURhYjQ4ZXVWTFh1U0VLUWt2L0RiZ1VHQ3k4SGsxbkZheHE4VFRtaTJUQ3Mw?=
 =?utf-8?B?Z0dWckhHenc5dld5OUJySy9MajF1SzQ2N3hiRllaS2FCZjUxVUE0TEhjLzVV?=
 =?utf-8?B?RDBqU2d0b3dkTGVRdFFWV2xDTHA3QWYrYlJIQ3pxdU02RU1iaXJHYkpoVGg0?=
 =?utf-8?B?WW1KN3p3S0ZPdGd2NSsvL2FuVTZpUk9EbWJaUDVHL2VWcHUxZmFqRXlIQjRE?=
 =?utf-8?B?MXcxcUF0bU9nUWNTUkJxMkxadzBGMG84Yk0vMXpuTE5iL3hyWk93Q2ZHUkxx?=
 =?utf-8?B?TW5TRjJoNE52UWlqeFE0SGFUNVA5azZUV3N6Y3NNTXpUdEJYQ0hNWDRsSmJT?=
 =?utf-8?B?N2ZCVitDbFhqTUhIRlg3UzdXM3NvZ0w3Q1RDZVh4ZUg3Q1Z3enVUNVREdGVI?=
 =?utf-8?B?dlNrN0c4b3NWVTJRZGZqWkI3ZnFTTzJiOG1ja1ZGSzdsdlNYUmZ2dkYybHJJ?=
 =?utf-8?B?aWJLTHNtNDdQWTA4MlYyRHF2VFRxZEdsdEZLUUh5OUlZcVZkNmlxSUx4ZmJR?=
 =?utf-8?B?Rlo2UUdCTDJ3dG82clZYUVJjVFEvZFQxK1FPOTJHaWNSbWlSU0NCWURuNlhV?=
 =?utf-8?B?am5DSGxxY2tTb1FsRWZhVEhaN2M3am5raWpxc0R1UWZyRVNMaWNoZGJJSDJp?=
 =?utf-8?B?SVlLeU5jaW03SnlNVUlTM25zRDhjb0luN2E2MWNkbUlwNDVCWDlXby8zZDNr?=
 =?utf-8?B?QVZOUzdXd3FCUzlKVVRRejYvVTdkVEd5SHp3SDlqSjZuRWlMNzRuSWxsUzNF?=
 =?utf-8?B?WHV2TUJCU0o3UXhzUlVJQXA3T216NjFZSEV5ZlNjWkpmL05NVnZuU1F5UkZM?=
 =?utf-8?B?cFhjOW1jaE0zNjFVYlNqYkovS0FvMGZuZ2Z2anRsd1psaFdMZVhyZEJQQy9z?=
 =?utf-8?B?alllNnNld01lUFBzY0lDZHJwdUdFdnB0MmVkYit6U3BlSlJXQWUrbVU2SDJO?=
 =?utf-8?B?VlAyRjVES3VBbzVhMFNLRTR6SWF2MGtWYW1Gbmt6NVo5cjFJaXBLRkpwR2Za?=
 =?utf-8?B?M2tYZXp5OXZXTW9TMkI0YWVmMExnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd0b3d0f-80ca-4971-b97e-08dbcb919ac4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2023 02:10:43.0172
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: txGhZ3SCssjZ6iUTzEKkDt4YdGMBcldRmh3BaIaZ5I3v7k8lyDIIMHqSDsLqxgY7iDJEd6krFiv+n+WsOHGJTA7y/bgvXAKy4QCfqz/SZvWHpdmTzJaqNmPgsKhcYum4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8652
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVGh1cnNk
YXksIE9jdG9iZXIgMTIsIDIwMjMgOTozNSBQTQ0KPiANCj4gSGkgU2hpbW9kYS1zYW4sDQo+IA0K
PiBPbiBUaHUsIE9jdCAxMiwgMjAyMyBhdCAyOjE24oCvUE0gWW9zaGloaXJvIFNoaW1vZGENCj4g
PHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBBZGQgUE0gb3Bz
IGZvciBTdXNwZW5kIHRvIElkbGUuIFdoZW4gdGhlIHN5c3RlbSBzdXNwZW5kZWQsDQo+ID4gdGhl
IEV0aGVybmV0IFNlcmRlcydzIGNsb2NrIHdpbGwgYmUgc3RvcHBlZC4gU28sIHRoaXMgZHJpdmVy
IG5lZWRzDQo+ID4gdG8gcmUtaW5pdGlhbGl6ZSB0aGUgRXRoZXJuZXQgU2VyZGVzIGJ5IHBoeV9p
bml0KCkgaW4NCj4gPiByZW5lc2FzX2V0aF9zd19yZXN1bWUoKS4gT3RoZXJ3aXNlLCB0aW1lb3V0
IGhhcHBlbmVkIGluIHBoeV9wb3dlcl9vbigpLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogWW9z
aGloaXJvIFNoaW1vZGEgPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPg0KPiANCj4g
VGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0KDQo+
ID4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9yc3dpdGNoLmMNCj4gPiArKysg
Yi9kcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3Jzd2l0Y2guYw0KPiA+IEBAIC0xNyw2ICsx
Nyw3IEBADQo+ID4gICNpbmNsdWRlIDxsaW51eC9vZl9uZXQuaD4NCj4gPiAgI2luY2x1ZGUgPGxp
bnV4L3BoeS9waHkuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0K
PiA+ICsjaW5jbHVkZSA8bGludXgvcG0uaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRp
bWUuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L3J0bmV0bGluay5oPg0KPiA+ICAjaW5jbHVkZSA8
bGludXgvc2xhYi5oPg0KPiA+IEBAIC0xMzE1LDYgKzEzMTYsNyBAQCBzdGF0aWMgaW50IHJzd2l0
Y2hfcGh5X2RldmljZV9pbml0KHN0cnVjdCByc3dpdGNoX2RldmljZSAqcmRldikNCj4gPiAgICAg
ICAgIGlmICghcGh5ZGV2KQ0KPiA+ICAgICAgICAgICAgICAgICBnb3RvIG91dDsNCj4gPiAgICAg
ICAgIF9fc2V0X2JpdChyZGV2LT5ldGhhLT5waHlfaW50ZXJmYWNlLCBwaHlkZXYtPmhvc3RfaW50
ZXJmYWNlcyk7DQo+ID4gKyAgICAgICBwaHlkZXYtPm1hY19tYW5hZ2VkX3BtID0gdHJ1ZTsNCj4g
Pg0KPiA+ICAgICAgICAgcGh5ZGV2ID0gb2ZfcGh5X2Nvbm5lY3QocmRldi0+bmRldiwgcGh5LCBy
c3dpdGNoX2FkanVzdF9saW5rLCAwLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcmRldi0+ZXRoYS0+cGh5X2ludGVyZmFjZSk7DQo+ID4gQEAgLTE5OTEsMTEgKzE5OTMsNTIg
QEAgc3RhdGljIHZvaWQgcmVuZXNhc19ldGhfc3dfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpDQo+ID4gICAgICAgICBwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBOVUxMKTsN
Cj4gPiAgfQ0KPiA+DQo+ID4gK3N0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgcmVuZXNhc19ldGhf
c3dfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ID4gK3sNCj4gPiArICAgICAgIHN0cnVj
dCByc3dpdGNoX3ByaXZhdGUgKnByaXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gPiArICAg
ICAgIHN0cnVjdCBuZXRfZGV2aWNlICpuZGV2Ow0KPiA+ICsgICAgICAgaW50IGk7DQo+IA0KPiB1
bnNpZ25lZCBpbnQgKGFsc28gYmVsb3cpDQoNCkkgZG9uJ3Qga25vdyB3aHkgdW5zaWduZWQgaW50
IGlzIG5lZWRlZC4gT3RoZXIgZnVuY3Rpb25zIHVzZSANCnJzd2l0Y2hfZm9yX2VhY2hfZW5hYmxl
ZF9wb3J0e19jb250aW51ZV9yZXZlcnNlfSgpIHdpdGggaW50Lg0KRXNwZWNpYWxseSwgcnN3aXRj
aF9mb3JfZWFjaF9lbmFibGVkX3BvcnRfY29udGludWVfcmV2ZXJzZSgpDQpoYXMgdGhlIGZvbGxv
d2luZyBjb2RlLCB1bnNpZ25lZCBpbnQgd2lsbCBub3Qgd29yayBjb3JyZWN0bHk6DQotLS0NCiNk
ZWZpbmUgcnN3aXRjaF9mb3JfZWFjaF9lbmFibGVkX3BvcnRfY29udGludWVfcmV2ZXJzZShwcml2
LCBpKSBcDQogICAgICAgIGZvciAoaS0tOyBpID49IDA7IGktLSkgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXA0KICAgICAgICAgICAgICAgIGlmIChwcml2LT5yZGV2W2ldLT5kaXNh
YmxlZCkgICAgICAgICAgICAgICAgICAgIFwNCiAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRp
bnVlOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQogICAgICAgICAgICAgICAgZWxz
ZQ0KLS0tDQoNClNvLCBJIHdvdWxkIGxpa2UgdG8ga2VlcCB0aGlzIGZvciBjb25zaXN0ZW5jeSB3
aXRoIG90aGVyIGZ1bmN0aW9ucycNCmltcGxlbWVudGF0aW9uLiBCdXQsIHdoYXQgZG8geW91IHRo
aW5rPw0KDQo+ID4gKw0KPiA+ICsgICAgICAgcnN3aXRjaF9mb3JfZWFjaF9lbmFibGVkX3BvcnQo
cHJpdiwgaSkgew0KPiA+ICsgICAgICAgICAgICAgICBuZGV2ID0gcHJpdi0+cmRldltpXS0+bmRl
djsNCj4gPiArICAgICAgICAgICAgICAgaWYgKG5ldGlmX3J1bm5pbmcobmRldikpIHsNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICBuZXRpZl9kZXZpY2VfZGV0YWNoKG5kZXYpOw0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHJzd2l0Y2hfc3RvcChuZGV2KTsNCj4gPiArICAgICAgICAg
ICAgICAgfQ0KPiA+ICsgICAgICAgICAgICAgICBpZiAocHJpdi0+cmRldltpXS0+c2VyZGVzLT5p
bml0X2NvdW50KQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHBoeV9leGl0KHByaXYtPnJk
ZXZbaV0tPnNlcmRlcyk7DQo+IA0KPiBJZiAhaW5pdF9jb3VudCwgdGhlIFBIWSB3YXMgbm90IGlu
aXRpYWxpemVkIGJlZm9yZSBzdXNwZW5kaW5nPyAuLi4NCg0KWWVzLCBpdCB3YXMgcG9zc2libGUg
aWYgcmVuZXNhc19ldGhfc3dfcmVzdW1lKCkgY2FsbGVkIHBoeV9pbml0KCkNCmFuZCBpdCBmYWls
ZWQuDQoNCj4gPiArICAgICAgIH0NCj4gPiArDQo+ID4gKyAgICAgICByZXR1cm4gMDsNCj4gPiAr
fQ0KPiA+ICsNCj4gPiArc3RhdGljIGludCBfX21heWJlX3VudXNlZCByZW5lc2FzX2V0aF9zd19y
ZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQ0KPiA+ICt7DQo+ID4gKyAgICAgICBzdHJ1Y3QgcnN3
aXRjaF9wcml2YXRlICpwcml2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+ID4gKyAgICAgICBz
dHJ1Y3QgbmV0X2RldmljZSAqbmRldjsNCj4gPiArICAgICAgIGludCBpOw0KPiA+ICsNCj4gPiAr
ICAgICAgIHJzd2l0Y2hfZm9yX2VhY2hfZW5hYmxlZF9wb3J0KHByaXYsIGkpIHsNCj4gPiArICAg
ICAgICAgICAgICAgcGh5X2luaXQocHJpdi0+cmRldltpXS0+c2VyZGVzKTsNCj4gDQo+IC4uLiB3
aGlsZSBpdCBpcyBhbHdheXMgaW5pdGlhbGl6ZWQgYWZ0ZXIgcmVzdW1pbmc/IElzIHRoYXQgaW50
ZW50aW9uYWwsDQo+IG9yIHNob3VsZCB0aGUgcHJlLXN1c3BlbmQgc3RhdGUgYmUgcHJlc2VydmVk
Pw0KDQpZZXMsIHRoYXQgaXMgaW50ZW50aW9uYWwuIEFmdGVyIHRoaXMgZHJpdmVyIHdhcyBwcm9i
ZWQsIHRoZSBwaHkgd2FzIGFsd2F5cw0KaW5pdGlhbGl6ZWQuDQoNCj4gPiArICAgICAgICAgICAg
ICAgbmRldiA9IHByaXYtPnJkZXZbaV0tPm5kZXY7DQo+ID4gKyAgICAgICAgICAgICAgIGlmIChu
ZXRpZl9ydW5uaW5nKG5kZXYpKSB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcnN3aXRj
aF9vcGVuKG5kZXYpOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIG5ldGlmX2RldmljZV9h
dHRhY2gobmRldik7DQo+ID4gKyAgICAgICAgICAgICAgIH0NCj4gPiArICAgICAgIH0NCj4gPiAr
DQo+ID4gKyAgICAgICByZXR1cm4gMDsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIFNJTVBM
RV9ERVZfUE1fT1BTKHJlbmVzYXNfZXRoX3N3X3BtX29wcywgcmVuZXNhc19ldGhfc3dfc3VzcGVu
ZCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgcmVuZXNhc19ldGhfc3dfcmVzdW1lKTsN
Cj4gDQo+IFBsZWFzZSB1c2UgREVGSU5FX1NJTVBMRV9ERVZfUE1fT1BTKCkgaW5zdGVhZCwgc28g
eW91IGNhbiBkcm9wIHRoZQ0KPiBfX21heWJlX3VudXNlZCB0YWdzIGZyb20gdGhlIGNhbGxiYWNr
cy4NCg0KSSBnb3QgaXQuIEknbGwgZml4IHRoZW0uDQoNCj4gPiArDQo+ID4gIHN0YXRpYyBzdHJ1
Y3QgcGxhdGZvcm1fZHJpdmVyIHJlbmVzYXNfZXRoX3N3X2RyaXZlcl9wbGF0Zm9ybSA9IHsNCj4g
PiAgICAgICAgIC5wcm9iZSA9IHJlbmVzYXNfZXRoX3N3X3Byb2JlLA0KPiA+ICAgICAgICAgLnJl
bW92ZV9uZXcgPSByZW5lc2FzX2V0aF9zd19yZW1vdmUsDQo+ID4gICAgICAgICAuZHJpdmVyID0g
ew0KPiA+ICAgICAgICAgICAgICAgICAubmFtZSA9ICJyZW5lc2FzX2V0aF9zdyIsDQo+ID4gKyAg
ICAgICAgICAgICAgIC5wbSA9ICZyZW5lc2FzX2V0aF9zd19wbV9vcHMsDQo+IA0KPiBwbV9zbGVl
cF9wdHIoLi4uKQ0KDQpJJ2xsIHVzZSBpdCBvbiB2Mi4NCg0KQmVzdCByZWdhcmRzLA0KWW9zaGlo
aXJvIFNoaW1vZGENCg0KPiA+ICAgICAgICAgICAgICAgICAub2ZfbWF0Y2hfdGFibGUgPSByZW5l
c2FzX2V0aF9zd19vZl90YWJsZSwNCj4gPiAgICAgICAgIH0NCj4gPiAgfTsNCj4gDQo+IEdye29l
dGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+
IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25k
IGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNh
dGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQN
Cj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVy
IiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
