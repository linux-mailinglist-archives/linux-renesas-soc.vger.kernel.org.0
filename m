Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0745E46D02E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Dec 2021 10:36:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230525AbhLHJjk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Dec 2021 04:39:40 -0500
Received: from mail-os0jpn01on2094.outbound.protection.outlook.com ([40.107.113.94]:6882
        "EHLO JPN01-OS0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230486AbhLHJjj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Dec 2021 04:39:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sshsu8jZJBLuCUfJRkHR6vGaRkrjtZIJ9LKh+7qgz5kiPTTqChg6Bk1qbkcj5Zlxt6PwdZr9sgYwXi7s6MbZmdnmh7KKKw+1owNKP7VontdHG5nm8b1jA9YeyLB2X5FtFFh40UXaQflEbZvBQhQm2ynXYbfEjPENs4eKpGbAwHMUDb6MzI7vBo0Pp5dM0IUR8iXlsv/yxkebcjKoHD2a8qh7EZM4FWMIuKDowvZQ3L844Lld5Tb2i0Oev5M54J/2JCoNkbLEyIMNtNxTAfWJJaaadTJ5vcdBl3rqHDKAtau/r7TY9u0Y2lkpVNObVYpuWkNrA/Xyrq+SgE476+rfbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wtW/oS36Nim031aUiu2Jnxacs6kAU5PLZNhxzbtsuWk=;
 b=W6U5KtB0jeB8acvDcM0IAlwovOkAjHcM/2F4amGF48xQRdX1Eqn6PlnUciFp+QlCMgwWDTGzDXlV++7EevaLTuYr8vwiPrl4T6Q4my67YjtA4HtUrg0Ei81I9wLuzKDLq66hoJv8zXwlmT7jumetJ4IAaFjXMA0nKy0POYBKAxvj78pPclDUWwVLajvs6l/qCn63Xtwcd32p4xMGyrsngbGFHw12QRysJBH+QrGtrRoaVZig768eSLtpCRsBYKNeA/GCD3ALgJ+KRuIZMVROzq3wcxJiOyrv+8WSqFwobeallgm15buqGd7TMoaxQ2lHq4R/Q6QORJ64gyJhkG5iAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wtW/oS36Nim031aUiu2Jnxacs6kAU5PLZNhxzbtsuWk=;
 b=Tuw8R5qK8Op/Pl/9mKybeVNOMzZNbhmApXxrarNETkMhfm0jwq+oN8VVmt32Q/pEgpHEjtRf8+NrCn8/Kxzh5uHrlFU2BZdom+a8K4t0NxJ2t+YdS4SydYnBzAkgtLZ371D6HqYWcw2DUA72cdyZLYJQh789IklK7zAztEBKKjE=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB2672.jpnprd01.prod.outlook.com (2603:1096:404:8f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Wed, 8 Dec
 2021 09:36:04 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408%3]) with mapi id 15.20.4755.023; Wed, 8 Dec 2021
 09:36:04 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Takehito Nakamura <takehito.nakamura.nx@renesas.com>
Subject: RE: [PATCH 15/16] arm64: dts: renesas: Add Renesas Spider boards
 support
Thread-Topic: [PATCH 15/16] arm64: dts: renesas: Add Renesas Spider boards
 support
Thread-Index: AQHX2r2INnp2XIwXG0KJ2GxVDwsUeawSw4SAgBWw8ICAAAOj4A==
Date:   Wed, 8 Dec 2021 09:36:04 +0000
Message-ID: <TY2PR01MB3692D5C8F73A0AB673830D00D86F9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com>
 <20211116074130.107554-16-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdVZrGdwKnN=VKTiGp_Vj6CXgE=G_1OfDf29wHGd22q=Tg@mail.gmail.com>
 <CAMuHMdUyRt4cXzJ-dC9Z5unCZq2CfDsDrUQNckWXP2gxcsDAcw@mail.gmail.com>
