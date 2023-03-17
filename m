Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F9C06BE4B9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Mar 2023 10:02:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231755AbjCQJCe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Mar 2023 05:02:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231397AbjCQJBw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Mar 2023 05:01:52 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2122.outbound.protection.outlook.com [40.107.114.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C49A4B1A4F;
        Fri, 17 Mar 2023 02:00:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0uWbNKnwtuOan9gu9KwIuJ6j5vvC+GAU/dMd6jJ7rC1/jeUip06wVOaZwLSzbB7PrKCnsB5kSeURgt/mnFZavHpjV64TUJq8KiCBzwT/Wk5B5Qy1cWiLHpBgy291YW0bi7t2L+IM9fItbxjoO90pc5NNZww7HQFeReX6LqBQumnXKghWtEff127P3AL7h3YhTiJCHAJFfCZV2/q1i+T+5TfyEK4XgteTetEK+U2eM9a+m3IQSjgogJYk7l9c9Otb1kGrohVuEfRlRGz/gK3Ie5gyPujQ5wwIyGri6E4F9pNqrLgTKsE3aoxjgIUnk9d19+hzdebW+69iuYpPJTQiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o310U4dRbIj1N3voDDvveeC46pv1LFPzWrMervNsDZc=;
 b=JXbPslOLcg41AAK2fWFjpAwtIGNsg5WfiIh6bIy/WJw9yvxJBJk4NCa5sLdFIAxtZTmt7w8jSTDQ+Ad0ozGVYQDOdeW672ikCqL9y5+y3v5t3HXO/PDstPD0hrhpkG5FzY8dyFsPMpc2NcAFo6YIYMSKIQsBplFpOp/5FDiz5VVdI9j3ACzvL45lmIvXkToIZwt/+AF5QQ/MBn7ljRa+x/dUCMXzGJVoWu81rX91wNQcxBVzRYsgy3dAtDVv+NmW/e1L+GHMID2H1lIGXbSkAN+STt0gpT+kN3TdItxFIh3CErm/7wZM7mWG5s8gnx4ZIBt/BE/bFGZXNZjMflzWIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o310U4dRbIj1N3voDDvveeC46pv1LFPzWrMervNsDZc=;
 b=f0h3NiPbPKSjkYjNKHn3evCC9M8wNgXuOKYelt8r9XQYEckk+iS/nUve/pCQGn/tLsaGwlb53IC6MfU770Uv/cK5AHG597Hyw7mlnmuVhmthcGrrWuW2wPk+2mFGIW+y7HLeO+sJOwSDvHQVNxGoObRZlxY96XfAI29bz4FUrP8=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by TYWPR01MB8885.jpnprd01.prod.outlook.com (2603:1096:400:16e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.33; Fri, 17 Mar
 2023 09:00:01 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::9eb:3c9a:c2bc:af06]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::9eb:3c9a:c2bc:af06%4]) with mapi id 15.20.6178.033; Fri, 17 Mar 2023
 09:00:01 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Stephen Boyd <swboyd@chromium.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt handler
Thread-Topic: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt handler
Thread-Index: AQHZWCCS4vXtQ/fzW0yUXUaCYffr6a79lBkAgAAA5oCAABuIgIAA62sggAACXICAAABMkIAABoHQ
Date:   Fri, 17 Mar 2023 09:00:01 +0000
Message-ID: <TYCPR01MB5933865E5D673865B7C4A85586BD9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20230316160118.133182-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVX=sM-1y+-3PQDsjf8K3nLoS4WfSYfv6UAP=92T_oHaQ@mail.gmail.com>
 <OS0PR01MB5922EA7DC64F0D2C36B490A986BC9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXgwkJ2O7y98HW6n8SOgbuEx1uFrt1Jc-X2CzpC3y1P0Q@mail.gmail.com>
 <TYCPR01MB593334BB3847CCC45A1B6C7286BD9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <CAMuHMdUN=0aJ-7huv0XrhG3LMu8q_SEuqHU48ytTgGAYEjng5A@mail.gmail.com>
 <TYCPR01MB593390150CAC755AE540D7D586BD9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB593390150CAC755AE540D7D586BD9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB5933:EE_|TYWPR01MB8885:EE_
