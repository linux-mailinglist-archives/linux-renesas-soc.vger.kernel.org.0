Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F87A69AADC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Feb 2023 12:56:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbjBQL4z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Feb 2023 06:56:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbjBQL4y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Feb 2023 06:56:54 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2131.outbound.protection.outlook.com [40.107.114.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 327CB65687;
        Fri, 17 Feb 2023 03:56:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LWW2P20rXcQuFm4ZyT/PDMGxsw1gcl6SZQlkmVAPjva8r8vtzeLdHjzCyj64fjqeqW+fbTZODNll3Osm2eYVNNMxuH85J7r2JfLBF/eEKu5jFf1QlHuQ/iqYJNkEgquMCck5uGDJHrXmzQ0X2UiKq9r+tdV+Ktpt8/gWevOMs9qTg0AFcL8G6tKz4TXbLhsL2fb/KGmWycRhdWRTgGW1pmAMQsZ7rHOfM7B0mqm5KbPJ0mKltFaX/xlTBZPBPNK/zE6UQ2Am4PTCZExUZtD88/G59Cq56VCDwZaTvO9HlZ/1Y2cXZMXVVcTpQ8nq3ydGFgcA1dUmge9rgzxgBSXlTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1QTYqMgnSXD69JX85AqLH7b+hDoQMH47UlFx6LmyQI=;
 b=be6lzJ7zHyWAvMCO47zxFxsdJd0DlFR+QCNTIWIQ1rBeiT4lqPUITqyWG4bA7jZx1ublGUw/4crE/Hs38/NE3bHvCr31OgWiVEEd6B61VLXzKNoCFdFt2Vbo/XvhJZTISaXue+b/e0Ytpq1ZtF0ADkh799C1nZirtrIVlMvqYrB+zOyoVuCQEE3po8cvEgwJhgRwG+fwto7cUWk/3oZWRvtT4VaBX0Mcfnj/NeDUcizoHwdFfrYhDbGFOugi+hlGQSWAmJklTNxA0KEbS+2O5vDGvb9BbGIURC3FcEOIoUrPMQm2nLIAXmolyTOWHH9bibIQpMt0XOL+lKimh9zk/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1QTYqMgnSXD69JX85AqLH7b+hDoQMH47UlFx6LmyQI=;
 b=Omy5q4hGlHpfqT+bn4+ZnlTMU6vVblAOqOl097flqXMR3pqne54ZvDPqbK1SVFmfJ2LFr9TxrgCqiu21wUbczJ5rrn1NKEeh+ghMsfuout3L7WthKv61KDHkGQ+gRfAL8ZDgAg0yFI9KV2QvNTdix+24MZcFNVeBwXUBc+PKdwQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB10134.jpnprd01.prod.outlook.com (2603:1096:400:1ee::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Fri, 17 Feb
 2023 11:56:48 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%8]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 11:56:48 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     =?utf-8?B?SWxwbyBKw6RydmluZW4=?= <ilpo.jarvinen@linux.intel.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?= 
        <niklas.soderlund@ragnatech.se>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 5/6] serial: 8250_em: Use pseudo offset for UART_FCR
Thread-Topic: [PATCH v4 5/6] serial: 8250_em: Use pseudo offset for UART_FCR
Thread-Index: AQHZQsUI4w2Y27F7KECGzFHdmm5uz67TBUiAgAABfXA=
Date:   Fri, 17 Feb 2023 11:56:48 +0000
Message-ID: <OS0PR01MB5922EA33B354EB2B31680AB686A19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230217114255.226517-1-biju.das.jz@bp.renesas.com>
 <20230217114255.226517-6-biju.das.jz@bp.renesas.com>
 <a893f031-b08a-638a-70e0-3e6e37e9954c@linux.intel.com>
