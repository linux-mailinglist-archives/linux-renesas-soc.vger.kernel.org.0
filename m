Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52C804AC1DA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Feb 2022 15:49:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1441911AbiBGOq2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Feb 2022 09:46:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383126AbiBGOoH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Feb 2022 09:44:07 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2136.outbound.protection.outlook.com [40.107.113.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D7F0C0401C1;
        Mon,  7 Feb 2022 06:44:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FkCxZARNhXYfOo6zt664EfNlOHF9wIFInib/OA/0R3KmMNRV9wa53jd64ehQ/OJsGqIuwF40TAs5D9evGKwy3l+tivw9JQ8wFqG6E10GKxaqVmC3DjMGdwm7x6sk8QVfVgUAJilvPQEmsEX2bFoCDOcQIIqEhqsGOshFpvXLPP+G24AxmC3g6sKcgPwk7A9TmfBUVVPsx7U1YuOHAWDW8UH9B589GB8p0YPT1Syv+BIAntq/YKrArIy73R7BDLIGJ2TtSCnysij/UX/kJ4I2tp7Lgv8eyYa487qAtR9vSYp/SSOI7O5Z7XV3TlePsN3hOcOLzCSmnnXnQkroQoyvgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozE83fdVWnYvhjepbgMxP8u/3QkB2dwu42sJOz56Y7M=;
 b=X+kfvoFfqraVuzNaK9szMzDyk5ctjOdtQGw8Bju9GK2VsnsFUsO0D1nYycgAvVKhpXjtVNolhu0pRZJdcVVK6EhTstvkGywPIwfVOuLXKJGGj23xOYoSbMLKBgRDwFP8M73ybLldHW3Wa4i8D0cnl33S1zoQLRH22SvccQNLN8tir5nPn3ls7HZs3aWoroL7sH/ZNAQzMWrvMl+RYiGCPUMl1JaOUnr+H4mcaZuTyF0sOTFff1Sz7GJRJSnSKuAIaaWNBlM/eA8CJBRhF5TbZFBvt2viNCQkoZtxqufMFZbGuZNxzMZZbwhDkZdSUTc49tidkF7u+zG6pgCEVcPgSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozE83fdVWnYvhjepbgMxP8u/3QkB2dwu42sJOz56Y7M=;
 b=uYZNtkawd6gRLVJh7YkUR9OWXjlQNk/kj/4Ks7PCook4+QS9ab4DfcESQv0skAL2ninXMx5rcuC+kHm9hlz5Ga1i38v8W0fP1A1NMPuo3GUondusHPSdcGENrHdAvkX2P1BehQfmc/C0+n+fynKaWX/riCWR6Nlwy5CM49AUB2s=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB7745.jpnprd01.prod.outlook.com (2603:1096:604:1b1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Mon, 7 Feb
 2022 14:44:04 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619%8]) with mapi id 15.20.4951.019; Mon, 7 Feb 2022
 14:44:04 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v5] clk: renesas: rzg2l-cpg: Add support for RZ/V2L SoC
Thread-Topic: [PATCH v5] clk: renesas: rzg2l-cpg: Add support for RZ/V2L SoC
Thread-Index: AQHYGmv+73RtIn9kiUW0cM1i3/rU4ayIJ8uAgAACFfCAAAJ9gIAAAIrg
Date:   Mon, 7 Feb 2022 14:44:03 +0000
Message-ID: <OS0PR01MB5922B4BBCB9863C3AA687BB5862C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220205084006.7142-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdXqzQOatPXxEPfuSRyzJ81ADX0EhR5xng7XwpoCAh325g@mail.gmail.com>
 <OS0PR01MB59229CBA63FBDFBC8758A762862C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdVH9LMhVxfBZtTK7eMBFS8w4VLm28dqM02uYw+YxD=DLg@mail.gmail.com>