x-ms-office365-filtering-correlation-id: 6569e21c-dfe7-4e5c-a858-08db26c5fdfb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2jDzjwoPXSGDLGCM102Hd7JE4KX8MnB4hs8bZdoTk2Ed7RazWuXokiWY+xlMLKhUWWn7+GnQnQfFfx/wtoMH82a1gFe85VDIV02rs57wm2xjJ7Q/5C92dEi9KbT3/W+ZyDcEfSBcx41hoYLF39TAcSYZ+76bYqe/2hqqQY54rD8ij+GZEWnml8yYWx6/s5U2W0sOHaxViWXExT8DzXrNqHaGS50UDwEwvfTKHEBS1xI3MH4c80sIq//0ksjOM8NMuNphq5YFRDwrvUTsnRBZhjyr6xpr2vEpiUuDLTPCqeX55YjjYMHZZcWqmgfMXgfbC/VmODWgNd+oG8+g7GI9MjuCBHz2UOz4YfJSmrw8jmZvjYU3jJ21np8NZO6XQCZ0o44QCGkL4l+tJrgzS4VAJ4/qIg+LaA2QHl4uLZyZzQGOJbFNfNO03yxZZ3d2o4ygO2JYmfWZsWEQQ+2K8FzMchpeeu8rsfWLlIm4URRIRCU/nyyI926dDhquRlsQ0ZO4CflQPStNHyDpP32tmgmrjydw+aOCOImwITsA3bY2q9lrcS2wYKbJWRdtzDMnmZcEf/pJw19jp8/CJYKY1eycFblmtFSYvHHT48HWExdtKzkUZy+9WzxV/ORnQdImAV85m4qS4B8m90y42HRZNmaz6PNpN+z1odp9hGBg7cfHleYl/lVfnav5/U+vO9z26NUZXaPC8aiH/bl4GuJsF4CQKA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(366004)(346002)(136003)(396003)(39860400002)(451199018)(41300700001)(8936002)(5660300002)(52536014)(2906002)(86362001)(33656002)(38070700005)(38100700002)(122000001)(478600001)(66556008)(8676002)(66476007)(7696005)(76116006)(66946007)(66446008)(64756008)(2940100002)(71200400001)(55016003)(26005)(83380400001)(4326008)(54906003)(316002)(110136005)(186003)(9686003)(53546011)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YVBHeDdLdDNpTmhCVWlqNG5kYUlPQnNiVmxvWXNZVEsvT3k5bFJWcWdGZUh4?=
 =?utf-8?B?V2J4N01QVWFNanJHZVpwbUg0V1M2Z0xrY3NiVFFPZk1FS3FLUFNhS0xmMEtI?=
 =?utf-8?B?dlRJeWVZNXJCWklucDUwd1lRM0VmNXcxOXhKY3FFem5XM1BxL3cvdllNd2pE?=
 =?utf-8?B?Nm5lMzRKSXB3djk2NVdOeUZ0bFJsQVV5NVRuVGsyM1c1ZmU2c01mczNHWENm?=
 =?utf-8?B?QjhsS0VMTzlhemJ0MjhCR1l0dFViTkNrK2lXSUpnUWtodmNraTNOV1hFSy9v?=
 =?utf-8?B?eUtYQXNvS2tWRG1Jc0lYeTk3Rm5GbXdUVVBiaDhyM25lVnZqWFJqYVRRRDJ0?=
 =?utf-8?B?aFZTeVdMTnQ1dFJYVEtJYUdGZzd6QWZERVN1V0NOaXZMYXhhOUhNOWdrRlBn?=
 =?utf-8?B?S1dsVmVnbmRLZWIveEp2NjU2THJ5MVVBZUlUKzVGbTI4SUNSZEhBNFpGRjNV?=
 =?utf-8?B?cnRBN2FGRkI3UVl2b2liNlJKTUh3MTFvd3g3ZENNVTJCOU9zSCt0Ung3Mnly?=
 =?utf-8?B?Q1A3U21FRWFDaGpBa2Z4VzVEeXlsYW1ITFlMZDQ2eFRyRHRiOGlDOUc5S1Ay?=
 =?utf-8?B?cUp3anhrSWV0SWV4bmJMWXFVdm9RNXZ6RkZiYjV3Y1BwWjNZVGJ2a054SC91?=
 =?utf-8?B?alc1UGtoRHdSVzZFS0xjWWFWeHZFanZjMjFESGlIRmwrSVZwQTYwTG1ITEQy?=
 =?utf-8?B?ZytVVnN3T24xT2laV0FZUXhhOGoxZmZOSi9PeE5ZdFA3Y012ekpIS245VEw2?=
 =?utf-8?B?VGJ0WWtOLzRKc00xeWRDbkIrS01Ic1BrUjFzQUhIYXQzNFQ4Qy9aZ2dYS3cv?=
 =?utf-8?B?UUI1dDBrWG9SdHZjSG1Ucy9LNUNYZy9DUlNxazl5dk93em03bEtFMjF3WGll?=
 =?utf-8?B?d1BmSStGK1g1RmxmTEUxd1VwSDNaMmJaQ3ltRExacGpKWTQ5VW5venFnNk9z?=
 =?utf-8?B?dmlWQllqYXM5T0xsRTIzbXZHa0FjeTROREtSdUFhaVJTTzFsUHgwYXJhOVNM?=
 =?utf-8?B?eWo5MEJod2xFa2Y0QlJtWjdGcGx0S21wNEJkbG44SDArU0xyVnlYdnk0TVdv?=
 =?utf-8?B?K25NVXE1SFNMR25Td1dwbXhXOHNVMG9HencwRzc3V3lwQys4eU1WcGJvaFRK?=
 =?utf-8?B?L0x2WkVEcE93S2xVdy9kU3Rqbm1MSDFPbVdyZHlTZnpLak1UekFWTjM4S3B6?=
 =?utf-8?B?eXZSakJhU3lIdXZENVNaNjQrdXdZam1JMEJic3ZGUy9IVWhEQUNPc09DdHdH?=
 =?utf-8?B?M3lqTm9BSk92NFV4T3lvZHRoSmxhQk80cVp1cTEveEFNK1I1OXQ4MTE4SURN?=
 =?utf-8?B?Wmpua3RnUGI2TGEyM3BPaWJaSTBSbmQxUkdUSDBjOGt1TjV4SnlpMTNzdDYr?=
 =?utf-8?B?bEE1Y1dQSENFU0JERmJYZTZpRkxNU1ZaZlBlODVyWFB1bDVoR1R6S1BaQnRr?=
 =?utf-8?B?YjVxQXNkdWFzVFdwbXJmVjZOUmlycW1uQTEvd3FEZW4ydnc1OHdRNkVaenJF?=
 =?utf-8?B?bTRQZ1ZjM3NYdDhnZDVoNUxDNlErRTdDU2YzYmhTbVBVOGt3Zk1hQnFBYU1V?=
 =?utf-8?B?cWgxQzdzbmNnVFFNbm1yUm1JSW91UmFNZXhQbFlvZU5oaDJhLzhZbXlwVlM1?=
 =?utf-8?B?L2tmZldQZkpsUjVNUFBuUVVDL2NGQ3RseW1UNFlPNk4zMWlwLy9CVDlVN0RR?=
 =?utf-8?B?ZXVsa0dXK1l2SmVXMVpwWWNHa2NQaXppZDErT3NGa1Y2RmNxN284dGFUUmtC?=
 =?utf-8?B?Q3pmbnpHTTRqVHUveGRydXNuSnZBSU5yWlpMZksrMWlQNWhSRndqZllFazlt?=
 =?utf-8?B?bkJzM0hoZVhOZS9FS1ZTNGdKR2JhblpJZjBCVXVGV3pmR09MdVlFUmNDcDRs?=
 =?utf-8?B?ZSt3OWttWVc0SVJFSFRXOVUzSnI0eWk5TENmN3ZITWxFanowcVMrOVM5TWFM?=
 =?utf-8?B?U2pQR0tBOFR5UGdjbit4US9UclZPVlBFZzJpZnBLNURBUGs3V0d3QnBOZmR0?=
 =?utf-8?B?WTNQVnFISEUxb0ViUUxkM1laYyt3VVppSjV1UEpzRDJkL3Rmb1RtT0NtZDZY?=
 =?utf-8?B?aWxrdysrV1BGTjlaOWR4a0tNM3Q0K25BTkpkZkpTdWI2Y0dzNzJ5NFZRS0Ns?=
 =?utf-8?B?cFJwRUlvMXhjZjZvSTFnWWFibEdadFF0RmVJa1VwUnB1S2lZMUU0dFNDdjVa?=
 =?utf-8?B?OVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6569e21c-dfe7-4e5c-a858-08db26c5fdfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2023 09:00:01.3973
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gUHqD+Za1EEV6yPfibzB+b2ENTrljElarqHybjifTgZKQBU56gRoVPeQJBz446J0c/wNx1UXd+NJkD4QCu83lyAIXp8Smn+cY/0Vi1Frdro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8885
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

