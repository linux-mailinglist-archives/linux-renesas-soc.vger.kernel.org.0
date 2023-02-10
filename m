Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF02E692032
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Feb 2023 14:49:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232302AbjBJNts (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Feb 2023 08:49:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232261AbjBJNtr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2023 08:49:47 -0500
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2121.outbound.protection.outlook.com [40.107.215.121])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89ECF749A9;
        Fri, 10 Feb 2023 05:49:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SyQ5jNkr95uwCD7CcHnDZm4dXWECo0qgiLO0j0G1QPnvOR2p97a1opkymC8mCahAY0VUQOHAle/OnGejPHloxx1fLDPSJoj2xeFFPk1nYlpifmWO+UVPWfW2T/h9M8h+uuPWh+YruuEgLw0vYbJJIFID4sWCCqiX2Bejp1B+XpupvhHlyiwvpCy011K0pZy/0CrGoLN07Q200y+2LLjRRpyGIKZfq9c92gXM5VFu9f5YVjyezjyrf05Z0tbOcdh08RvRwFhW2L5IKjrNelvjtBOrGitz0nrjB9M+6h9qgJkjADONkwGkFDK03B0vonkw6p6t/k1ZoZe5nlPSz6S9wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hDvDxWyAUjJAsHUdnbBibrcGkz5xAbS+ZIzH6e2mw4E=;
 b=MaW77sJCqT/RPgsCpyHIvTgiPmTL2hF2xGduHCkAunSmnFn55a6DvbPy5TASYcKvalR9fYV1kCsUuJRXnDZpMT764AEiDsqghtHBx8F+venDxyD9CrfVRH4DOQ8tWI7EB0UJqCQPT0pSc2J6tz9mjWr/O7sPv4a57Ff0ip+PkoS4tTShVrCYb4MaXdyDx9eh8pa2LdzBAqlG358FVpULagBXxqlx8vIoaptpKcuPiLe5kBI9nJXcfK1T1ITiUq8eZPYvkuuT1He+mFwWq4y7xFvgAx4bciRTUQVoJMpSSXJSFz3YxK6fLnQmOSurv+PdYBFnD42DHz714r1z3QRKfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hDvDxWyAUjJAsHUdnbBibrcGkz5xAbS+ZIzH6e2mw4E=;
 b=wF8+3wH2anHsKyGO4RM5mYzWx90j3nUcx/Dda3MY77Deo8JyvreKKVQ4M+U29ayUhzS3vsn+EqoJWt6l4Hj8SmFMg119A0t15BWkcFyCBGAMJN601hK+zlKAqoeaCvYE/g0v1RlinzfijroE5KcxcNeJe1pySXN6K3xGckY+HD8=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB6277.jpnprd01.prod.outlook.com (2603:1096:604:e8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.21; Fri, 10 Feb
 2023 13:49:32 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%8]) with mapi id 15.20.6086.021; Fri, 10 Feb 2023
 13:49:32 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 3/3] serial: 8250_em: Add serial8250_rzv2m_reg_update()
Thread-Topic: [PATCH 3/3] serial: 8250_em: Add serial8250_rzv2m_reg_update()
Thread-Index: AQHZPIosskWvaTdkmUGyylzcIx5dHa7G5c+AgAFN56A=
Date:   Fri, 10 Feb 2023 13:49:32 +0000
Message-ID: <OS0PR01MB5922F0B044AC56675BE5E6A786DE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230209132630.194947-1-biju.das.jz@bp.renesas.com>
 <20230209132630.194947-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdUXyM52qK1=yPq10i9n2apqO_Xvkvbvo6m5pYQebrJ7DQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUXyM52qK1=yPq10i9n2apqO_Xvkvbvo6m5pYQebrJ7DQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSZPR01MB6277:EE_
