Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D34E75B6A60
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Sep 2022 11:11:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231578AbiIMJLR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Sep 2022 05:11:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231585AbiIMJLQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Sep 2022 05:11:16 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2092.outbound.protection.outlook.com [40.107.114.92])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C00325A3FE;
        Tue, 13 Sep 2022 02:11:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LxONPzw1YmeZ9K0SID7nXq/j66mCcF94G+N3zzSSqsjkfXJNwjivmwj8hVhBKRFomjXjmc6FCPYU3JdNkunS1puXCWdRrCNMXFyf0c2tf6qkc22LgQ7IaUjhlJ8ZZwaZnDMlngvi7Y1d3WzC3wkt/P6lunpEEfQn+/oL+Y4//FsR7JPa95CF7L7mJp5LqqdorjkfsJfxfwG5frYENInTeqJDg8Kx6ad2U1WJmvdQxxjmqJz7GvGRTxn0e8x5VJTL4j0XX174wUwlVnDNeZNQwpB3bEMhNA6tODqxTlIGBpO+gMiMVvLuYl9t3uogzQd0AaqdKMJXaYOxwexRjASBNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9M2AFyqUCQ44yiQdPQkXCDL92pKvDutI//Q6PAXXTBM=;
 b=JJUf/WjILMy81uThELIyPRzsfJViJePsG5q1QMWgEMMdfrYCU5u3jr7qm989BjUcAHCFkXXPm6r5UeGdMJYY0rcn3luAl5RKxpWvI6MnqHEiY+GnswUUXRuE5If/uW9xAP6V2IsH7bOWGOM0SmzKC9QaW8TKPdhH8zLdHe8n5Y6p0UA69E9iYk1MhoedxKlc20nYLON9BmDsq4Fb9iM/heXmTvPAI8JmG9SdWnAggP3QSiBjjdT74MYXSgPwVBCWxHdlBL9gtvecDbqSiERA/7WRgoYAPkOSrlJLFoOSd1U5lsppAHCIzBzVfrkYumeSKWQEfxDX/7BpdUV/5cjJwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9M2AFyqUCQ44yiQdPQkXCDL92pKvDutI//Q6PAXXTBM=;
 b=M1o+1IATVsRpwKOAlUAMvDU1/i9i5EErYQGgZIL3jEzLheH+pbIl+GQlYPQhSO4SY7M7uE4+5NbbdJQI2YAw8Ge1wL3sJM3eBV0xdqOR7ILU/qobOiOZlXBA022yB0fTtqsXVZk5kCjTZCuIoHgMRWrL+gaztNqXvK6p9Sqnb/k=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB9420.jpnprd01.prod.outlook.com (2603:1096:400:1a4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Tue, 13 Sep
 2022 09:11:10 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c502:8f9f:ec5e:8e3f]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c502:8f9f:ec5e:8e3f%3]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 09:11:10 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH] clk: renesas: r9a07g044: Fix 533MHz PLL2/3 clock
 multiplier and divider values
Thread-Topic: [PATCH] clk: renesas: r9a07g044: Fix 533MHz PLL2/3 clock
 multiplier and divider values