KyBXb2xmcmFtDQoNCj4gU3ViamVjdDogUkU6IFtQQVRDSF0gdHR5OiBzZXJpYWw6IHNoLXNjaTog
Rml4IHRyYW5zbWl0IGVuZCBpbnRlcnJ1cHQgaGFuZGxlcg0KPiANCj4gSGkgR2VlcnQsDQo+IA0K
PiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHR0eTogc2VyaWFsOiBzaC1zY2k6IEZpeCB0cmFuc21p
dCBlbmQgaW50ZXJydXB0DQo+ID4gaGFuZGxlcg0KPiA+DQo+ID4gSGkgQmlqdSwNCj4gPg0KPiA+
IE9uIEZyaSwgTWFyIDE3LCAyMDIzIGF0IDg6NTnigK9BTSBCaWp1IERhcyA8YmlqdS5kYXMuanpA
YnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIXSB0
dHk6IHNlcmlhbDogc2gtc2NpOiBGaXggdHJhbnNtaXQgZW5kDQo+ID4gPiA+IGludGVycnVwdCBo
YW5kbGVyIE9uIFRodSwgTWFyIDE2LCAyMDIzIGF0IDU6MzTigK9QTSBCaWp1IERhcw0KPiA+IDxi
aWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiA+ID4gPiBTdWJqZWN0OiBS
ZTogW1BBVENIXSB0dHk6IHNlcmlhbDogc2gtc2NpOiBGaXggdHJhbnNtaXQgZW5kDQo+ID4gPiA+
ID4gPiBpbnRlcnJ1cHQgaGFuZGxlcg0KPiA+ID4gPg0KPiA+ID4gPiA+ID4gT24gVGh1LCBNYXIg
MTYsIDIwMjMgYXQgNTowMeKAr1BNIEJpanUgRGFzDQo+ID4gPiA+ID4gPiA8YmlqdS5kYXMuanpA
YnAucmVuZXNhcy5jb20+DQo+ID4gPiA+IHdyb3RlOg0KPiA+ID4gPiA+ID4gPiBUaGUgUlogU0NJ
LyBSWi9BMSBTQ0lGIGhhcyBvbmx5IDQgaW50ZXJydXB0cy4gVGhlIGZvdXJ0aA0KPiA+ID4gPiA+
ID4gPiBpbnRlcnJ1cHQgaXMgdHJhbnNtaXQgZW5kIGludGVycnVwdCwgc28gc2h1ZmZsZSB0aGUN
Cj4gPiA+ID4gPiA+ID4gaW50ZXJydXB0cyB0byBmaXggdGhlIHRyYW5zbWl0IGVuZCBpbnRlcnJ1
cHQgaGFuZGxlciBmb3IgdGhlc2UNCj4gSVBzLg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4g
PiBGaXhlczogMzkyZmI4ZGY1MjhiICgic2VyaWFsOiBzaC1zY2k6IFVzZQ0KPiA+ID4gPiA+ID4g
PiBwbGF0Zm9ybV9nZXRfaXJxX29wdGlvbmFsKCkgZm9yIG9wdGlvbmFsIGludGVycnVwdHMiKQ0K
PiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IEkgZG9uJ3QgdGhpbmsgdGhhdCdzIHRoZSByaWdodCBi
YWQgY29tbWl0Lg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gT0suIEkgd2lsbCB1c2UgYmVsb3cgY29t
bWl0IGFzIGZpeGVzIG9uZSwgdGhhdCBpcyB0aGUgY29tbWl0DQo+ID4gPiA+ID4gd2hpY2ggYWRk
ZWQgUlovQTEgU0NJRiB3aXRoIDQgaW50ZXJydXB0cy4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IGNv
bW1pdCA4YjBiYmQ5NTYyMjhhZTg3ICgic2VyaWFsOiBzaC1zY2k6IEFkZCBzdXBwb3J0IGZvcg0K
PiA+ID4gPiA+IFI3UzkyMTAiKQ0KPiA+ID4gPg0KPiA+ID4gPiBUaGF0IG9uZSBhZGRlZCBzdXBw
b3J0IGZvciBSWi9BMiwgYW5kIGlzIGFsc28gbm90IHRoZSBiYWQgY29tbWl0Pw0KPiA+ID4NCj4g
PiA+IE9LIHdpbGwgdXNlIGJlbG93IG9uZSwNCj4gPiA+DQo+ID4gPiBGaXhlczogNGM4NGMxYjNh
Y2NhICgiQVJNOiBzaG1vYmlsZTogcjdzNzIxMDA6IGFkZCBzY2lmIG5vZGVzIHRvDQo+ID4gPiBk
dHNpIikNCj4gPg0KPiA+IFRoaXMgcmVhbGx5IHN0YXJ0cyB0byBsb29rIGxpa2UgYSBndWVzc2lu
ZyBnYW1lLi4uIEJlZXAgOy0pDQo+IA0KPiBBbHJlYWR5IHRoZXJlIGlzIGEgZ2VuZXJpYyBjb21w
YXRpYmxlIGluIGRyaXZlciwgd2hlcmUgd2Ugc3RhcnRlZA0KPiBpbnRyb2R1Y2luZyBSWi9BMSBT
b0MgV2l0aCA0IGludGVycnVwdHMuIFNvIGFkZGl0aW9uIG9mIHRoaXMgU29DIGhhcyB0aGlzDQo+
IGlzc3VlLiBBbSBJIG1pc3NpbmcgYW55dGhpbmcgaGVyZT8NCg0KV29sZnJhbSwgQ2FuIHlvdSBw
bGVhc2UgY29uZmlybSB0cmFuc21pdCBlbmQgaW50ZXJydXB0IGhhbmRsZXIgd29ya2VkIGZvciB5
b3UNCndpdGggdGhlIGNvbW1pdCA0Yzg0YzFiM2FjY2EgKCJBUk06IHNobW9iaWxlOiByN3M3MjEw
MDogYWRkIHNjaWYgbm9kZXMgdG8gZHRzaSIpDQoNCkNoZWVycywNCkJpanUNCg==