In-Reply-To: <a893f031-b08a-638a-70e0-3e6e37e9954c@linux.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB10134:EE_
x-ms-office365-filtering-correlation-id: 62bf1d30-d44c-4721-84ff-08db10de0cb6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8tufabI0KVYE45pC9Zs14LQkwiZdUuxx68V59z2I1VS6FdJS9lUBM3rivuh5qIK1WzgCvqgfnQqgC/EyLjdLPLJ9uxzxOIME7/Tbo/W0gvrv3XgPQj7s/EG6nhK7jHhwkTCtJcM5fos7729AFYn8snyqcLr1GU+hR6x4JExvvXVUY7coTZq8nN9KLEDLV32I3l3kXGSFge0WM50JgBlVvu7jm2Pb2BQ6QwtpTGi4QIlayRaylaz8Db7Ex9PkpyJLHurDmILzMs97J0Dq/YSsNuMySB8lskaynkQKK+1fUo6uwWhBKLP8AiCzbEZRLX7O37n0xszVqdpMLJlDb83AYBscpHppR+gGg4dQdoM34G2EYEhD1n65n4ZxZvabLxK2AQJrLYJUAIVS2o7Io0qP+Fn8ywiVInSZZN/5nEEvlreWMVamz8QCipDvtgpp1wdhjCZrnRRoUPoLPzDWClBBC9uA2xTZLGBE7JIHfWFabNqTAyN1A935xIi93mO5RWo5qf3xF1O+ARUp8VWS/LBSz2KrFkdM1QiIOfOH6+6a4n2P1Akqwpa7qlulLBpDSwsvjWFMrDXp6rnK1FTdDW3OiXJelLwC8dtAkhPXjOSQlpvirKDyCz3ITkJ8c8CR6VsZcTkHeqMavThDMmP+dZGpu5a36rcER+4BJDpSyhzdBOY+Wh2TT1R4Aw/KSzXp7iJKxJl2d8YkKdxdbN5YSwZEAQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39860400002)(346002)(376002)(136003)(396003)(451199018)(2906002)(8936002)(54906003)(52536014)(316002)(66476007)(5660300002)(38070700005)(66446008)(66556008)(66946007)(64756008)(76116006)(41300700001)(8676002)(6916009)(66574015)(4326008)(86362001)(33656002)(83380400001)(122000001)(7696005)(55016003)(478600001)(38100700002)(186003)(6506007)(9686003)(26005)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFFVNkllbEFCMWJFZURiQXYrK2ZZT1h2MUNqSFZLZFRLS3ZadzduSDd1WWdH?=
 =?utf-8?B?b3k3NnFyb2puVU0zV0RWNlZOMmxac2Zzd1k2SFlZckpJWHd2TlBaVmFrQzZw?=
 =?utf-8?B?Wjd6bUlPUnA4cWh3Sm5IYnpDRDFsTEpweHJ1dzM2L3YyWXkrdERaNkpLeUZS?=
 =?utf-8?B?dnQvaE9SYXFvRmFJb01hS2RpNkxkTEdZdWJpWFMyMnh1QURweHIyamcveVc0?=
 =?utf-8?B?VXlsMC9VWmR3YllqekZDZlhDL09oTEpNSlY3UU1WckxYdHFhZEhnNEdEWmZl?=
 =?utf-8?B?OXF3aW0wWURiMTdiUWtrMmFoMTM5bm0rTVhmZ0hwMm9CdTJDOS9NRzhjenVT?=
 =?utf-8?B?V3grL2Z3RXhua2szaForN1dIR1IxcEg0RkVmMWVUYVlwVU9zZzR2Tmt2bjUr?=
 =?utf-8?B?TFB6ajBFZ244VnRGS2h5ZEtON3F2RWhHUFZTbVVRUlUyLzVHN1ZBUU1hQ0tF?=
 =?utf-8?B?RkRSMEc3SzZkSWR1OHVDZjlBc1ltSGl2VTlZVXcwRlZmaHpqV0NkVWl2Ym0r?=
 =?utf-8?B?Ri9tR1lvMGdKMkFuN0tlbzdPd0VDclBvVVNVSFh1OU9PamhrTUVSdWg4OUpn?=
 =?utf-8?B?WUVHUHdiVnNDdktEUkFSWjNPOHlFdjVRa0tnMTdMdGRvQ3Zvenk2OEJHaVB2?=
 =?utf-8?B?VjdSVnJsY0k0ZnhNbWYwdnF2SGtrKzBrWEJzZ1hGM3liRDJkejFuMDdEOEll?=
 =?utf-8?B?M2N6VHZjN255cWNjVEJIbzd4dVZlMk5yQlFCMjF5SWc0NDBFQTdIdFZCZ0My?=
 =?utf-8?B?UDhtZThVb0xjUmFRZmJRckNXWjRwRHNBNlM3MmhwZ3JNeDBrMTVSejhkZWJV?=
 =?utf-8?B?NjhuQnJDVFI1NGRadjNyYXFxbHVSTlczU2xuVUExdkJRcjVwcVl3bGFuektz?=
 =?utf-8?B?bklrY1ZLWVY4WHJKSkdNLzVka3NCeldaSS9Ra0tKcUpERjRwMUhCS1NZek5B?=
 =?utf-8?B?bW9iS2VHc2NDTDIwM1grWnQwTDBaL2pyc2JldVdxS2NtaU4zcmNNUnlWeXRn?=
 =?utf-8?B?UFg4c29pQ1hBbDF5MlBWYmlKU2JFU2lvaXRrOEhuRlpPb0R4VVdwT0ZFbVkw?=
 =?utf-8?B?T3gwYzZidFJLR01Tdy85c2hLSlFLVjdyZEl3Y0Y2cGlMMHEzM3hPSExwV0U0?=
 =?utf-8?B?VVhPTmYrVjVYVTR1NVdlWTdQT1hscjdxdk4wc3gvNGZEeTIyVi9oNnBQbDNp?=
 =?utf-8?B?SXFmc1VaMmNZUmRsRk9hYjVOZThwNU41WkRsZjV6ZWJ6b0M1U1lKa3ZlODBN?=
 =?utf-8?B?RWJycU5PL0tKN24rOGxrNlNlQUU2ek11K0ZuV0dlNVV1TVVFeUhqMTMrMFd2?=
 =?utf-8?B?MWlvMWw4U2dQN21KNFVrc0FNcUFOeVJodTFTaGRMUnZhMVNVWEFiSFM2Y0NP?=
 =?utf-8?B?b0NTMmMvVlMrelVZUUJ0akhpWS9wS3VPWkdJOWNFUG9lRjYydmRETmFEVHJn?=
 =?utf-8?B?WlgvYzdmS0R1Zm9YMHBhOGplY081VlJTZEI2STJjQXBJN1Y2RiszUXhJcHZO?=
 =?utf-8?B?akhzSjFNUXRoQ3ZVbVNqd2ZmcUFsQmtsZ01ibXc3c2hvNjhqMGVkeEFEbVBO?=
 =?utf-8?B?ZmdiNVU4N0tlc2FuSERpTVRyYWx6QnlBcXBqc2ZqVlVyTitqcCtTYVhkN3dK?=
 =?utf-8?B?ZFhYclJyUVZLeUtVNXVEZ2VWak53UDduTmFOU2QvVytFMm5KNlFwdlY0dnA2?=
 =?utf-8?B?NFB2NXRSTXgzVGNQeUNBaDZlMmJrWE4vT0pMRXFjNWJiOHJ5YUw5YXdTUkgx?=
 =?utf-8?B?R0hOQ0RyNitHQWJKNldpam1TUGVDZGJSdUkrNC9BNFMzY2g1eVVzUkdVTEhl?=
 =?utf-8?B?REM5cldqc3Vyb1l3dDJrakNsVCtSVzlpTUx1b3FISlIvMDdpbmtNOElLUUYw?=
 =?utf-8?B?Q2E1WXpUc2hidmp1ZVBQa053MW5rTUlxZytobjVFQW9SRHlPN0Z5Znp0RlNs?=
 =?utf-8?B?QUYvMjhmdFdHWTB3NlFWejNsZ0FaL2NUUDI2WWQ0dFRyNmpsTU8zanNuNXd5?=
 =?utf-8?B?TUtCSittc1VOZ0J1UldEUXNEMmxSWVNCTDRQQnYxRnB4UnU0Sko4RktvcUJ5?=
 =?utf-8?B?bG9IZkFFRWtLd0MzelZuT09LV0dZaDZqUVdPNElocTlxZWYwYy9NdUFsQWti?=
 =?utf-8?B?Q2RWUWNEeEJEY3hLNEg0RHdXMW1YQTlSaVFmTngzRXJkeDhyOXo1ait5Ui9t?=
 =?utf-8?B?TkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62bf1d30-d44c-4721-84ff-08db10de0cb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2023 11:56:48.4660
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UPNOuVTnYiqlNuVYUbkQPIqCMXij3b0YPzAb1cGIw2sR+0ALoQWZFPYmxzVfFURYkRTpuoKXg8dwFrHVGaewdkTO7S+i9SGJPefxpOvkqFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10134
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgSWxwbywNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2NCA1LzZdIHNlcmlhbDogODI1MF9lbTogVXNlIHBzZXVkbyBvZmZzZXQgZm9yIFVBUlRf
RkNSDQo+IA0KPiBPbiBGcmksIDE3IEZlYiAyMDIzLCBCaWp1IERhcyB3cm90ZToNCj4gDQo+ID4g
VUFSVF9GQ1Igc2hhcmVzIHRoZSBzYW1lIG9mZnNldCB3aXRoIFVBUlRfSUlSLiBXZSBjYW5ub3Qg
dXNlIFVBUlRfRkNSDQo+ID4gaW4gc2VyaWFsODI1MF9lbV9zZXJpYWxfaW4oKSBhcyBpdCBvdmVy
bGFwcyB3aXRoIFVBUlRfSUlSLg0KPiA+DQo+ID4gVGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgbWFj
cm8gVUFSVF9GQ1JfRU0gd2l0aCBhIGhpZ2ggdmFsdWUgdG8gYXZvaWQNCj4gPiBvdmVybGFwcGlu
ZyB3aXRoIGV4aXN0aW5nIFVBUlRfKiByZWdpc3RlciBkZWZpbmVzLg0KPiA+DQo+ID4gVGhpcyB3
aWxsIGhlbHAgdXMgdG8gdXNlIFVBUlRfRkNSX0VNIGNvbnNpc3RlbnRseSBpbiBzZXJpYWw4MjUw
X2VtXw0KPiA+IHNlcmlhbHtfaW4vX291dH0gZnVuY3Rpb24gdG8gcmVhZC93cml0ZSBGQ1IgcmVn
aXN0ZXIuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAu
cmVuZXNhcy5jb20+DQo+ID4gU3VnZ2VzdGVkLWJ5OiBJbHBvIErDpHJ2aW5lbiA8aWxwby5qYXJ2
aW5lbkBsaW51eC5pbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gdjQ6DQo+ID4gICogTmV3IHBhdGNo
LiBVc2VkIFVBUlRfRkNSX0VNIGZvciByZWFkL3dyaXRlIG9mIEZDUiByZWdpc3Rlci4NCj4gPiAt
LS0NCj4gPiAgZHJpdmVycy90dHkvc2VyaWFsLzgyNTAvODI1MF9lbS5jIHwgMTMgKysrKysrKysr
KysrLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdHR5L3NlcmlhbC84MjUwLzgyNTBfZW0u
Yw0KPiA+IGIvZHJpdmVycy90dHkvc2VyaWFsLzgyNTAvODI1MF9lbS5jDQo+ID4gaW5kZXggNDk5
ZDdhODg0N2VjLi40MTY1ZmQzYmIxN2EgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy90dHkvc2Vy
aWFsLzgyNTAvODI1MF9lbS5jDQo+ID4gKysrIGIvZHJpdmVycy90dHkvc2VyaWFsLzgyNTAvODI1
MF9lbS5jDQo+ID4gQEAgLTE5LDYgKzE5LDEzIEBADQo+ID4gICNkZWZpbmUgVUFSVF9ETExfRU0g
OQ0KPiA+ICAjZGVmaW5lIFVBUlRfRExNX0VNIDEwDQo+ID4NCj4gPiArLyoNCj4gPiArICogQSBo
aWdoIHZhbHVlIGZvciBVQVJUX0ZDUl9FTSBhdm9pZHMgb3ZlcmxhcHBpbmcgd2l0aCBleGlzdGlu
Zw0KPiA+ICtVQVJUXyoNCj4gPiArICogcmVnaXN0ZXIgZGVmaW5lcy4gVUFSVF9GQ1JfRU1fSFcg
aXMgdGhlIHJlYWwgSFcgcmVnaXN0ZXIgb2Zmc2V0Lg0KPiA+ICsgKi8NCj4gPiArI2RlZmluZSBV
QVJUX0ZDUl9FTSAweDEwMDAzDQo+ID4gKyNkZWZpbmUgVUFSVF9GQ1JfRU1fSFcgMw0KPiA+ICsN
Cj4gPiAgc3RydWN0IHNlcmlhbDgyNTBfZW1fcHJpdiB7DQo+ID4gIAlpbnQgbGluZTsNCj4gPiAg
fTsNCj4gPiBAQCAtMjksMTIgKzM2LDE0IEBAIHN0YXRpYyB2b2lkIHNlcmlhbDgyNTBfZW1fc2Vy
aWFsX291dChzdHJ1Y3QgdWFydF9wb3J0DQo+ICpwLCBpbnQgb2Zmc2V0LCBpbnQgdmFsdWUpDQo+
ID4gIAljYXNlIFVBUlRfVFg6IC8qIFRYIEAgMHgwMCAqLw0KPiA+ICAJCXdyaXRlYih2YWx1ZSwg
cC0+bWVtYmFzZSk7DQo+ID4gIAkJYnJlYWs7DQo+ID4gLQljYXNlIFVBUlRfRkNSOiAvKiBGQ1Ig
QCAweDBjICgrMSkgKi8NCj4gDQo+IDgyNTBfcG9ydCB3YW50cyB0aGlzIHRvIHJlbWFpbiBpbiBw
bGFjZSwgSSB0aGluay4gT3RoZXJ3aXNlIGl0J3MgYXR0ZW1wdHMgdG8NCj4gc2V0IFVBUlRfRkNS
IHdpbGwgZW5kIHVwIGludG8gd3JvbmcgZGVzdGluYXRpb24uDQoNCk9vcHMsIG5leHQgcGF0Y2gg
aGFzIHRoaXMgY2hhbmdlLg0KDQorCWNhc2UgVUFSVF9GQ1I6DQorCQlzZXJpYWw4MjUwX2VtX3Jl
Z191cGRhdGUocCwgVUFSVF9GQ1JfRU0sIHZhbHVlKTsNCg0KSSBqdXN0IG5lZWQgdG8ga2VlcCBV
QVJUX0ZDUiBmb3IgdGhpcyBwYXRjaCBhbmQgDQpyZW1vdmUgaXQgZnJvbSAic2VyaWFsODI1MF9l
bV9zZXJpYWxfb3V0X2hlbHBlciIgb24gdGhlIG5leHQgcGF0Y2gNCg0KQ2hlZXJzLA0KQmlqdQ0K
DQoNCj4gDQo+IC0tDQo+ICBpLg0KPiANCj4gDQo+ID4gIAljYXNlIFVBUlRfTENSOiAvKiBMQ1Ig
QCAweDEwICgrMSkgKi8NCj4gPiAgCWNhc2UgVUFSVF9NQ1I6IC8qIE1DUiBAIDB4MTQgKCsxKSAq
Lw0KPiA+ICAJY2FzZSBVQVJUX1NDUjogLyogU0NSIEAgMHgyMCAoKzEpICovDQo+ID4gIAkJd3Jp
dGVsKHZhbHVlLCBwLT5tZW1iYXNlICsgKChvZmZzZXQgKyAxKSA8PCAyKSk7DQo+ID4gIAkJYnJl
YWs7DQo+ID4gKwljYXNlIFVBUlRfRkNSX0VNOg0KPiA+ICsJCXdyaXRlbCh2YWx1ZSwgcC0+bWVt
YmFzZSArIChVQVJUX0ZDUl9FTV9IVyA8PCAyKSk7DQo+ID4gKwkJYnJlYWs7DQo+ID4gIAljYXNl
IFVBUlRfSUVSOiAvKiBJRVIgQCAweDA0ICovDQo+ID4gIAkJdmFsdWUgJj0gMHgwZjsgLyogb25s
eSA0IHZhbGlkIGJpdHMgLSBub3QgWHNjYWxlICovDQo+ID4gIAkJZmFsbHRocm91Z2g7DQo+ID4g
QEAgLTU0LDYgKzYzLDggQEAgc3RhdGljIHVuc2lnbmVkIGludCBzZXJpYWw4MjUwX2VtX3Nlcmlh
bF9pbihzdHJ1Y3QNCj4gdWFydF9wb3J0ICpwLCBpbnQgb2Zmc2V0KQ0KPiA+ICAJY2FzZSBVQVJU
X01TUjogLyogTVNSIEAgMHgxYyAoKzEpICovDQo+ID4gIAljYXNlIFVBUlRfU0NSOiAvKiBTQ1Ig
QCAweDIwICgrMSkgKi8NCj4gPiAgCQlyZXR1cm4gcmVhZGwocC0+bWVtYmFzZSArICgob2Zmc2V0
ICsgMSkgPDwgMikpOw0KPiA+ICsJY2FzZSBVQVJUX0ZDUl9FTToNCj4gPiArCQlyZXR1cm4gcmVh
ZGwocC0+bWVtYmFzZSArIChVQVJUX0ZDUl9FTV9IVyA8PCAyKSk7DQo+ID4gIAljYXNlIFVBUlRf
SUVSOiAvKiBJRVIgQCAweDA0ICovDQo+ID4gIAljYXNlIFVBUlRfSUlSOiAvKiBJSVIgQCAweDA4
ICovDQo+ID4gIAljYXNlIFVBUlRfRExMX0VNOiAvKiBETEwgQCAweDI0ICgrOSkgKi8NCj4gPg0K