Thread-Index: AQHYx00SZzRJbu1f4Een84uOmb7F263dDxQAgAABfCA=
Date:   Tue, 13 Sep 2022 09:11:09 +0000
Message-ID: <OS0PR01MB5922F5F3302A3AF05820229186479@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220913084434.1191619-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdX9PCdTFsY_H6dqPVFs82HGqWzydhBaFNmL3_YR6vvWzQ@mail.gmail.com>
In-Reply-To: <CAMuHMdX9PCdTFsY_H6dqPVFs82HGqWzydhBaFNmL3_YR6vvWzQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB9420:EE_
x-ms-office365-filtering-correlation-id: ff406d4b-17ef-4130-4f46-08da9567e60b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NSTlTfarRLfeAwEOOpK8R2GTdOtWysaYUnId1E1mhikdXWkQEbpY7DIKRJTHe3s9BwCIcnmVqbr+yGx1KW6mp+vE7Ax2nw2pJ/PDn1ZxrFnwzT0DsOZCcpv2NM83uKdDVqLof/0yysZjRJZSP+1BUTt8GpVl+aR8NAmBzwQ6nuQxOyoFK1Wva7Ejx2tQ/8V93JoPzHC4OVODnG7+dbFClb4l5Wxgf282EbMZHSm6YujjWEYBEt5R3EN56bb8T+ofPyUX+r5z3Cgjrlzo6A0WHZNI2oi0jDjR7V5L8sXV7Eghei1OtPx1VcAcsEZ+/XEeSWzw5e+A5gcrYWt0t4MEaeTcExiqd4EiHzmpr8uOgje8mi2NIsB6QRtw28tzXJlyBYOApJeDGEQmqeyoPYrmY7gEtkr9kGWPMVSDXedQXWqHDSk/+4a3COcVomx2yfJVTg1B4XwcrM+tVzbtL5h4JtVGlXr5G3XoAmpqy4TYrc1K4BZUbbs5xCB6WtnGPngPL8mlvAy9njAMimhDj053QU7eBYRRRx8dIN4VZdp8fSHehW+a9I4LK3eYPy026Zj2ycmm62jHAH29CU5UCon32ljEVaRg8c8CkYZFpkB5kBBVRNe1wdCbMN6xMU6s4mtcsqwLdk3b3BKeGJxsEqMXUOlFFIKPhqi6J/mUliIkoch/WveYGaPPl43+NCHh9UgAwP7ZOJD/XrXR8Tq89OGYTNXO42EtHLgnq7P5/5cOQlen9kPOZ4cb90Kajw23XT749b+G1FpIDQip87k6yN0MUw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(366004)(136003)(39860400002)(396003)(451199015)(9686003)(5660300002)(122000001)(6506007)(26005)(6916009)(38070700005)(38100700002)(41300700001)(186003)(478600001)(86362001)(8936002)(55016003)(54906003)(107886003)(64756008)(316002)(7696005)(83380400001)(66476007)(71200400001)(2906002)(53546011)(66946007)(66556008)(8676002)(76116006)(4326008)(33656002)(66446008)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dmszdnZrdEdWMUVFTThiYkw5d04rMEtZMHRySEV4bDAwb1o2SERrYXZacVVG?=
 =?utf-8?B?cTBqNTdacDVIWUxOaXlqSnBSL05taGNhdXQ5aDRVbDNVMnBBY2VlSjNCTXdq?=
 =?utf-8?B?SVdoMGpjUlFPZ245R1Yxa1F5ckxLUDhKTkdhcWRqWGpSN3Jnc2VyNWZXVkQv?=
 =?utf-8?B?KzUxZjVGYndUNHEvTWpRUFE2bHpMbnExZnIvc0lGaEFGL2Q1YXdvd0w1bEh3?=
 =?utf-8?B?Vy9TUTNPcEd1dkxMcHZKbkhrVVBFQ3dDaCs0ZmtZUGtGUkxsemYxTDhRREQ4?=
 =?utf-8?B?TUsrMVdpam9ZU0RjTUdRTHNpc2p5NmRwR0ZIaU9FK0NQOTIvVWFrV0lYcWVv?=
 =?utf-8?B?RmQxSkhlVkJPckxiMjU0ZHJjQUdpNUFhcUFlRmZ6RXdSU3pIUzJLZVhCNzdm?=
 =?utf-8?B?bDdYQzVJUUdWbVNySkJHUi84N2dTRThOT052SHdOMUpXeExCQ3FISVdHL1p3?=
 =?utf-8?B?WDNnM1dxQ0FhNUUxRDFWeHpQa0hwUHBWcmZ1dU1SY3h5UFcxbnpZc0JnOG1h?=
 =?utf-8?B?cUF3eEJGZElyTEt3c0xHUWNZcndiYnZMTUVkRFgrUkc5UklpV0p6R3g4ejZt?=
 =?utf-8?B?TlRQZGpKM3JySlV1VUo3a00wbkV4SWlKUXhWSE9kcC93UjMxOXZNd1pVQW9K?=
 =?utf-8?B?dkNmOTgzcEZJOGkvL3Y5bEpZVVF1dFJ4N1ZYUk8rYzNsT1loUlN1c1ZKUlRQ?=
 =?utf-8?B?Q0tNaHkyZWhHV05MVmJOWUs2dGZsTTNOV3NWdkowbmdEZXpuU1I5NUFMU2pQ?=
 =?utf-8?B?YzFEeCtUYmIrL0hnelZFelEyUGNPeEVWTXlHcHg5TkZxTXhwa01WVkJjRVZF?=
 =?utf-8?B?b1BGUGhkYStsNDYxelJzN2RmQytmNHBmOERYcGxKOFdFSHNjV3lTTE00dmRC?=
 =?utf-8?B?K3NkemR0bWJYN0NaVGs0NG8xZFUvL2c0Vk5LemIrdENjQUI5S2J3MDlvZmJW?=
 =?utf-8?B?VWZJd3ZTcEpMb0NVdDgzZWN6WlM3YnVsWEpJZGUyQVk1cHdnWDRNVkdxSjN4?=
 =?utf-8?B?d3pFYjlhTFdxalZ1VEdMV1hTWHRKUDVocEZlRjFLOUdYK25iSUQxb1g2dnBl?=
 =?utf-8?B?YS9jLzh3a1QvK2t3SDJLTkZJdmJqdDBkdWpYSnlCc21nR0dIUzNNTGhyQ3M2?=
 =?utf-8?B?aTBJSVg2ay96Zk5mTE9TaWhHaS9NY2dSY3E3R25xN0JOenlEbjBNTUNPSm9o?=
 =?utf-8?B?NGFFWjZkVS85WXZaeU9hMnVXVHI4TTNRZ0dLMGVLTENpakxFR0VlSWdxamc4?=
 =?utf-8?B?Yk0rcW1jcFV4VlhaRGw2YU9qc0xhL1A5ckcrN1NiUEZLZUQxNTVJdXZLcFJk?=
 =?utf-8?B?UUUxeDh4eHZ6bEowZkNYV0RNMlZ1cHRLTDVQQWJEdDZtWlJ6MFQ5N01lS3RC?=
 =?utf-8?B?dGpMVHBWVXR2YkwwMDk0Y0ZMYkhYbU04enZMU29WWk4rSWZ2b1FEWCthQkc2?=
 =?utf-8?B?RWFzMlBFc0NMbU9xODdBMjZTZnFTUGtpVjZiaDJPaU8wdDdVMkhGc2RrSFIv?=
 =?utf-8?B?ak9jRHZrS0MwSnRYMHh1WUpPeDFOYjJFUHpMcFBxNk50M1Y2SjgxWnM5T1JR?=
 =?utf-8?B?TEtBR0hYUkgyZFBDdW5qd21BdXl5bFA1QjYxTHl4Ui9wb0VLYnovMU1CbUJi?=
 =?utf-8?B?OXVKRlZIZ1YrdEJ4VDVTckhTWTYvVitLdWYrNW9sdXNOK1hTMmxTWUFrYlpv?=
 =?utf-8?B?clBRS2oyTU9RdjNKdkpHeGpUZ21taHBkbVN4UFVTb0xSeGNPNDFwYVd1cStw?=
 =?utf-8?B?ZUNCZkV3MDNNcWoyMFZlMTBJYSt5VXkrSGlVOTA3T1BXZWtvekZ6RVczN0ww?=
 =?utf-8?B?WU5WMEYyMGVrWkVhd3dXSTNQQUNqdDhMMmk1RkV2RHdFc2hKRjJoT1Rhc1hJ?=
 =?utf-8?B?MDhEbjB6SXlHdytBRGoyQ0pMZDJpdUM5c25SMEgwNkZLS1NnRWFuRWxoOVd6?=
 =?utf-8?B?b09TNkxJMk83SDRwaGVDejROOVVqOEhNakNRNG5JLzNCK3A5RHU4akdhUnR4?=
 =?utf-8?B?enJiVkRFbDhzZzlJWHN0SUlFT2dJZjVRelVadWd1Um5ZMHhWZ1ZGdVo5VllP?=
 =?utf-8?B?RlZaOEIwNzFXQmR4eXBBR0lsVzJ6TDdpVFB3UFdqZDJGL2REV2ZUQTc0cVJo?=
 =?utf-8?Q?qxEKroypA/cp7k8iQdkOb0310?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff406d4b-17ef-4130-4f46-08da9567e60b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2022 09:11:09.9861
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VaAbU7ee4Cj1Tfn3smwFmaQNZmSEP03GSLa8AADSTt1d8ypkilt+hWc5DT1/G7B78Crsgf7Usc/O0Aof+/xHBPvG7h9eJz6sRdMgcjy1ckw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9420
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gY2xrOiByZW5lc2FzOiByOWEwN2cw
NDQ6IEZpeCA1MzNNSHogUExMMi8zIGNsb2NrDQo+IG11bHRpcGxpZXIgYW5kIGRpdmlkZXIgdmFs
dWVzDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4g
T24gVHVlLCBTZXAgMTMsIDIwMjIgYXQgOTo0NCBBTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAu
cmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+IEFzIHBlciB0aGUgSFcgbWFudWFsIChSZXYuMS4x
MCBBcHIsIDIwMjIpIGNsb2NrIHJhdGUgZm9yIDUzM01IeiBQTEwyDQo+ID4gYW5kDQo+ID4gUExM
MyBjbG9ja3Mgc2hvdWxkIGJlIDUzMyBNSHosIGJ1dCB3aXRoIGN1cnJlbnQgbXVsdGlwbGllciBh
bmQgZGl2aWRlcg0KPiA+IHZhbHVlcyB0aGlzIHJlc3VsdGVkIHRvIDUzMy4zMzMzMzMgTUh6Lg0K
PiA+DQo+ID4gVGhpcyBwYXRjaCB1cGRhdGVzIHRoZSBtdWx0aXBsaWVyIGFuZCBkaXZpZGVyIHZh
bHVlcyBmb3IgNTMzIE1IeiBQTEwyDQo+ID4gYW5kDQo+ID4gUExMMyBjbG9ja3Mgc28gdGhhdCB3
ZSBnZXQgdGhlIGV4YWN0ICg1MzMgTUh6KSB2YWx1ZXMuDQo+IA0KPiBEb2VzIHRoaXMgbWF0dGVy
PyBJcyB0aGVyZSBhbnl0aGluZyB0aGF0IGRvZXNuJ3Qgd29yayAod2VsbCkgYmVjYXVzZSBvZg0K
PiB0aGlzPw0KDQpZZXMsIFNESEkgcGVyZm9ybWFuY2UgZ29uZSBiYWQgYXMgaXQgc2VsZWN0cyA1
MzNNaHogY2xvY2sgaW5zdGVhZCBvZiA0MDBNaHouDQpTaW1pbGFyIGNhc2UgZm9yIFJaL0cyVUws
IHdoaWNoIEkgYW0gdGVzdGluZyBpdCBub3cuDQoNClByZXZpb3VzbHk6LQ0KNTMzMzMzMzMzLT5z
cmMgY2xrMA0KNDAwMDAwMDAwLT5zcmMgY2xrMQ0KMjY2NjY2NjY2LT5zcmMgY2xrMg0KDQpOb3c6
LQ0KNTMzMDAwMDAwLT5zcmMgY2xrMA0KNDAwMDAwMDAwLT5zcmMgY2xrMQ0KMjY2NTAwMDAwLT5z
cmMgY2xrMg0KDQpJZiBJIGFtIGNvcnJlY3QsIHdpdGggd3JvbmcgdmFsdWVzLCBpdCBlbmRlZA0K
dXAgaW4gNTMzMzMzMzMyKHBhcmVudCByYXRlPSAxMzMzMzMzMzMgKjQpIGFuZCByZXF1ZXN0ZWQg
cmF0ZSA1MzMzMzMzMzMNCmFuZCBpdCBzZWxlY3RlZCBiZXN0IHJhdGUgYXMgNDAwMDAwMDAwLiAN
CiANCkNoZWVycywNCkJpanUNCg0KPiANCj4gPiBGaXhlczogMzczYmQ2ZjQ4NzU2MmUgKCJjbGs6
IHJlbmVzYXM6IHI5YTA3ZzA0NDogQWRkIFNESEkgY2xvY2sgYW5kDQo+ID4gcmVzZXQgZW50cmll
cyIpDQo+ID4gRml4ZXM6IGYyOTRhMGVhOWQxMmE2ICgiY2xrOiByZW5lc2FzOiByOWEwN2cwNDQ6
IEFkZCBjbG9jayBhbmQgcmVzZXQNCj4gPiBlbnRyaWVzIGZvciBTUEkgTXVsdGkgSS9PIEJ1cyBD
b250cm9sbGVyIikNCj4gPiBGaXhlczogMzFkNWVmMmY1NjVkMjMgKCJjbGs6IHJlbmVzYXM6IHI5
YTA3ZzA0NDogQWRkIE00IENsb2NrDQo+ID4gc3VwcG9ydCIpDQo+ID4gU2lnbmVkLW9mZi1ieTog
QmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gPiAtLS0gYS9kcml2
ZXJzL2Nsay9yZW5lc2FzL3I5YTA3ZzA0NC1jcGcuYw0KPiA+ICsrKyBiL2RyaXZlcnMvY2xrL3Jl
bmVzYXMvcjlhMDdnMDQ0LWNwZy5jDQo+ID4gQEAgLTExMywxMCArMTEzLDEwIEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3Qgew0KPiA+ICAgICAgICAgICAgICAgICBERUZfRklYRUQoIi5vc2NfZGl2MTAw
MCIsIENMS19PU0NfRElWMTAwMCwgQ0xLX0VYVEFMLA0KPiAxLCAxMDAwKSwNCj4gPiAgICAgICAg
ICAgICAgICAgREVGX1NBTVBMTCgiLnBsbDEiLCBDTEtfUExMMSwgQ0xLX0VYVEFMLA0KPiBQTEwx
NDZfQ09ORigwKSksDQo+ID4gICAgICAgICAgICAgICAgIERFRl9GSVhFRCgiLnBsbDIiLCBDTEtf
UExMMiwgQ0xLX0VYVEFMLCAyMDAsIDMpLA0KPiA+IC0gICAgICAgICAgICAgICBERUZfRklYRUQo
Ii5wbGwyXzUzMyIsIENMS19QTEwyXzUzMywgQ0xLX1BMTDIsIDEsIDMpLA0KPiA+ICsgICAgICAg
ICAgICAgICBERUZfRklYRUQoIi5wbGwyXzUzMyIsIENMS19QTEwyXzUzMywgQ0xLX1BMTDIsIDUz
MywNCj4gPiArIDE2MDApLA0KPiANCj4gSSBoaWdobHkgZG91YnQgdGhlIGFjdHVhbCBoYXJkd2Fy
ZSBpcyBub3QgdXNpbmcgYSBieS0zIGRpdmlkZXIuLi4uDQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9
cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVy
dCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdl
ZXJ0QGxpbnV4LQ0KPiBtNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3
aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuDQo+IEJ1dCB3aGVu
IEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNv
bWV0aGluZw0KPiBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
LS0gTGludXMgVG9ydmFsZHMNCg==