x-ms-office365-filtering-correlation-id: 016e1bdb-4806-44d7-d30f-08db0b6da341
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xxjv88DZAPhxvWfM2qDxYn5V7bD9AOaqQBztM9J14VoGywdvEujIx3Wg8fJGDw8FTXTJCTQrjbm8Iwaq/XzlhV65NLYFErqA8KCPh816PI26lNxD1zUlg5EQId1TiquQEzMeh3SVHxKEQC8QP4qhX78x+hI8KVMFOPb8VHu7YuKFp7/BvLjCtVrfOAvk3UJ9O86NZVlaQsdZg39HfdjP5sAvDQWdMPFayA2yd2v5Jl67bcSVZWIO6Dxx0q2KvGUNyC5oSeS+fCBpbFs+RPR5OKX2NxtHzPHOKXV4hfBsrvva36HRPebx8bPWGbOBU37sX3WNtI7HJDdjWFh2xmbLzFj2L58cS5j4fhlShCq752ovc4O09Psa6G3YGWAEx0TB76Eej6YVgTWDBiFMsX/UunqsERX1vdGJjZkyaVptraK8M9v0ZixvtTy4TDFIygMACUpshOF3+yQGGU5Rr2P3rt8b2B6Oo+3i8jXRDNuwxeGw2aX+gBMAS7VaXHIZd15pk7sFH0ajXT87E9LQzgKlpVU9fXN/kKdDoOTqo0+jXKG6fimc6l4mjNJV8qhnqT3HSqdytCXuer/8FI0uHNTPS7M4lTZUuLe0mr/6jKg9II8ID1De890C6AfE+K+0kihl1khSJZplHXCicrFOZ9t75ECPUTQW7XA7/rHZOY28m8Erc6HGEbyEed3bGJznIyyqtkiX25GIrMJLvq77xTEIFA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199018)(8676002)(186003)(8936002)(9686003)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(6506007)(4326008)(6916009)(26005)(33656002)(86362001)(38070700005)(122000001)(38100700002)(53546011)(2906002)(7696005)(316002)(55016003)(71200400001)(54906003)(41300700001)(5660300002)(52536014)(478600001)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bEsvVTd2MDBTbWRJelBaVkNZRDRKMXFQclh0R1lpTlNIUm1NOFhjSnZvam13?=
 =?utf-8?B?emVBZXNtRTVNNFRiMXAveHRQVWpmSzJ3WDFybEFPcGhxc3VZZzhpV2FiVTcy?=
 =?utf-8?B?VUViK1FEa3BlMFpKL21GdDNjUEpqdEZ5RmdTZVR2RWNMdys0YmF4QWpUZENq?=
 =?utf-8?B?YnBYL3lRQ0hHUUUwZTJCczAvWEcyMFlMYVVlSzJvTUEwZ0pYL2JmMCtZV1Jx?=
 =?utf-8?B?WWtSOEd2MnpZdU5vUnZ0ZElhNzRaaVEvbW1Ed0VqRmZWL3l6WmF4MjdaT0JE?=
 =?utf-8?B?Vm9DYTAxR3BEWHl0SDZLTlQvTWtXOGo4YUJJbzdOSTRGbTREdVVJOUtZM09R?=
 =?utf-8?B?c0lUUmVMYzFRU3YzMlZWbmNnTVc3bFBSdGorWU1UOWhZRGpzQ2lBaWs2K2Rn?=
 =?utf-8?B?S1JkUHpodWVhZXlTbkVkTDljTVJKVHNZM3hqTFBaSWNFd1p4R255eElmbXYv?=
 =?utf-8?B?Q2VBK2pIL2ZFbzJMYjlpZlRIQmtQcUxUYnJCdTNXbTZvMWpMYkhFc3pJZnFI?=
 =?utf-8?B?blZMaGJJS2lsemRRVmltdCtPWEZNWEdmQzlCUnlRaVdZNlN5S0t2VWV1dnZr?=
 =?utf-8?B?M2gybXV3MWNTbkhTOGFKMkFnWEppb3IyK2JNdTNncENNVnZjcjZ6ajRxWUg3?=
 =?utf-8?B?NkpsRzl1U0dldzN5MDErdFRKZ1IydzkzVjk5QmM4a05kMFIxYThpVXhsa3Bl?=
 =?utf-8?B?YW02WEFpUEI3NGpUeGFZcW5WK1NaZ21wK0xkcGJGbVFqRzgxVE9WNDFMTVZp?=
 =?utf-8?B?dWc2alJVU1o5aDg5Z0xNTEo1bUhJWEZNK0JFS3RwK1h0eW9pWE1TSG5hdUkv?=
 =?utf-8?B?L2psbzV3SnU5YVl2dlQ2TXpRK2t4T1paTjJad3dXU2Y3bk9WUUVRVUlEamZW?=
 =?utf-8?B?Z3RoaUh4TWtua0N0b0UrbFFzYjZ1WUhJQldTcWpSSGJhc1VDbHMyOEFJeVFn?=
 =?utf-8?B?RWJFTTVML2svKzdKR2w4alRtMDFvaDlpSjZ4YTQwZE1GK2tJUXdLbmV0WTZ1?=
 =?utf-8?B?RHZFUS8yRFdnZHJOVE80Y0V1Rk9ib0hQYzBNeE4rVnNFTUxvcWFOaHY1UE9L?=
 =?utf-8?B?RGhYc0ZJVXJJNmdZMW8yOHU4aklMUWVyS1V6c2dDb2tLK3NxRVpFR2dOWkpu?=
 =?utf-8?B?N0tPSUxBYjRTd2VEVm5qSEY1dFFJVXRiZ2padUQ0NmJRTHB1cmdjeWZHRDM4?=
 =?utf-8?B?SmxScTZwRUpheFhYQkEzRFluSGJkRTRZTWFZNEw3U0FhSFhvblo2aEJEU2ZT?=
 =?utf-8?B?NWk4T0JFU21jZnFKZmh1ME03Y2R0VGRBM3BtVkh4cFJsWXNkQ1hpTHpxaGlI?=
 =?utf-8?B?aTk1eFZab0dvUDVBdFFEa1NiNXJIYXdpRGF3U0N6eXc1V0hja05zNjZ3RVpO?=
 =?utf-8?B?cjlIUzFCU2JET3JTbVhyUkt5b3RQVjZkbkdrNUIrbjF4QVNCRnUzd3B5ck56?=
 =?utf-8?B?SmdBS0N2OTlzUjJnTTJiNjRYemNXQnNiZkdNa2lDR05GMVQ1Sm1BUzFVK1pT?=
 =?utf-8?B?blZjQ2VJSXFQa2twUnJlNnB6TDZMUlk2bTJ3V0g0U1d3WWdPUVRCU25HNUo5?=
 =?utf-8?B?djhrT3I4RHpXZ01ZbFk4MGVvTXRRcmNHbmd2cEwweWw3RS9lay9XUVV0dER3?=
 =?utf-8?B?T3JGQWVmS0ZieXdJU09RRmxTVElYTDlRd044TnltdXB1Qm8xUWtMZUZHWmR6?=
 =?utf-8?B?ajBQV1dKRW4yWXQ1SGJhWlhIV3dNZDNHZis0b0UrZnQxOG41VmVZUTdxdU9W?=
 =?utf-8?B?RTRoWHIwVTRIZmpPL0FKaVp6OTQ3OUttczV4dVpIbzFYOUxVc2JvOGF1YjA1?=
 =?utf-8?B?QlNXdnhTRXprVnZWOWV2RWUxZUgzaUdZeENyMC9hVDJCYlJZWTF5ZjFYeU1L?=
 =?utf-8?B?UDlXQnBiRGhRMHFseVZTWUpRMElNVDdaRE5EU3JMZ2FDaXNocWVsUkxaNk1H?=
 =?utf-8?B?SXkyOWplc2tyQzQrQXNRajZpVzBEWGwvcWJnekl1ek8rcUNkVlFJK3pvL1I0?=
 =?utf-8?B?T0Q1VHNhKzFjQWtmVGVsbzlNc25TQk5PUHdUOHpBcHF6Mmh6TDIvcXdCdm9L?=
 =?utf-8?B?ZStJNjNWaFBjdnpIaWFTZS9TM1BMTDBPM0JmR3hGejJVNEVXMzZSUlIwNTVh?=
 =?utf-8?B?QTB2a0VNNzNvcEdPbE9YTXNyRzBNZmJyNC9sY0NPd2paREtjVnR3UmZVMFU0?=
 =?utf-8?B?WXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 016e1bdb-4806-44d7-d30f-08db0b6da341
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2023 13:49:32.1241
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jJo7dZY7timv6IRzUTkPa5EgaXMNqbpreVyaLzCTzmXqfnAW2ivf0SID5fMONqIp7+zLzK/c2LIbLSsYysyGtJ4ztKoujr+e/y1jw0LiLpU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6277
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMy8zXSBzZXJpYWw6IDgyNTBfZW06IEFkZCBzZXJpYWw4MjUwX3J6djJtX3JlZ191cGRh
dGUoKQ0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFRodSwgRmViIDksIDIwMjMgYXQgMjozMCBQ
TSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IEFzIHBl
ciBIVyBtYW51YWwgc2VjdGlvbiA0MC42LjEsIHdlIG5lZWQgdG8gcGVyZm9ybSBGSUZPIHJlc2V0
ICsgU1cNCj4gPiByZXNldCBiZWZvcmUgdXBkYXRpbmcgdGhlIGJlbG93IHJlZ2lzdGVycw0KPiA+
DQo+ID4gRkNSWzc6NV0sIEZDUlszOjBdLCBMQ1JbN11bNTowXSwgTUNSWzY6NF0sIERMTFs3OjBd
LCBETE1bNzowXSBhbmQNCj4gPiBIQ1IwWzY6NV1bMzoyXS4NCj4gPg0KPiA+IFRoaXMgcGF0Y2gg
YWRkcyBzZXJpYWw4MjUwX3J6djJtX3JlZ191cGRhdGUoKSB0byBoYW5kbGUgaXQuDQo+ID4NCj4g
PiBETEwvRExNIHJlZ2lzdGVyIGNhbiBiZSB1cGRhdGVkIG9ubHkgYnkgc2V0dGluZyBMQ1JbN10u
IFNvIHRoZQ0KPiA+IHVwZGF0aW9uIG9mIExDUls3XSB3aWxsIHBlcmZvcm0gcmVzZXQgZm9yIERM
TC9ETE0gcmVnaXN0ZXIgY2hhbmdlcy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFz
IDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRj
aCENCj4gDQo+ID4gLS0tIGEvZHJpdmVycy90dHkvc2VyaWFsLzgyNTAvODI1MF9lbS5jDQo+ID4g
KysrIGIvZHJpdmVycy90dHkvc2VyaWFsLzgyNTAvODI1MF9lbS5jDQo+IA0KPiA+IEBAIC0xMTEs
NiArMTU2LDEwIEBAIHN0YXRpYyBpbnQgc2VyaWFsODI1MF9lbV9wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlDQo+ICpwZGV2KQ0KPiA+ICAgICAgICAgdXAucG9ydC51YXJ0Y2xrID0gY2xrX2dl
dF9yYXRlKHByaXYtPnNjbGspOw0KPiA+DQo+ID4gICAgICAgICB1cC5wb3J0LmlvdHlwZSA9IFVQ
SU9fTUVNMzI7DQo+ID4gKw0KPiA+ICsgICAgICAgaWYgKG9mX2RldmljZV9pc19jb21wYXRpYmxl
KGRldi0+b2Zfbm9kZSwgInJlbmVzYXMscjlhMDlnMDExLQ0KPiB1YXJ0IikpDQo+ID4gKyAgICAg
ICAgICAgICAgIHByaXYtPmlzX3J6djJtID0gdHJ1ZTsNCj4gDQo+IFBsZWFzZSBhZGQgYW4gZW50
cnkgdG8gc2VyaWFsODI1MF9lbV9kdF9pZHNbXSBpbnN0ZWFkLCBwcm92aWRpbmcgYSBmZWF0dXJl
DQo+IGZsYWcgaW4gb2ZfZGV2aWNlX2lkLmRhdGEuDQoNCk9LLCB3aWxsIGFkZCBhIGZlYXR1cmUg
ZmxhZyBpbiBuZXh0IHZlcnNpb24uDQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4gPiArDQo+ID4g
ICAgICAgICB1cC5wb3J0LnNlcmlhbF9pbiA9IHNlcmlhbDgyNTBfZW1fc2VyaWFsX2luOw0KPiA+
ICAgICAgICAgdXAucG9ydC5zZXJpYWxfb3V0ID0gc2VyaWFsODI1MF9lbV9zZXJpYWxfb3V0Ow0K
PiA+ICAgICAgICAgdXAuZGxfcmVhZCA9IHNlcmlhbDgyNTBfZW1fc2VyaWFsX2RsX3JlYWQ7DQo+
IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdl
ZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExp
bnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LQ0KPiBtNjhrLm9yZw0KPiANCj4gSW4gcGVy
c29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYg
YSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBz
YXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlDQo+IHRoYXQuDQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==