In-Reply-To: <CAMuHMdVH9LMhVxfBZtTK7eMBFS8w4VLm28dqM02uYw+YxD=DLg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e266d28d-b994-472f-27ed-08d9ea484978
x-ms-traffictypediagnostic: OSZPR01MB7745:EE_
x-microsoft-antispam-prvs: <OSZPR01MB77457A598D1683A7A2480FDD862C9@OSZPR01MB7745.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CLUK48QSlGIYcelXiqYYtMz/n5Qf0BzOLV2MeBljXaXqCEmBzwy13zLqfW1Kq+YFyjGIeLnCbY2tZslf7rS7AO3CgJAqAo0y3ps5SCvtSjW4YuMcXzkECGljf0wGHJ3FWXLVwwZlvwrLOv4V3U2FhJtCSaVl+FBwF19C/ZK9wU6k1X+Z0HE3542SQU5EUC9cgnbFOdWcPX8WvWD8OK3wfkqsFKbucbMddBJpDyblD5hVlW2lRAXk58NJl3aaBQpmo5myjpU8tFaK0XV8GhN0ijSbIAMcjUI7buy8xw9nc8hpeiHeuO7/Kk1eWFJutBRDvCZbNECDVE44LmKshRWwTroaTKRF5yQgzbza/8XUmFRUo8BTGbefx9ZdaVOMPpj02GjlCN7tXcpfoSkihnMbcLn3/iSMY1YrCCJb9gl6wwVHgbQkPnkFU8qnsCQQUvmGzfWZdHXcdpYhCIp6tx8vAc8QC95lYpZUkkmBCXGBzWcDeKqiOWzLE0ms7AKYeMFbWlTnXGicd6BZYkcfo3Au4bLED+Kk4cF0E85MImPJDVLRridw0sflVwM4estaDqSNrC6E4ASrwyzezXWZf1oiB7CpXwuJk5hQIS3Lu7t/53itNykFDdWdDcm1iS1HC4+HJD92fhiELUA70eoOFuuX8DUQFszi1ddliyJIiBpAeXX3pe8UeRoa14+ZXu1xC1RuTSJ0QR5uW6PQiKfk0NEuvA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(55016003)(107886003)(122000001)(38070700005)(186003)(26005)(508600001)(54906003)(6916009)(52536014)(316002)(38100700002)(71200400001)(66476007)(53546011)(66446008)(83380400001)(6506007)(7696005)(64756008)(66556008)(86362001)(9686003)(5660300002)(33656002)(4326008)(66946007)(8936002)(76116006)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Yk1kNGg1T0Z0QTlHcUt4N0FOaUpqc0NUTzdJTmRVNkY4Mm1tUXZ5T2ZBQWFL?=
 =?utf-8?B?eVpadWlBd0VjYnVDMkRnY0NUUC9aYTVSSnM3bk9tMGNGWGM5MjJucU9lSy81?=
 =?utf-8?B?a1Rack5FUTVzclVwOXFFU0VGWVBndW5SbDF0cnZyekJrcGx0UkZRNVVlQktU?=
 =?utf-8?B?a1l2dURWOVhJNER3TEVLTVZ0eUZmZ3lDK3IxTnQ2cnU4YW1kOTNGY21vNlpY?=
 =?utf-8?B?QkRtQkRxeGxPMXdJZkJCVlpBU1UxZ3VMNnFSYzdITlZCZ1JiWUZuUUtkSlRn?=
 =?utf-8?B?clYxZXVWbWsyQ004ZTE2MVBOLzJQQUZONktCSy8ySURvcFpVM0Z1Szh1TGZp?=
 =?utf-8?B?eGhKMWRaajM5bURXaUxWTEM5cHN4ZnZZQjU1MmxXREM0RG14TThldkhoRnk3?=
 =?utf-8?B?cDVDcjRPL24rUVNyVldzd1crRnFCUld0YTg5NGhEaUR0b2svSmovMnJOTktr?=
 =?utf-8?B?YlFvbURTODl6MzdYcVJnRWZVUWUwNDhidUxXTGdMSWo3dVRzQXlMVEt6d3V3?=
 =?utf-8?B?d3lYSmY5QzdPbnBkaVJvSHFLRzdoT3ZTQkJ6MFZ0a2Rmc3pwcm42MDN0eWIx?=
 =?utf-8?B?K0xrampsWW1WNnpYTTEyMVk0UHRvKzgySTlBdm5UT25xVmh0OXV4QkdmVjRF?=
 =?utf-8?B?ek45TEx5aitBL1hFejJ0RkJjVjd4SWJtYWc2VVRRWm42cWlFbU9zdVZlU2p6?=
 =?utf-8?B?MlI2b3E4MUtWYndZZmxVSkM0YmFKWGY5UllEMC85TTBsL2tleUJwb1gwb2xV?=
 =?utf-8?B?dDVnQkJDSU0wb1B5NHlqQUJWVU14L213L2NRcWhaRFhVWkZ6RjBQQ0ZaQWRr?=
 =?utf-8?B?QVY3bkltZDBvT1ZIQ2kxUEp4VlN0YWhITTVYdWh1WDNwMEhKVk5EZHJrb3hQ?=
 =?utf-8?B?Qjh0TWlOOWpMR3ZHWVYvRGc4bStBd0J4ZzlJSzlUUDJTYSs3L2hxbE5JSSth?=
 =?utf-8?B?ditibkpQcGdLTVhpWkJFL1ZvdlJvMWhqbkVvUWtrNWpFYjJ0cEtUY3F5OU5H?=
 =?utf-8?B?M1NqRWxqdC9kYlNTVUdTTHdIRDV0Sm9vbUdhcm1ETzhTL3NyRWZOYXBubnhy?=
 =?utf-8?B?YU5DUU9abktBMmlPVUpxVWM5UXJoL1lNRFRYdDBUTk14bmQvaGxZdmQzOU13?=
 =?utf-8?B?K1kvOVFLeW4vZzdYeUlCMDRYTEw5QkJXbmErclluazZBcDZGOUVmMHM4V24v?=
 =?utf-8?B?SHYyV0tBRkRUL1BmRnY2WlkrUjRqZVJWN3A5M3BXdGgvTW5HTVArRFNDVEM5?=
 =?utf-8?B?U1Q2akZFVy9jVkh5NHBhSUZUMDZjSG5tSktMWThmWmx2Z3h6aExTWHBSUlpr?=
 =?utf-8?B?eDlQeVZDaEtPcHJoMXJEYWpDMGRYc2x0b1lJZVNBVUZzdmFKcCt6RStIUE1y?=
 =?utf-8?B?aTN2eTJ4TjcxSzFnNXZpUkZXdkphRE5ubm1yR3N1UDF3a0wyMnJkejI3Y3p6?=
 =?utf-8?B?ZTNkcXc4SE1rR0s3OHNXcy85aklwaVR6UjFrWWpNb1dzY2txSWl3dUdhSWta?=
 =?utf-8?B?N2lFcGhCTGg0VExqdXQ1eW01dDFTSnlTUGZwaVJXRmZjRWhZZmkwcDJUNGZx?=
 =?utf-8?B?WmsxNG80eXJtR3paN1lWZlo5dEc4dDcvM2gySS9oWFhXbm8zY2w3Q0UwQXdK?=
 =?utf-8?B?QVdKOE1EellrZVU5SjlvZ3p6dGxMMDJ5UFFaN1ovRXE4dWVaK0VyUERMRlFF?=
 =?utf-8?B?STY0R0JBZFJURmlwdksxa1FoRHdycEp1Y0FzWUhkQ3Z0Ymh2OVI2SFh3MVgr?=
 =?utf-8?B?NWZPNXRKNmx2RVVTWHNtc2N3MzRCdllJLzkwSHJrMkY3NDFvS1VKQ2RidWRa?=
 =?utf-8?B?cXcyUjg2Uzh4cWlKR1FOekdvR05xRllrYkFqZDFobSsrUlB4MzJHZmVOdVAw?=
 =?utf-8?B?MVp2UHJJR0pLcElzZWh5Nk0xT3RYMUdnUW1pSWF3eXRVTlNPZjZ1MUxzV3BM?=
 =?utf-8?B?c0FzMzRUdmk3Tk5YNWRSMkNqMHk3WlF2RytaWllSV3p3WTRRdXByN2pWNFFy?=
 =?utf-8?B?c0t4c2RhTVJTSkk4NG41Qm1yZlhEVGJkVXl4QXhjQnc1NUUyZjQ3OXh3aW1I?=
 =?utf-8?B?NHFRWGI1NWtmNWZOaTlITGc5NDNueklpTjBwajlUaElESUNIbUNYVGdySjNK?=
 =?utf-8?B?MlByQVNSMWt3aEMxRlVxNXRWYTh3WHhzaCt4bG1jdUVybkEwOEZzZjl5eVRE?=
 =?utf-8?B?NFVCTnZiWGkxTTBqR01EcXRFOUkvdVRJRkxqYUN1Y3lHS2hQeUxHeDh0dDNQ?=
 =?utf-8?B?bWZnODlWcTFCY3ZGaVl3d0ZHMEdBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e266d28d-b994-472f-27ed-08d9ea484978
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 14:44:04.0011
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k/KcEGwObnEIIrVgtfC12Oh/lcnngoGEMJVIccnv9CuWuUAEGbqpX9djdvNfxAYeuDRoW+o8iIjQ/ssaQE33dR+Uo/8pxSh9Ou01Ht4//2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7745
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NV0gY2xrOiByZW5lc2FzOiByemcy
bC1jcGc6IEFkZCBzdXBwb3J0IGZvciBSWi9WMkwNCj4gU29DDQo+IA0KPiBIaSBCaWp1LA0KPiAN
Cj4gT24gTW9uLCBGZWIgNywgMjAyMiBhdCAzOjM1IFBNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBi
cC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1XSBj
bGs6IHJlbmVzYXM6IHJ6ZzJsLWNwZzogQWRkIHN1cHBvcnQgZm9yDQo+ID4gPiBSWi9WMkwgU29D
IE9uIFNhdCwgRmViIDUsIDIwMjIgYXQgOTo0MCBBTSBCaWp1IERhcw0KPiA+ID4gPGJpanUuZGFz
Lmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gd3JvdGU6DQo+ID4gPiA+IFRoZSBjbG9jayBzdHJ1
Y3R1cmUgZm9yIFJaL1YyTCBpcyBhbG1vc3QgaWRlbnRpY2FsIHRvIFJaL0cyTCBTb0MuDQo+ID4g
PiA+IFRoZSBvbmx5IGRpZmZlcmVuY2UgYmVpbmcgUlovVjJMIGhhcyBhbiBhZGRpdGlvbmFsIHJl
Z2lzdGVycyB0bw0KPiA+ID4gPiBjb250cm9sIGNsb2NrIGFuZCByZXNldCBmb3IgdGhlIERSUC1B
SSBibG9jay4NCj4gPiA+ID4NCj4gPiA+ID4gVGhpcyBwYXRjaCByZXVzZXMgcjlhMDdnMDQ0LWNw
Zy5jLCBhcyB0aGUgY29tbW9uIGNsb2NrIElEUyBhbmQNCj4gPiA+ID4gcmVzdCBJRFMgYXJlIHNh
bWUgYmV0d2VlbiBSWi9HMkwgYW5kIFJaL1YyTCBhbmQgYWRkaW5nIGEgc2VwYXJhdGUNCj4gPiA+
ID4gcjlhMDdnMDU0X2NwZ19pbmZvIHRvIHRha2UgY2FyZSBvZiBEUlAtQUkgY2xvY2tzL3Jlc2V0
cy4NCj4gPiA+ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6
QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMYWQgUHJhYmhha2FyDQo+
ID4gPiA+IDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiA+
ID4gPiAtLS0gYS9kcml2ZXJzL2Nsay9yZW5lc2FzL3I5YTA3ZzA0NC1jcGcuYw0KPiA+ID4gPiAr
KysgYi9kcml2ZXJzL2Nsay9yZW5lc2FzL3I5YTA3ZzA0NC1jcGcuYw0KPiANCj4gPiA+ID4gQEAg
LTgwLDI1MiArODEsMjg1IEBAIHN0YXRpYyBjb25zdCBjaGFyICogY29uc3Qgc2VsX3BsbDZfMltd
ICAgID0gew0KPiA+ID4gIi5wbGw2XzI1MCIsICIucGxsNV8yNTAiIH07DQo+ID4gPiA+ICBzdGF0
aWMgY29uc3QgY2hhciAqIGNvbnN0IHNlbF9zaGRpW10gPSB7ICIuY2xrXzUzMyIsICIuY2xrXzQw
MCIsDQo+ID4gPiA+ICIuY2xrXzI2NiIgfTsgIHN0YXRpYyBjb25zdCBjaGFyICogY29uc3Qgc2Vs
X2dwdTJbXSA9IHsgIi5wbGw2IiwNCj4gPiA+ID4gIi5wbGwzX2RpdjJfMiIgfTsNCj4gPiA+ID4N
Cj4gPiA+ID4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgY3BnX2NvcmVfY2xrIHI5YTA3ZzA0NF9jb3Jl
X2Nsa3NbXSBfX2luaXRjb25zdA0KPiA9IHsNCj4gPiA+ID4gLSAgICAgICAvKiBFeHRlcm5hbCBD
bG9jayBJbnB1dHMgKi8NCj4gPiA+ID4gLSAgICAgICBERUZfSU5QVVQoImV4dGFsIiwgQ0xLX0VY
VEFMKSwNCj4gPiA+ID4gK3N0YXRpYyBzdHJ1Y3Qgew0KPiA+ID4gPiArICAgICAgIGNvbnN0IHN0
cnVjdCBjcGdfY29yZV9jbGsgY29tbW9uWzQ0XTsgI2lmZGVmDQo+ID4gPiA+ICtDT05GSUdfQ0xL
X1I5QTA3RzA1NA0KPiA+ID4gPiArICAgICAgIGNvbnN0IHN0cnVjdCBjcGdfY29yZV9jbGsgZHJw
WzBdOyAjZW5kaWYgfSBjb25zdCBjb3JlX2Nsa3MNCj4gPiA+ID4gK19faW5pdGNvbnN0ID0gew0K
PiA+ID4NCj4gPiA+IEhhdmluZyBhIHNpbmdsZSAiY29uc3QiIGJldHdlZW4gInN0YXRpYyIgYW5k
ICJzdHJ1Y3QiIGlzIHN1ZmZpY2llbnQuDQo+ID4NCj4gPiBJIGdvdCBhIGNoZWNrIHBhdGNoIGVy
cm9yICJFUlJPUjogVXNlIG9mIGNvbnN0IGluaXQgZGVmaW5pdGlvbiBtdXN0IHVzZQ0KPiBfX2lu
aXRjb25zdCINCj4gPiBXaGljaCBpcyBmaXhlZCBieSAiY29uc3QgY29yZV9jbGtzIF9faW5pdGNv
bnN0Ii4gTG9va3MgbGlrZSBjaGVja3BhdGNoDQo+IG5lZWRzIHRoaXMgaW4gb25lIGxpbmUuDQo+
IA0KPiBDaGVja3BhdGNoIGlzIG5vdCBhIGZ1bGwgQyBzb3VyY2UgcGFyc2VyLCBhbmQgaXMgY29u
ZnVzZWQgYnkgdGhlDQo+ICNpZmRlZi8jZW5kaWYgYmxvY2ssIGFuZCBieSB0aGUgY29tYmluYXRp
b24gb2Ygc3RydWN0IGRlZmluaXRpb24gYW5kDQo+IGRlY2xhcmF0aW9uLg0KDQpPay4gR29vZCB0
byBrbm93IHRoYXQuDQoNCkNoZWVycywNCkJpanUNCg==
