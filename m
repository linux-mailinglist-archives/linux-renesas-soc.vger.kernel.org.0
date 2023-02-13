Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0D6F694BF4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Feb 2023 17:02:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231216AbjBMQCe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Feb 2023 11:02:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229798AbjBMQCd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2023 11:02:33 -0500
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2102.outbound.protection.outlook.com [40.107.255.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2F1A170B;
        Mon, 13 Feb 2023 08:02:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P5377rOTMx8MHb6ddM/byVESu075yhZRp9nDjK3d67PMBHpUKQK3q8Zu6CyVawE5b5KG6+C5XDWO+Ji/fgZETig1kyUO085FF6KXGKWvoayAadUAF+K8ov9z7w/Ewb4kqsWji+oCR58b0fMNZ0azSkVDmcfZcPYDGyG0NMalcJ0eblBE+1M/QRYuLxeyFpzCgiL+H8qYGZMvoE3I9OYFfGP5PUgAV7lgx7j7JLkrrCYJtKXgUoruwPq4bJL1TSEzOrSAsQV2vJm+GL6IXRIV1fbw/Pl4Z3eBc4y0GU2gJGHcS/t0GmuXDnp7HqW1uBuXEGMv7+jjbLYZ3GBRGfsMrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49EKyULBDKpKBREfyz+0o99vmLkFUT2zCRaqFYdx+QM=;
 b=XeUydZ/YsYXWaoQCPmweZMFRXiTA9Mt8jQaPZxCp6/o66nEH68LBFwlB6KQtPrnmQr2Q551jXQVXgZfMydCMUxoNjW6+T7/LXf4CKwo2FRlj79Yqek5HoMz/Ea0bfImtezqwaspwAnZiw2iSxC4jSRdafCey12buHtEDoB3w/wQyZ5vM4s/D/WM35RjaKc6IqiVu1HLHC2Kd8ZdOtY6XOPbfjQSnF//yEx6/3Q31wRtnMQ2np3n7MoqnYlyoa8+1rwtzrNF6QZsnfPcAQxXKK82UKfcZ6Fyr5M2h/kgwLhBL99+WzLdH4P6Xk5Z5qEfXE5sgpCcomZdC88y8MwBsdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49EKyULBDKpKBREfyz+0o99vmLkFUT2zCRaqFYdx+QM=;
 b=MwdZlWsRCeDnLA7YhTc6g7hMt0/LX3+ZeN0+NxKUNQdLT3cbgIhbjmK1xQ/bks283ZAUjipiItHBbnCc2U36orHIlPOieyzAPUmn6ZT/zoChLxEaLTCHfoGfY1q4OaVYg0CtCUPLW9zdIfZAMuuwbU0IVs0riywmLxlrJBFn0vo=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB8242.jpnprd01.prod.outlook.com (2603:1096:604:174::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Mon, 13 Feb
 2023 16:02:28 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%7]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 16:02:28 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?utf-8?B?SWxwbyBKw6RydmluZW4=?= <ilpo.jarvinen@linux.intel.com>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        =?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?= 
        <niklas.soderlund@ragnatech.se>
Subject: RE: [PATCH v3 2/3] serial: 8250_em: Update RZ/V2M port type as
 PORT_16750
Thread-Topic: [PATCH v3 2/3] serial: 8250_em: Update RZ/V2M port type as
 PORT_16750
Thread-Index: AQHZPY8iYLe8+iwI5U6+00TIMHYpJ67MbPgAgACfh6A=
Date:   Mon, 13 Feb 2023 16:02:27 +0000
Message-ID: <OS0PR01MB592223656D6B0C3EAC3F7A2E86DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230210203439.174913-1-biju.das.jz@bp.renesas.com>
 <20230210203439.174913-3-biju.das.jz@bp.renesas.com>
 <af36a245-a73e-0f58-9c15-8435f542c4a1@kernel.org>
In-Reply-To: <af36a245-a73e-0f58-9c15-8435f542c4a1@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB8242:EE_
x-ms-office365-filtering-correlation-id: d8dc76a7-9a92-4fd0-4672-08db0ddbb484
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rx+fTTIikYHF0NBvaiW8WDlvqf54f/V4rsIUZ8Q8dDqxc+I+lYMlpfPt7QR0NmVrZxR0aDeWidjyI3gGDtDV4RMtmypfKOaNsDDLe/ifenU8852Bcg6eUyujZA4L5yn5rM7uxTp5PQkbg3ISUE0Znwota93BZ9FRHkaMmxjA1f2iRveHDQ3A5RtXWh4rcj7qWv/nxRw3vNqdGl+lnuqw+4K9vM+YLhEu9QEiqr1GPOyPW18qJAooOee2Ii3XxiJoBoh+qp4ERxs9+XNtaov8g7ylYU1Wurpt54lOXXIydhOwQ/dFM9Qim4vKdNl5ukR4BqwKqxcqUwfSBJUDGmliTk0sttq0n+wLCDbOg5Guqe1pkfI7BVlZSg/5liw6V52iv5EOu0temEObihAz9W62/ndc+tyqMpGQY6BEOWCzQlUujThIMVS5NXrLP2715sIkapszEhe8Iw5nghXMmVU8Snv3T5EWLpbIwjF90Ql1LaW2rgfTXLc/ODwEIHr/U6qTliwL6CrVBd7p9tkuowZ60zj2KxzD5Q/6T26ZwjxA5QmOgraINsSDqEVW0XngDPx/PF4dpwjIf/Zb3DFL4SXoVitIwb8guaAv/slTj00io4rQSqy1rSdPj6op+KKslTLgUbHdz+s/gVrWAJV6Viadp5S0sUygE9Qt3/JEkSe/QxuF5siQEfr94czUy4IEWXjLXtIhDIZxKCrqxw4ZhiYpoA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(396003)(346002)(136003)(376002)(451199018)(41300700001)(52536014)(66946007)(54906003)(64756008)(66556008)(110136005)(316002)(66446008)(5660300002)(66476007)(8676002)(4744005)(8936002)(4326008)(76116006)(15650500001)(2906002)(71200400001)(7696005)(478600001)(9686003)(26005)(6506007)(53546011)(186003)(66574015)(33656002)(83380400001)(55016003)(38100700002)(86362001)(122000001)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SndrLzNzWjZmOUU2WHRHaGd2Wm12VEc0czFUNGhIdHB3YWlBWXE1VUVCSnY3?=
 =?utf-8?B?YlhIM21ENFdJTUhNUWhEUnJ0UkIvY0VkTDhGRGlGeURqL1RrcTAxbzNyTSt6?=
 =?utf-8?B?aEViNWxRbnE1Wlg4TmxqMVkzWUVZV0JSWG9LQmpZT0xQaDkyek5PSFlvU0hP?=
 =?utf-8?B?RTh4dXdCQVptWVJESkEyUG1xdGt0MEt5a1dLZVdlZlRZQWVBYkhVNjVmRmM2?=
 =?utf-8?B?a1R6d1JSMGhrZGFtRVJZWWZPQk1iWExrcS9Vbkw0bmkvYjZEeExPSFdSWWpk?=
 =?utf-8?B?bkhNdWN5SS9sS1EvQVFrcWtydzc0R3VUZERuY3VHVUlGcXB5aC9tZXdOOGth?=
 =?utf-8?B?UDRSL3ovdDRFR25EYXBIQ2t0TVlsYjVCZERWNmY3b21QWVBrZHBqdlVUaVJI?=
 =?utf-8?B?ak8zaEw4SWVjTmxTOWk5bkdzVHUvajkwL3FsUndmQTFxejJuQzBMYmlQd1Y0?=
 =?utf-8?B?VVlnNGR0YVlzekYrYkwvWk5xRHA4TytrOS9uVFgwQzlIZWNscHh6c3dIbFNK?=
 =?utf-8?B?dTUvQzJySTJnUUsyV2ZKOTdaWlZYYlFKM3RJTTlQakkzVE1LZ2FzMTNzdWdJ?=
 =?utf-8?B?OHFnSEZLQnB1V1g4NDA4R0tYbkFqMjJUYitwYmdNMjNqc0RlaUdJUUhaT05l?=
 =?utf-8?B?VW5YbEVTRmM3UFg1UVVSa2s5OGNNUWtBdFlMZW4rRGZlYTNuU0E2VnFTRTBX?=
 =?utf-8?B?SS9PejRVR2VtMnFZTXl3WDk3cFUycGUzaGlWMmZ5ZEtEWHVPb083dWtlQ0xO?=
 =?utf-8?B?REluM3lPTyt4TXozRnNOODFQcTBxeWxtTHpRc2d3MlF6RVZvUmQ1VmlkM3dP?=
 =?utf-8?B?QVVKa1ltR2pYbC9waEhZb25HSk92K2RJQU9WWE9JOHBjZzMyTmc4N2R3NjNU?=
 =?utf-8?B?NTBpQ3k3VTJ2cG9kZk1CNDhXME9CRG9jZWU2SVMyTWNpMC85R2lnaUp2bXlY?=
 =?utf-8?B?RUh0NnF3VDBKNllIc25GVnhFWDF6NTNKbFUrZ2RSbkwwSEdtYjZ2Y1FtTUFL?=
 =?utf-8?B?aHp5TUJFdFY0WEpRcnVkSEdDL3ZrYnFuOVlzcmMySlBTcmlxaE9yYktNbXMr?=
 =?utf-8?B?U3EzVVRvQkVobHBhc3F2dW9BRzNsTXRQdHdudHlCQ3A5bVcyUmUyZTRsM0RL?=
 =?utf-8?B?SE4xZDVrTjJLbjFWTE9kNUw0K0VNOURaUkJQbUhvVVlpak8rWXB2RHU3OUdP?=
 =?utf-8?B?ejIrOE8relR2clhFUTdPNEswRFlMZUFKeXl5TFBTT2RsZ2hsam10M0k2M2pv?=
 =?utf-8?B?MWUyVnZhT1RPNVZhVVRxQ1ZRRWovbFozK25qN3BSSFFVSzJIT29aam1mN0w0?=
 =?utf-8?B?SWVPZ1VKQlFQdG41RXFlNkRQOTgyQjlpU25ST0ZsdTRVYjQrUHNRUGJzbmxX?=
 =?utf-8?B?UkZXbkZCamNWdWRHNlRjMXZuT1RiZXE2Zi94bVJGZUxva3pSWUNhSHVRajNV?=
 =?utf-8?B?NFNIOUJJYUFrTXhacTNxeG1HeDhvWkxOU3NtbnBvQVM0enVSNXdscWVQOWVo?=
 =?utf-8?B?dzliQm94SVIxLzJqZzliZjZIaVREdVNjWDFOd0RrZzdzZUFSN1YzTU8vclVl?=
 =?utf-8?B?Z0Rxayt2aTBTREVIRWZTdERCVWJqMVBJRGhob1BMYWd5alc5K1A0QmlSY1RC?=
 =?utf-8?B?QVlJeDBreU9idU1xdG50Q0ZZMkUwbDdhL1B3QXVuRmttSmY0c3BNanpMc0ti?=
 =?utf-8?B?a2l2cWYyMVkxOTFKWE9OMnlRR21XVS94NzZFRlJsT09IZEVOTWozQUk4cEc1?=
 =?utf-8?B?R3dlc29IT0NsWXVYMXZ0aHJzT3RCRVJKaExpazRQc2QvbFZ4a2ZFVVBzdUhz?=
 =?utf-8?B?WkNJSmUyM3FFQkN5VXJORXJVeXY1akJxWUpwc2g5S1d2WHRoYTA1dlMyRERJ?=
 =?utf-8?B?RWFramR2NDdFUlg1elRLTm1aTGVodmpuOC9xTDM1Qk5wNzlEcWRHbXladEpw?=
 =?utf-8?B?OEw4cnBzOEIyVVE4d0JtaVFFWEhRMG5CSXFPRDVjZVJZMFEwa0FXSi92dURQ?=
 =?utf-8?B?UUx1RHNCMzBNNDJvanpBbDkrQ2Z0cUtPSGQwMWlIMUliNi8veTRiVU45M1BU?=
 =?utf-8?B?QlBzcGhpZ3MzdHREZE4waWhTNkxxRXB3amNkdy9MWDlDNzd3ZWo2UmlWR3l4?=
 =?utf-8?B?alJScWN2eFJYelpCOG9mYUhxcFJpaTU0d2YxOTZ3bC8yZ2t3S3c5N3BoQXBv?=
 =?utf-8?B?dHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8dc76a7-9a92-4fd0-4672-08db0ddbb484
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2023 16:02:28.0154
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hKtMo2vDRl7l5/Uw4srH80aeNr3g4iAfOk5hLBvNpHkUd1xbw+qU6v46SARq83JogCBbkAjoFduysY8HCacIXchoLZkcwe6Hw2U/U3HhyA0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8242
X-Spam-Status: No, score=-0.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        RCVD_IN_VALIDITY_RPBL,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgQWxsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEppcmkgU2xh
YnkgPGppcmlzbGFieUBrZXJuZWwub3JnPg0KPiBTZW50OiBNb25kYXksIEZlYnJ1YXJ5IDEzLCAy
MDIzIDY6MjYgQU0NCj4gVG86IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT47
IEdyZWcgS3JvYWgtSGFydG1hbg0KPiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+IENj
OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPjsgbGludXgtDQo+
IHNlcmlhbEB2Z2VyLmtlcm5lbC5vcmc7IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJv
Lmp6QHJlbmVzYXMuY29tPjsNCj4gbGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnOyBJ
bHBvIErDpHJ2aW5lbg0KPiA8aWxwby5qYXJ2aW5lbkBsaW51eC5pbnRlbC5jb20+DQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjMgMi8zXSBzZXJpYWw6IDgyNTBfZW06IFVwZGF0ZSBSWi9WMk0gcG9y
dCB0eXBlIGFzDQo+IFBPUlRfMTY3NTANCj4gDQo+IE9uIDEwLiAwMi4gMjMsIDIxOjM0LCBCaWp1
IERhcyB3cm90ZToNCj4gPiBUaGUgVUFSVCBJUCBmb3VuZCBvbiBSWi9WMk0gU29DIGlzIFJlZ2lz
dGVyLWNvbXBhdGlibGUgd2l0aCB0aGUNCj4gPiBnZW5lcmFsLXB1cnBvc2UgMTY3NTAgVUFSVCBj
aGlwLiBUaGlzIHBhdGNoIHVwZGF0ZXMgUlovVjJNIHBvcnQgdHlwZQ0KPiA+IGZyb20gMTY1NTBB
LT4xNjc1MCBhbmQgYWxzbyBlbmFibGVzIDY0LWJ5dGVzIGZpZm8gc3VwcG9ydC4NCj4gPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4g
PiBSZXZpZXdlZC1ieTogSWxwbyBKw6RydmluZW4gPGlscG8uamFydmluZW5AbGludXguaW50ZWwu
Y29tPg0KPiANCj4gUmV2aWV3ZWQtYnk6IEppcmkgU2xhYnkgPGppcmlzbGFieUBrZXJuZWwub3Jn
Pg0KPiANCg0KVGhhbmtzIE5pa2xhcywgZm9yIHRlc3Rpbmcgb24gRU1FVjIuDQoNCkVNTUEtbW9i
aWxlIGhhcyBzYW1lIHJlZ2lzdGVyIGxheW91dCBsaWtlIFJaL1YyTQ0KYW5kIGlzIFJlZ2lzdGVy
LWNvbXBhdGlibGUgd2l0aCB0aGUgZ2VuZXJhbC1wdXJwb3NlIDE2NzUwIFVBUlQgY2hpcC4NCg0K
U28sIEkgd291bGQgbGlrZSB0byBhZGQgc2FtZSB0eXBlIGFuZCBmbGFncyBmb3IgYm90aCB0aGUg
U29DcywNCmZvciB0aGUgbmV4dCB2ZXJzaW9uIG9mIHRoZSBwYXRjaCBzZXJpZXMuDQoNCkkgZ3Vl
c3MgaXQgaXMgb2sgZm9yIGV2ZXJ5b25lLg0KDQpDaGVlcnMsDQpCaWp1DQo=