In-Reply-To: <CAMuHMdUyRt4cXzJ-dC9Z5unCZq2CfDsDrUQNckWXP2gxcsDAcw@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f34e253d-3b67-47ee-1448-08d9ba2e278b
x-ms-traffictypediagnostic: TYAPR01MB2672:EE_
x-microsoft-antispam-prvs: <TYAPR01MB267212CE66E1D4C692A8E3B8D86F9@TYAPR01MB2672.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kwYV+Jy82UB2Dyo4Jpz/okdcJQepBUy0F4u/m16o2AtTWNk+l3bRboynB8lRzRZhUyPAtONfxFx2sfFMChcLuw44J/brdmklfr6PQXuFD9HaOhvg2ZE41KuS/cWJ/HC5hAUm4lUTcN3e/5zFHB+5o4xGwb4bbTI25x/0piqy+tTdmnZ3rVCtqlK9I+BvvAeJ/WtMqOXzhBRTY670fMiabeZgMXRbaNJN0ldg6gsLQw0mLgBEoruOVdWfyZw/k3O0Wp0kGY+CvKYDAmZC6CmNK9wTqek9wPgGuqEsn4zxhE5FMw9dLo0oRM6KCXVBhDGpud3NwhSyWbqdlikHdgVuNlFAvQY062uUBrLdjxPBxJMVENA/i25yO9+fL0xMmJD9tWjxwCG9zimONuhrSWFzidEbLnHtNWCrwoW2+JsL5U9lrgN4c51yfDrsYv9lGeMeShW9GXunMcC+MI59SqXSzIDcP7EoYPXDfVxy4zxmJPqRE7AttlphzNzGZhh5GqsP1cNFRmz0vtXgU/LOdjJ/mJo+b7jaHGLSaJcL0ME4Ug8BKu77cuNLw5AIJ9GkYy7Ctags4nLYMNvsmaQ3H3fwBmph0MzQoAn4oC33LeLdh8GwmHveRUkR8rIdvNgv4B3OsbfDy39loiuhGyL5RMXw+MgPG/9Pk69IBqwojzRhaAM8W+2qu9JYtzlaOlnkxLYrzl/YE/7Jrslrrt1Nrt3VtA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(52536014)(6506007)(53546011)(71200400001)(6916009)(8676002)(7696005)(86362001)(316002)(54906003)(38070700005)(8936002)(26005)(55016003)(107886003)(186003)(4744005)(38100700002)(76116006)(122000001)(33656002)(4326008)(66946007)(66446008)(64756008)(66476007)(66556008)(5660300002)(83380400001)(9686003)(508600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TWhlbFJjM0cwT01wbmxWdjBTN2MwUVBKdCttMy9FV1d0RTJuVjRWeFlKc3Nm?=
 =?utf-8?B?QlM4c24zNVEwaVNSRjZzSzhIRWhkc3BMcEFZeS9WZGMyRURoRGdtMHJRSmxN?=
 =?utf-8?B?TGtPYTRsSmpsTjY3M0Q3RHBnelpHb29wdGhiV0tsSllwOThjUjFSOEJ3cFB3?=
 =?utf-8?B?ZUFzM0pQOE1xOTFqZWYzTklUZXFWSzlJaU5ENFVZcTBqZzM3OHIvdEpQdjVn?=
 =?utf-8?B?OU5oZ1d2ZnFUS3V6MWNlVExLdWcvbW9hMHJNekxQV0pGRnh2d1pROGd3Z3hk?=
 =?utf-8?B?Uk9DWVliQVBXd1gzYU5YM04vTEtadGlIODE2NnErN3ZGS2FwdWV5bFFVbVVW?=
 =?utf-8?B?dThqc2d0THdFakhxTG9DR3pjUVJldHplNWx3VnRnaHJUMmdZd0Z0OTQ2ZXU0?=
 =?utf-8?B?WGVlQnlRaGdJVjJraVZTVndaaWk3NjZ1TlRRTEl1Z0QzTGxwZllpUW5SZEho?=
 =?utf-8?B?WUk0b29idVFUNFFucXVHcWEyU2U3NDEwU2NFMVVVcHRMUFJFLy82K1RCbzE5?=
 =?utf-8?B?cmM5RlloMlk1bnI0TnlmZUZQYnVIdC8xaW85c29DbkNOVXZ2SHR0RVN2Zktk?=
 =?utf-8?B?UkpURDhMSytuSkNoNnRBakxHN04yVy93c0llMlc2YXAxT0M3Qkx6T1o3Zk1i?=
 =?utf-8?B?bEtEVHM1aGhMZnFHUVZ5OUJZSHgybldwazhGcjV1Ymt2R0Y2VjZGYmcvT2s0?=
 =?utf-8?B?VWRMWCtLa2RIcHVRY0hURGNQM1F1SWtSRkQ2MlU4UDJJcjlzaSt5NGlWMkpK?=
 =?utf-8?B?SUpDTXB2SWwvYnE4R0tpOE1jMHZpLytLWFNINHgvK1BKdEhQdWxjN2svR3Fh?=
 =?utf-8?B?Tk91SUZSaXNSNFp1UUlDOWptc3lVL2hjMTVYZ01qZlJEOUlvOW9NeU01VnRn?=
 =?utf-8?B?VmVsTWp3SmFLd2pWeW42SER2WVdGTWUxZFR4eFM3eFVtYWh1N09LOU9wKzln?=
 =?utf-8?B?a3AvRW1uTFFzSEFBczI3Y2VIdytqZG5rU1RLQ3JtTTlEZXdJaExFYVZweEsv?=
 =?utf-8?B?Y0dxbERXRDNHNjlXQUNIMEZoN2syUG02YU1OaXpIcE53ZzhkWktxVy93cDJx?=
 =?utf-8?B?OXhJUjJQZ1ZObjhPNjdnUlpENlFNaXdmYmoxeTBMZFJlS3dYcU9XNUZOcS9Z?=
 =?utf-8?B?eHVUZWh0aC9UYWZJMGhzQzBTaGt1YjlXKzZBK2lqVml0ajNHUC9ReTlMYzhZ?=
 =?utf-8?B?Ukd3WHYxLzNkV2dRVkpIdmU1VTBFeVg4Q25HNnBOTXZzamM3eUhyN0NDT1ZD?=
 =?utf-8?B?eVBoanhUVmlUWjhoTm41QXR3S2huSDViT1V1RVhXTVUvSW85S3M5RkpmTzhS?=
 =?utf-8?B?Y242OERKT0tGNGNYR0owWjVlMEJuamxYTENtMy9URDd6MVZxOXlWWkQxdXlL?=
 =?utf-8?B?SEpRbkJXVFNQYmtncnVBSzJPUGxhSFM3QzRaaEQ4a0hCWVVWQjlzVndsZndP?=
 =?utf-8?B?YnN3czhDcGE0Qmt2YTg2ZTdsVzJkQTA1eFpnYXo3aDlyU2twZ2xveFBoZ0ho?=
 =?utf-8?B?WlJtK1JQNTc1VmJKRlZIRy9jRXNzWUVLMGV1ZjhVQkIyemNKcVdORmRJKzBz?=
 =?utf-8?B?TTM4cWFGQThMQURBWG0wdllJM0dKSmFYV0RRVGFhOGNERUs2WHV1TEFJaHZO?=
 =?utf-8?B?TklXWTYyWW9INHVQdG9iMXAyd3g4NVl2Zk40eThMZDFqYk9iMjVLOTh5UzFz?=
 =?utf-8?B?YTBoY0NlWHMwbERVa0JpS1lKekUwTGo3MHhhQ1QvUXFBV1FZOWhjWXZ4WHg5?=
 =?utf-8?B?R0VNaWs4KytTUHdZUjk1TW1aSy85bVVxeFRSSW91QW9nNytuaGZKVmZJekc4?=
 =?utf-8?B?R2Y5SXRkZnNNdU03Q01FNEx3ZVRuMjNoY0s2NWhhejRiRUlFSDdaelhEUE5E?=
 =?utf-8?B?TzJxbWtpdEIyYlUzalVUTFNUQTZORjNrbDlrbnBIK0kwSjZVRy9mVVFCT1p3?=
 =?utf-8?B?Nm42c1ppd3BydXJzZU1TSGtPV2xETk4rTkc4TUVUejhmQVUrVHVLdDhxcDdX?=
 =?utf-8?B?aUFlTjlURFN5dHo1RWxFRDlPTUxINmc4cFpiRVUvT2JWbkMxVExmRUV6Zm1w?=
 =?utf-8?B?MUNld2VsSW5WRzBTd01EWFY5NlY5SzNEeFlKN0cwMDNzS1pLRzlsUFlpMGJr?=
 =?utf-8?B?Z3YrenB6ZW1YaFpxbW54RjJOT2hYdlNZanQvNk5DTU5sWW4wdlZYZncrekQz?=
 =?utf-8?B?d2F6WWo0UWtnYkNYWnp1azJHMDArUzNYbzVpTE1yMFpOTGxyMkRGOGJVTSs5?=
 =?utf-8?B?cEVUM3BsMDcyNCtqa2hKbzNiYnVoSklObVpZWEFSN3k4TkJDRzhyc0dESE5E?=
 =?utf-8?B?RzZydDFMbU5UZG5LRk5mNlFFb25xeVdQRG1qZ2ZDNFFKeCtxb1cxdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f34e253d-3b67-47ee-1448-08d9ba2e278b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2021 09:36:04.3144
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6xp2/qEYwa333L8lL9hwkJAx7UXRGJrFwVRyLDZcDUQ13ERwEQJYZtNtVEm808+3szoo1vx22zd0b7F8irWb/pAsAjrhplJqHYI2qArXVAGCBP8FclRS798U/rxUmB5I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2672
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogV2VkbmVz
ZGF5LCBEZWNlbWJlciA4LCAyMDIxIDY6MjEgUE0NCj4gDQo+IEhpIFNoaW1vZGEtc2FuLA0KPiAN
Cj4gT24gV2VkLCBOb3YgMjQsIDIwMjEgYXQgMzowNiBQTSBHZWVydCBVeXR0ZXJob2V2ZW4gPGdl
ZXJ0QGxpbnV4LW02OGsub3JnPiB3cm90ZToNCj4gPiBPbiBUdWUsIE5vdiAxNiwgMjAyMSBhdCA4
OjQyIEFNIFlvc2hpaGlybyBTaGltb2RhDQo+ID4gPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVz
YXMuY29tPiB3cm90ZToNCj4gPiA+IEluaXRpYWwgc3VwcG9ydCBmb3IgdGhlIFJlbmVzYXMgU3Bp
ZGVyIENQVSBhbmQgQnJlYWtPdXQgYm9hcmRzDQo+ID4gPiBzdXBwb3J0Lg0KPiA+ID4NCj4gPiA+
IFNpZ25lZC1vZmYtYnk6IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8uc2hpbW9kYS51aEBy
ZW5lc2FzLmNvbT4NCj4gPiA+IFRlc3RlZC1ieTogVGFrZWhpdG8gTmFrYW11cmEgPHRha2VoaXRv
Lm5ha2FtdXJhLm54QHJlbmVzYXMuY29tPg0KPiA+DQo+ID4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5
dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+ID4gKGFzc3VtaW5nIG1lbW9y
eSBzaXplLCBleHRhbCBjbG9jayBmcmVxdWVuY3ksIGFuZCBzZXJpYWwgY29uc29sZSBwb3J0DQo+
ID4gIGFyZSBjb3JyZWN0KQ0KPiANCj4gKHdpdGggdGhlIHNjaGVtYXRpY3MpDQo+IFNvIHRoZSBj
b25zb2xlIGlzIGFjdHVhbGx5IFNDSUYzIHBpbm11eGVkIHRvIHRoZSBIU0NJRjAgcGlucyBvbiB0
aGUNCj4gRGVidWcgU2VyaWFsIFVTQiBjb25uZWN0b3Igb24gdGhlIENQVSBib2FyZD8NCg0KWWVz
LCB0aGUgY29uc29sZSBpcyBTQ0lGMy4NCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1v
ZGENCg0K
