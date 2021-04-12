Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB4B935BA19
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Apr 2021 08:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbhDLGYH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Apr 2021 02:24:07 -0400
Received: from mail-eopbgr1400107.outbound.protection.outlook.com ([40.107.140.107]:23760
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231264AbhDLGYG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Apr 2021 02:24:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fkgrdvXAs4/cbDcro88XABQ5QFOkKuUmPxir1+7TWCpzFi9tl34Yfyt+HNCwdIjsFCGx4dEi+ZAEj2FiNl+YQBIg0/Sfco+PUN3b+R16SCCX02zONrzdc7MT2/utbhcI98j/U+D6E2aO1Or9GcCLdx3a9btKrJbNuuLO4JbVjnvZrxEvmwSyONb73idiq5Y6mCf3VF2yi883aMXoWCCh2t7wqVKfqSe/IyoDAYLT/lLu3mqMfMUGwzCf+oRhfGETr2meRmz/msDpFOysotn2Cu/NEG6gvlLWLKEAJzhhzvn0PzQWNvh1dGaqvPULOpGnDxGK8Ds7NxDpLTgQnA4dSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pu6gNgcQYzuJgxzL7ihrKV/W3CcyuGugaz9oeZmSuyY=;
 b=mRmEeZAQxMJas164arw4u9eCKVnBErIuv3SdVqVlnJnrskK+oh38IfYHjQmUseARwxNBy0xm8u11r/VRGntJTgNYnw/PNMtwC92ZKuYxzyYVApN2Iz01KcwoAaZZsXS847xQnYV4dCDs/ET1HerPPSTHfJPSs00vlkxZhMigB/BjzOxbLdSxK/iWWMjV1MPHAFwrKwgxv8QZ0oHmk0AvJ2SgOKegmkUuVKHdcuOQtKJ/YCqxadfWCoIIY1O30iw3s0/zm2qNc71NZjxiQduQ37co6uehrOX8uyHvnvD2BqumMNddO4FiMJz0mvBDNBZ6E3LXOg3MWkHcldYPYZ+8kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pu6gNgcQYzuJgxzL7ihrKV/W3CcyuGugaz9oeZmSuyY=;
 b=Tx1WTGkpydwQKMdqsnBk3hIu/yPwv25h9UQhWeuAQlR+7C1Pxxr21RVIbiuXW0rl/jZVx4pvMxuUT0h+EPrk27LdVltXsuOk94pDBYWO+U4SxeLgeH9653wkdUHBxbAogvcmb+SheZMlD6nmAVU2pz4IvdyHBuNFOVXl+75w0RI=
Received: from OSAPR01MB3683.jpnprd01.prod.outlook.com (2603:1096:604:33::12)
 by OSAPR01MB3265.jpnprd01.prod.outlook.com (2603:1096:604:7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Mon, 12 Apr
 2021 06:23:46 +0000
Received: from OSAPR01MB3683.jpnprd01.prod.outlook.com
 ([fe80::7de7:7e65:a509:e3a0]) by OSAPR01MB3683.jpnprd01.prod.outlook.com
 ([fe80::7de7:7e65:a509:e3a0%4]) with mapi id 15.20.4020.022; Mon, 12 Apr 2021
 06:23:46 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Ulrich Hecht <uli@fpond.eu>, Ulrich Hecht <uli+renesas@fpond.eu>
CC:     "wsa@kernel.org" <wsa@kernel.org>,
        "geert@linux-m68k.org" <geert@linux-m68k.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>
Subject: RE: [PATCH] serial: sh-sci: correct units in comment about DMA
 timeout
Thread-Topic: [PATCH] serial: sh-sci: correct units in comment about DMA
 timeout
Thread-Index: AQHXLRntrh8Gv0OgbkS+n0L/AKIa2KqsF3DQgABCcICABA7DgA==
Date:   Mon, 12 Apr 2021 06:23:46 +0000
Message-ID: <OSAPR01MB3683AE83C298C792F4DA3344D8709@OSAPR01MB3683.jpnprd01.prod.outlook.com>
References: <20210409082524.3480-1-uli+renesas@fpond.eu>
 <OSAPR01MB3683F5855937833872F4FE23D8739@OSAPR01MB3683.jpnprd01.prod.outlook.com>
 <785709679.143677.1617984277200@webmail.strato.com>
In-Reply-To: <785709679.143677.1617984277200@webmail.strato.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fpond.eu; dkim=none (message not signed)
 header.d=none;fpond.eu; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ab43c36-3345-4766-faf3-08d8fd7b872d
x-ms-traffictypediagnostic: OSAPR01MB3265:
x-microsoft-antispam-prvs: <OSAPR01MB326500220232990C48110923D8709@OSAPR01MB3265.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k+HC4XmMg02ZVF1GGjzdsf0+MAkCTsexS+vqMQYerjCBPIMg0wF3bzWvfL/+dspxhSEN/m5A5TcAZp1tyThCBU9d1yqLE4EViM/Bwwvx3V2eVTnYOaMWdnYOIVwSu5YQ5RRUGnHuptSnY2NOUdqsyoXnngvfnosUs5RuAGm9uwNYr5bSMwc6S6rpWNhXz3bSo/OCU/bXRsC43Jfm0h+ZWIsiZI4GlGF14ElM8S7uBkc+EwIK8zsFKhdNY9Wmdif64THXV3pNCqdCRMh3tJbU2P3MTkaqjR2n6kt4Bx2G/8grzHsdcuSYey6l8DBeCS5jAGh8OcpjQa+LC0jovm4cIAyrXoj4/oodEvnhh3oRvHFZUFlPBwaQ3mAGSJzozR9/O0Yu/VUfHFuxMY51uEif3dORcoHcWe5gw1J5720KVMAiOxgLbRBPJkp+wpVdrCieCiPys2TxqDtJ6x8RVNIgzsN2zC5k2gNyGp5Kgz19zjAVvDZdr97ZlJZ3UR0GwoOd+fpkceQFcuO4uTw6N7FHWCAradbbWT7j0/syv9eHuBJTyC43INmIZ3h4MAXjJ5T2ad7e/fHUXOehiZC8Lw/g7Evv/Z+ZY5KLkmOiRx6MjQE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB3683.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(366004)(39860400002)(376002)(316002)(8936002)(33656002)(110136005)(8676002)(38100700002)(52536014)(9686003)(54906003)(5660300002)(55016002)(4326008)(478600001)(66946007)(86362001)(186003)(83380400001)(71200400001)(6506007)(66556008)(64756008)(66446008)(66476007)(53546011)(76116006)(2906002)(55236004)(26005)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?VmFWaUhGeWVzREtrTGNQRUV2LytnL0lYdlJVbjhTYThjUEZVSU8yWlR0S2pD?=
 =?utf-8?B?THN6dzJmbUU2T1c5OEFPcWQxb1UydVh1Z1JWM0x5QS81Tk1rM2R4dzMxUWFt?=
 =?utf-8?B?TFRkUmpLTUNDLzNYU0l4Tkc1T0JrNmZaczhLcVBmd01HZjNsQ1RSaFlSVDhG?=
 =?utf-8?B?cEE3QytLendDOURtVytWWE5SbHFMdWpTb21hNFNUL3ByZlBMWlE4MVNialpO?=
 =?utf-8?B?MFRycW9udmpnc3hOTXpNVnpOQVRzWnpMQVdrMnl4Q2dFZ1BYTngxaFJjQkpG?=
 =?utf-8?B?N2xYaGZKQ1hOM1NscHFqREhDdHJVRUNJM0ZnWlBiQXM4OStxTUFMT3ptcXN0?=
 =?utf-8?B?N01PZGRSSFpYODhqVUpuTzNEak1YWlBJQ3I2SEtOb1B6NHl5V1NRY3Z3eThz?=
 =?utf-8?B?RFkrNXkzWG9vanRDYVAvY2xVUiszb1V1K3dwOHlGMUZEUWpzOEg4cnNQRDU0?=
 =?utf-8?B?WDJKaDEvRU1mRkhxUU9xLzFoa3lOczFwTkhpbVZkUFlxdEIvNkFGZlBrSEZO?=
 =?utf-8?B?WGpiZU0rR2NlMzRWVVZlOFhma0h3NG9sK1YzYzZ3M005MXE4eWEwTHkzdE9K?=
 =?utf-8?B?aGFGNmxObEdrVUt3WjNkUTNXaGMwZUNFemVQdEpsQkRncFIzSTkyb0ozM3Na?=
 =?utf-8?B?WU1DY2JFVnM5c3RGZ29Cc2VZTVZINmF1dVhNMFVHMVRHcGQzT1ZDdG1WQU5h?=
 =?utf-8?B?R2hHSWx5cWQ4NkRVK2djRDk5anZWdGJxQTlNY2c1YVNDbUovRWU3MGN6Yncr?=
 =?utf-8?B?c0tpTThIaFg2QW1OVVp1MlUxZnZ5UzVPY0dmQldtYUNVd2pDc0RPY1VnV3hQ?=
 =?utf-8?B?OXkycHdVVHZLLzkyZmc1OHUzZlJTQWh0RElTSWZaOVNDaEpEV1llaHpnK3Yr?=
 =?utf-8?B?ekIrZzRhNWJFR2RHa3VSWTFHUFphUFE0UXJlZDlMbHU2ZzM5VVhvdHo4cmQ1?=
 =?utf-8?B?ZHREdU1aekFUeHRDOVp1NkVxNkdjaTh3aWRMcVE4aDZSdmpMUGxWWTErWGs2?=
 =?utf-8?B?TE1QaTRmWHlLTDZRT0xaTlFoWE5SSkJaa0NGc21SUHlmOEUrNjFaeFhFdFJJ?=
 =?utf-8?B?NU0vaFlDeWZEZERYQmg4Qmx4b3VyRGRPamVaS0IvK0JrWFNZTGdDWEhEdlFT?=
 =?utf-8?B?cGU4b1Z2Sk42ODljSWRjVEN6aVVPczVVZnE5aVNYNTJMd0dSeDhDS2NKZkZY?=
 =?utf-8?B?RGpuV0t2U0IycU96eHI3K0VWWXllVHVtb01EL25scjBKMEhjbjlvMHRVZWpD?=
 =?utf-8?B?aGlFVmxLcVdENE1mK2gvNklMRVJRMEU3NWJRT0hUbTZOeG1EbG5TLytLa0sr?=
 =?utf-8?B?TytCamtwV2tOV1BKSTJRZ2tycnA2ZDEveW5VcHRsaWxFSHg1UkZEZTkyT3Nr?=
 =?utf-8?B?Wng3NkQ5aTVoTWhPczBLQzhlTlBoTmQ0QlYvWUtVOHZ2M1hHakE4M0pZVDVl?=
 =?utf-8?B?UGllUEE0b1oxd3NZZ2dITStyU3RLYlFvL0h3UUREM0cySVlBYVpZdDdnWmN1?=
 =?utf-8?B?eGFERkdpNnMvOExOK3NwL1pabys2UlBsbXRucFVzdXF4NE5qVjdwMk5lWDFN?=
 =?utf-8?B?YnhXa045cU15Zk04SDRLSEFQNTMvRDBjekx2bEJxOU1xQVR1MWR4akdnUHpo?=
 =?utf-8?B?SytoNHlqSytHOXpNT0NtVUlqM1g0akozZXNhY1pqZlVtR25DQ3VOSmh6YjRz?=
 =?utf-8?B?cG96MDV0TnBOUi84TnFJUmNIcXEvQnhLdWsrakhCNFljNVI0cjFMeGc5dmJD?=
 =?utf-8?Q?Hrh/OXRftKj10B3y2VXxuGBEG4aVVaIJnlhBvBk?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB3683.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ab43c36-3345-4766-faf3-08d8fd7b872d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2021 06:23:46.2088
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5EK0pDANXYrBQyj6VQ7g2QZr78zROAommTzfUNLnUhsxvmgrc7mhYfNOxtnZxBaKwLydLO4ePQfPczs+ahO+wcYt7BMrc3JQ/kA9v+Ax+I0590gD/In5zowcG3v5KfSf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3265
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgVWxyaWNoLXNhbiwNCg0KPiBGcm9tOiBVbHJpY2ggSGVjaHQsIFNlbnQ6IFNhdHVyZGF5LCBB
cHJpbCAxMCwgMjAyMSAxOjA1IEFNDQo+IA0KPiA+IE9uIDA0LzA5LzIwMjEgMjoxNiBQTSBZb3No
aWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+IHdyb3RlOg0K
PHNuaXA+DQo+ID4gU28sIGFsbW9zdCBhbGwgY29tbWVudHMgd2FzIG5vdCBuZWVkZWQuDQo+ID4N
Cj4gPiBBbHNvLCBJJ20gd29uZGVyaW5nIGlmIHRoZSBmb2xsb3dpbmcgY29uZGl0aW9uIGlzIG5v
dCBuZWVkZWQgb3Igbm90Lg0KPiA+IFRoaXMgaXMgYmVjYXVzZSB0aGlzIHdhcyAiMjBtcyIuIEJ1
dCwgcGVyaGFwcywgdGhlIGRyaXZlciB3aWxsIG5vdA0KPiA+IHNldCByeF90aW1lb3V0IHRvICIy
MHVzIiBvciBzbWFsbC4NCj4gPg0KPiA+ICAgICAgICAgaWYgKHMtPnJ4X3RpbWVvdXQgPCAyMCkN
Cj4gPiAgICAgICAgICAgICAgICAgcy0+cnhfdGltZW91dCA9IDIwOw0KPiANCj4gQSBtb3JlIGhl
bHBmdWwgdmVyc2lvbiBvZiB0aGUgY29tbWVudCBpcyBpbiAzMDg5ZjM4MWZiYWY1Og0KPiANCj4g
LyoNCj4gICogQ2FsY3VsYXRlIGRlbGF5IGZvciAxLjUgRE1BIGJ1ZmZlcnM6IHNlZQ0KPiAgKiBk
cml2ZXJzL3NlcmlhbC9zZXJpYWxfY29yZS5jOjp1YXJ0X3VwZGF0ZV90aW1lb3V0KCkuIFdpdGgg
MTAgYml0cw0KPiAgKiAoQ1M4KSwgMjUwSHosIDExNTIwMCBiYXVkIGFuZCA2NCBieXRlcyBGSUZP
LCB0aGUgYWJvdmUgZnVuY3Rpb24NCj4gICogY2FsY3VsYXRlcyAxIGppZmZpZSBmb3IgdGhlIGRh
dGEgcGx1cyA1IGppZmZpZXMgZm9yIHRoZSAic2xvcChlKS4iDQo+ICAqIFRoZW4gYmVsb3cgd2Ug
Y2FsY3VsYXRlIDMgamlmZmllcyAoMTJtcykgZm9yIDEuNSBETUEgYnVmZmVycyAoMyBGSUZPDQo+
ICAqIHNpemVzKSwgYnV0IGl0IGhhcyBiZWVuIGZvdW5kIG91dCBleHBlcmltZW50YWxseSwgdGhh
dCB0aGlzIGlzIG5vdA0KPiAgKiBlbm91Z2g6IHRoZSBkcml2ZXIgdG9vIG9mdGVuIG5lZWRsZXNz
bHkgcnVucyBvbiBhIERNQSB0aW1lb3V0LiAyMG1zDQo+ICAqIGFzIGEgbWluaW11bSBzZWVtIHRv
IHdvcmsgcGVyZmVjdGx5Lg0KPiAgKi8NCj4gDQo+IEkgdGhpbmsgd2Ugc3RpbGwgd2FudCB0aGF0
LCBidXQgaXQgc2hvdWxkIG9mIGNvdXJzZSBiZSAyMDAwMCwgbm90IDIwLg0KDQpIbW0sIHdoZW4g
d2UgdXNlIEhTQ0lGIHdpdGggMTAgYml0cywgMzAwMDAwMCBiYXVkIGFuZCAxMjggYnl0ZXMgRklG
TywNCnRoZSByeF90aW1lb3V0IHZhbHVlIHdpbGwgYmUgc2V0IHRvIDE1MzYgKHVzKS4gU28sIGlm
IHdlIHNldCByeF90aW1lb3V0DQp0byAyMDAwMCAodXMpIGFzIGEgbWluaW11bSB2YWx1ZSwgdGhl
IHNoLXNjaScgYmVoYXZpb3Igd2lsbCBiZSBiYWNrIHRvDQpub24gaHJ0aW1lciBzdXBwb3J0LCBJ
SVVDLg0KDQpQZXJoYXBzLCBkZXNjcmliaW5nIHVhcnRfdXBkYXRlX3RpbWVvdXQoKSBhbmQgdGhl
IGppZmZpZXMgdmFsdWUgb2YNCnVhcnRfcG9ydC0+dGltZW91dCB3aXRoIDExNTIwMCBiYXVkIGhl
cmUgbWF5IGNhdXNlIG1pc3JlYWRpbmc/Pw0KSSBkaWRuJ3QgdW5kZXJzdGFuZCB0aGUgcHVycG9z
ZSBvZiB1YXJ0X3BvcnQtPnRpbWVvdXQgeWV0IHRob3VnaHQuDQpCdXQsIGF0IGxlYXN0LCB0aGUg
Y3VycmVudCBkcml2ZXIgdXNlcyBocnRpbWVyIHRvIGltcHJvdmUgbGF0ZW5jeQ0KZm9yIEhTQ0lG
LCB0aGUgZHJpdmVyIHNob3VsZCBub3Qgc2V0IDIwMDAwICh1cykgYXMgYSBtaW5pbXVtIHZhbHVl
Lg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo=
