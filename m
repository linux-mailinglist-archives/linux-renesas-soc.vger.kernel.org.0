Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C94A24F05F7
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Apr 2022 21:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233633AbiDBT43 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 2 Apr 2022 15:56:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230064AbiDBT42 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 2 Apr 2022 15:56:28 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2104.outbound.protection.outlook.com [40.107.114.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BED9DE09A1;
        Sat,  2 Apr 2022 12:54:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J4CKrK9UrVdFru3T8u+oMG1FICqfXZIDqCn63NJlxBd8OmNcuI0YbhpPDXHeO7jnI4kQMMkWxoz3HjDWV7StQWEdEG+8J6dOKaeOg17MAMnVE/+ufCSBoRtUYpoGatwXfZPwPaKTyxgeKQMZQUzMqx7kjQHbB03IzpTxg0mNuRfIN2FkvvXiRfv6lr6csT9it50vJNMmFCFK1Cpc7uWzn1vX2rxz6Wf6f9GtES9ARdADU9/HZ7Z/7pJkVYRCFLfit5S7KLOtJK20nwCK43lCrH7KdDErI+dHhg1SwsCs9JjZsaJSzy22umg8opfdMS4VYWZFNawe6ewv+joU+7lLug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GzFuB5OTaPoh+ctYfZRR5uWdL9/8140ZBrQSwDTcXl8=;
 b=gBG1b/sqPb+UBMOEAkb/oxgR66/vFbKPueWP2q0T9MA1Mu8DWL6iPHjtnHbC7c4lsRNMAmqgUDKCtJCKm7/y1R+sEkoBpGEDpZBaGzWnI1Sz+CG5kpjoLVPJvFqgpz3eBN3V/uP11/G76CzsuNC85MQgsTXlcKk7lnRetMt/xuvJj1lNP/aQH/mDn5CSQG+2C4xX60pKGLQJnLHFdfNXMjs7V6EA1pV1smQDmLauMpb4SELh7LJ/8QRbDS1l5UBbcgZ167QjcfZtNvUqtG66MJg3TbtBkJFXDhXKxseCZZB8pbUiZqnC3dw4rrMIXQGJ70UZPrVX0CnZPXtoYZAb9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GzFuB5OTaPoh+ctYfZRR5uWdL9/8140ZBrQSwDTcXl8=;
 b=LEM6y1K/kkNEZze8OO4PCjrfwOIEvxqvlvCNd1YikthtElC6ZBo8iaKqZ4+4l3MW0RxC8f/nAKE4Tcy3PUFPRj9Zc5ciTTvmFTCVBSeSjSZzqVIllL1uhVZM9kam9MEDCl2ouXjdTFzhwStfFUgwLaXvY2ZoFe8VJxd71ZAXpa0=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB6019.jpnprd01.prod.outlook.com (2603:1096:604:c9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.30; Sat, 2 Apr
 2022 19:54:32 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::7ccd:4eb0:e2ae:fca8]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::7ccd:4eb0:e2ae:fca8%3]) with mapi id 15.20.5123.030; Sat, 2 Apr 2022
 19:54:32 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v4 1/5] dt-bindings: arm: renesas: Document Renesas
 RZ/G2UL SMARC EVK
Thread-Topic: [PATCH v4 1/5] dt-bindings: arm: renesas: Document Renesas
 RZ/G2UL SMARC EVK
Thread-Index: AQHYRmPV/EWVE3M8n0+qBjpsuXfV0azc0uuAgAAmAPCAAAeYAIAACFpw
Date:   Sat, 2 Apr 2022 19:54:32 +0000
Message-ID: <OS0PR01MB5922C1100BCF87341534FC6E86E39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220402073234.24625-1-biju.das.jz@bp.renesas.com>
 <cf7728fd-b5c8-cd3d-6074-d27f38f86545@linaro.org>
 <OS0PR01MB5922B49ED5DADA5DD3DDA60786E39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <d6989ea9-9e84-0022-aff0-c75b0e3203e2@linaro.org>
In-Reply-To: <d6989ea9-9e84-0022-aff0-c75b0e3203e2@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 09783592-bfb3-47a9-f5a2-08da14e29b50
x-ms-traffictypediagnostic: OS0PR01MB6019:EE_
x-microsoft-antispam-prvs: <OS0PR01MB601976202431ECF2C760E1A586E39@OS0PR01MB6019.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mw4iKSifZbungSs4k4tw4atFiOoe+j16LxG7z294LiMmpl57pp27NSeaczOE6pEClShikkopl/ifRLOBWuGDFbv35DzsIb98h+EdesoV05Zz0VafcByMf0k98hFuh/tJAKIUkBvOzg/1Ay1i/jaNvRRQMbB22rRV24HFodWaUvUV9fXshXYDX8bJFiXcFhNM62T/qQPLy7OQlNHi3u/fkckUdOwMaoKcxJjc7oBQucO9oaLKj01/U5ScvYNmrMuCG0j2/DPJxY/UuQzirdjqKFOvT6g6M8N3xtXF4ItAoejeMSJsOS8aRTbrKCLLPU2iyMbbItW32kT50DmvKpMa2tHkW+W9CWKBdcpmtQdgG0up0vcyS0iZxDWcyQpfHqs5MoOaxfyhRZ6CCHF13w5QV+BJbxq5XEJWlQbsoEKbif4X8t9J/jnYhXR0h6ZCnRy25LFv/MHkzN4XZ3V7uhyWqmDSkodgWq2zoZykYTiBEMQ4gS2B28LzN5lrzRB3+JWJDdTm7KE1/agcno/ghfgEqW9hN07GwROHEN/V8VaTcF6SDG8rRBkF15V5SoiaS00Q6iNMHkZDjsgP9UBZ2QQ37Ta2pNb0V0YXxqP4uffZtWJKEw7T80t+gyRlBeD2fRW+LDtUr8iLOOSGbGggkYN81EcaulLY7MJIo706BR6PGfl8dRVObvq7O3821fQ0PdrWf65B+WbwFL4rQkjpQm4tRQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(186003)(54906003)(83380400001)(26005)(110136005)(4326008)(8676002)(86362001)(316002)(66476007)(33656002)(64756008)(66556008)(66446008)(66946007)(107886003)(76116006)(122000001)(9686003)(55016003)(5660300002)(52536014)(8936002)(53546011)(6506007)(7696005)(2906002)(38100700002)(508600001)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dy9neTJseGFVY0FOMVQ3SzVWTzcxNGFJVDFVMUdNRGN5M3RmV0ZuM1pyRHpp?=
 =?utf-8?B?OHJ4TkQwWVliQ1N5VHhvNWl1UkVYRkQwSkI4OFBuNnF5blQ5ZHhuTjV5dWJn?=
 =?utf-8?B?RFRqTSs3TEJBM0pUUVRWbDFKWDNKUkI2dTBvODV2dkNmdFM1WGxIRWE3aGg1?=
 =?utf-8?B?cDZheGIvWENwNEE0ZDBDcytTdGJET0s5V1JqYis3Z2NyVnZtWjJEQlNiTnI3?=
 =?utf-8?B?WGFRRkZIUVovVHl0OWVRU2IyRlBoVDNoMFJuL0picW1MT3dqSnFrSmlZVjR0?=
 =?utf-8?B?OWNYd2lPSVpaOUUrUUZtbzNqd0ZoR2xNc1NDTjd3bjFocnpNUG5iUWZHQTFv?=
 =?utf-8?B?YWhoMTl6VUpKTmtaUlV6c1cyWkN3b25KUWQzT1pnTXZ1OXoraHZyTWZoUXRL?=
 =?utf-8?B?cDk1aXJ1UFRXVWJpQnlsNUw0WnYyTVdmM0lBT3VGQ1liU0psRGV0V1UzVU1n?=
 =?utf-8?B?QlNTSlM3bzh4bnA5aWV5aGlVemx0bWl5QTJXOVdveDFaOWNVYXk1M05IRURu?=
 =?utf-8?B?MVpId1plakhiUjdBRlNZeGh2ZGNhRDVKRWhYUFdndnJrNGFDdlpzT0J3SkpQ?=
 =?utf-8?B?UTd0cEtvQmtHVUJGRlR3aEdnZ3c2RFdYWTFJbHgxMEZxTzUxYmNZcEZPeGpy?=
 =?utf-8?B?UUg3UHNvTmh5Ly9Dd01zdDBROStQM3hJUjFDaUhLNFdwa1VWVVUxMENNMHl0?=
 =?utf-8?B?ZUtsaFVXdDJxZTJBTm9nVUwzMmdwK3BRQ3MxdkV0MGN4OFpDeGt2aHNXVzdw?=
 =?utf-8?B?RTI1RFk1VmtIK1pjNFk0WGhJY0tVRXBBL0ZEcVFyOStFd3NaYVlwS05ndG5T?=
 =?utf-8?B?cVJka0JjM0w5Y3Q1OEUyd3Vld2R2U2dWaUxJNXNxL20wNkhwSmZKWHI1TmJ5?=
 =?utf-8?B?blF4VHcrRTNhQW9pQ1V1MVlNUWl0OHZIUUJDckVUaXpoY3htUWFsUTRSR1kv?=
 =?utf-8?B?Vi85THJUMkt6dktGa2grdFp4VXcrZS82S0srVEY0cTR6YldMR01uR0dMNWIy?=
 =?utf-8?B?ZjBXZFdMVzZTSStBL2JmWVdlSXNodk81a1RWcUd4cERmeG9aeTdJazZna21F?=
 =?utf-8?B?N05FWUtsdmJwYU9zZk9TcC9oeWpvcXFnckpDbUdaNllGZzNWYklmbWZRU21J?=
 =?utf-8?B?V2pOYjNLU2pJdEt2UDlQbk5pRno4bi93cmV1SHRvcEtBeVJPdjRaczFMRkt6?=
 =?utf-8?B?QUVUdS9XL1JCOVJOR3BmRU5JZHpkUzFjT0RFN1lNeFJneTl0RzJmY3RtWG13?=
 =?utf-8?B?YytIajZGMitpSjJXVkNhbkpDOFd0Mms1L3B5VEptRVExVlFNeGhvdmpKV3Bl?=
 =?utf-8?B?ZUNhcGYvMkFWdGxyTDB4MWRmT3B0emcySHpBNjRBbkgvZ0x2eVY3cXdSQTYy?=
 =?utf-8?B?aVBjZ2JESk9tL0xYT2NJOUpSa1pld1BxMHhhV2ZmWVNDcGVEOXUvTXNTZHBC?=
 =?utf-8?B?ckNSWGhNNnV3TnNva0w4UEhnSTlyL1dEYnNhZVBIc2RGYjBZYjcvRko1OW9W?=
 =?utf-8?B?SVV5ZThqc3hBOXM1RW5ML2JzWjN5RStZZFo2ZjJwUklnTmV2cVVYVlBkY3NE?=
 =?utf-8?B?Y2hMb1R4ak9XRk9uSXk4Y2E5RGFuK1pjaVZMaFVzRTdmQVJyRHhxRGhlYUxN?=
 =?utf-8?B?Z21EWWdPOHVDOFVjUVNHR2RKM0pKcmJHeDlaVXBvYmNvQW1yTVRDa0hpRFZ0?=
 =?utf-8?B?YWllUWNYTk1xMytESC9WbmFid2NoUlBrd0t4clk5NWNaV2VYazQxVXVBQldS?=
 =?utf-8?B?K3JBaHZJay8wU2xLakhvRitZOThkZ1pHbEgxVEE5V3ViOWNpOHdlMVVTZjk3?=
 =?utf-8?B?WGwvanpnU0UwVUxmcndNWW9nVUQrRE1kajlaZW56UWYzZHFlZEhGQkxMT21T?=
 =?utf-8?B?Y3dTbzZSeVNGTjc3cGlNd3NIVW1mTG1FcE0xRTJOT0dNN3JoNkV3S0dWR0Rk?=
 =?utf-8?B?cldPZS82dHBXU0lvbEpIb2pYanppejlMenRJaWR6ZmRmRmpnNDUwSEZyZ0Zm?=
 =?utf-8?B?dTUweEtoS1Zac2FBdGhkM291eFhZUGZvMHpJZFh3Ym5yc0RGNmRTYnk4Q1k4?=
 =?utf-8?B?YkNnRDI5VHlXajBpTVZUbjNLdUZVeks1aW9LTUJnSExtanY1SFN0UExycHhs?=
 =?utf-8?B?c0tBc2NFM05mZm54Rmw5VHdCR3VWcUVRNWllZVlKSkR5UFVUUFhRQlR6UDRw?=
 =?utf-8?B?Z2hSTWtXQmtQSmtLcGVEcnJVL1ZFYWxnNnVZT0MyTXpBNU9VZHYzZ0w1UnVV?=
 =?utf-8?B?eUZQa25uallmYlJpYzMyZXlhWFBON2dnYnJqVFlPRmlHTTV5Y3dBSXVXelht?=
 =?utf-8?B?V1lXOEEzWWdVSGU1UFptZXlaOVFaMGRUbGFYQ2I1N3QxWmdtTzRtUktKZmtT?=
 =?utf-8?Q?3Cd3NsALyVJXMeAs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09783592-bfb3-47a9-f5a2-08da14e29b50
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2022 19:54:32.6660
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BuDIriibngb07+Q4vuhTh7syWaJamu7wK+h9XwijUV4xFnmStAD/aV+fcqyBmit0nemYnlOMJDZGayzI/QsT5VwJtrk5wSaxfpIZh6RoWKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6019
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4g
U3ViamVjdDogUmU6IFtQQVRDSCB2NCAxLzVdIGR0LWJpbmRpbmdzOiBhcm06IHJlbmVzYXM6IERv
Y3VtZW50IFJlbmVzYXMNCj4gUlovRzJVTCBTTUFSQyBFVksNCj4gDQo+IE9uIDAyLzA0LzIwMjIg
MjE6MDUsIEJpanUgRGFzIHdyb3RlOg0KPiA+IEhpIEtyenlzenRvZiBLb3psb3dza2ksDQo+ID4N
Cj4gPiBUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCj4gPg0KPiA+PiBTdWJqZWN0OiBSZTogW1BB
VENIIHY0IDEvNV0gZHQtYmluZGluZ3M6IGFybTogcmVuZXNhczogRG9jdW1lbnQNCj4gPj4gUmVu
ZXNhcyBSWi9HMlVMIFNNQVJDIEVWSw0KPiA+Pg0KPiA+PiBPbiAwMi8wNC8yMDIyIDA5OjMyLCBC
aWp1IERhcyB3cm90ZToNCj4gPj4+IERvY3VtZW50IHRoZSBSZW5lc2FzIFNNQVJDIEVWSyBib2Fy
ZCB3aGljaCBpcyBiYXNlZCBvbiB0aGUgUmVuZXNhcw0KPiA+Pj4gUlovRzJVTCBUeXBlLTEgKFI5
QTA3RzA0M1UxMSkgU29DLiAgVGhlIFNNQVJDIEVWSyBjb25zaXN0cyBvZiBhbg0KPiA+Pj4gUlov
RzJVTCBUeXBlLTEgU29NIG1vZHVsZSBhbmQgYSBTTUFSQyBjYXJyaWVyIGJvYXJkLiAgVGhlIFNv
TSBtb2R1bGUNCj4gPj4+IHNpdHMgb24gdG9wIG9mIHRoZSBjYXJyaWVyIGJvYXJkLg0KPiA+Pj4N
Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNv
bT4NCj4gPj4+IC0tLQ0KPiA+Pj4gVjQ6DQo+ID4+PiAqIG5ldyBwYXRjaA0KPiA+Pj4gLS0tDQo+
ID4+PiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9yZW5lc2FzLnlhbWwg
fCAyICsrDQo+ID4+PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiA+Pj4NCj4g
Pj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3Jl
bmVzYXMueWFtbA0KPiA+Pj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJt
L3JlbmVzYXMueWFtbA0KPiA+Pj4gaW5kZXggZmE0MzVkNmZkYTc3Li5mNjE4MDcxMDM4NjcgMTAw
NjQ0DQo+ID4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3Jl
bmVzYXMueWFtbA0KPiA+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2FybS9yZW5lc2FzLnlhbWwNCj4gPj4+IEBAIC00MDUsNiArNDA1LDggQEAgcHJvcGVydGllczoN
Cj4gPj4+DQo+ID4+PiAgICAgICAgLSBkZXNjcmlwdGlvbjogUlovRzJVTCAoUjlBMDdHMDQzKQ0K
PiA+Pj4gICAgICAgICAgaXRlbXM6DQo+ID4+PiArICAgICAgICAgIC0gZW51bToNCj4gPj4+ICsg
ICAgICAgICAgICAgIC0gcmVuZXNhcyxzbWFyYy1ldmsgIyBTTUFSQyBFVksNCj4gPj4NCj4gPj4g
SSBzZWUgeW91IGFyZSB1c2luZyBzYW1lIGNvbXBhdGlibGUgZm9yIGRpZmZlcmVudCBjb25maWd1
cmF0aW9ucy4gSQ0KPiA+PiB0aGluayBpdCBzaG91bGQgYmUgcmF0aGVyIGEgc3BlY2lmaWMgY29t
cGF0aWJsZSAoZS5nLg0KPiA+PiByZW5lc2FzLHNtYXJjLWV2ay1yOWEwN2cwNDMpLiBJdCdzIHRo
ZSBtb3N0IGRldGFpbGVkIGNvbXBhdGlibGUsIHNvDQo+ID4+IHRoZSB1c2VyIGlzIGV4cGVjdGVk
IHRvIGNoZWNrIGl0IGFuZCBoYXZlIHRoZSBhbnN3ZXIgYWJvdXQgc3BlY2lmaWMNCj4gYm9hcmQu
DQo+ID4+IEhlcmUgaXQgd29uJ3Qgd29yayAtIHlvdSBoYXZlIHRocmVlIGRpZmZlcmVudCBjb25m
aWd1cmF0aW9ucyB3aXRoIHRoZQ0KPiA+PiBzYW1lLCBtb3N0IHNwZWNpZmljIGNvbXBhdGlibGUu
DQo+ID4NCj4gPiBTTUFSQy1FVksgaXMgY29tbW9uIHRvIFJaL0cyTChSOUEwN0cwNDRMKSwgUlov
RzJMQyhSOUEwN0cwNDRDKSAsDQo+ID4gUlovVjJMKFI5QTA3RzA1NEwpLCBSWi9HMlVMIFR5cGUt
MShyOWEwN2cwNDN1MTEpIGFuZCBSWi9GaXZlKHI5YTA3ZzA0M2YpDQo+IFNvQydzLg0KPiA+DQo+
ID4gRm9yIGNvbnNpc3RlbmN5IEkgaGF2ZSBtYWRlIHNpbWlsYXIgY2hhbmdlLiBTbyB5b3UgcmVj
b21tZW5kIHRvIGNoYW5nZQ0KPiA+IE90aGVyIFNvQydzIGFzIHdlbGw/DQo+ID4NCj4gPiBTTUFS
Qy1FVksgaXMgY29tbW9uIGNhcnJpZXIgYm9hcmQgYW5kIFdlIGhhdmUgYSBTb00gbW9kdWxlIHdo
aWNoDQo+IGNvbnRhaW5zIFNvQy4NCj4gPg0KPiA+IFI5QTA3RzA0MyBpcyBnZW5lcmljIGNvbXBh
dGlibGUgZm9yIFJaL0cyVUwgYXJtIGJhc2VkIFNvQyBhbmQgUlovRml2ZQ0KPiA+IFJJU0MgQmFz
ZWQgU29DLg0KPiA+DQo+ID4gRG8gSSBtaXNzIGFueSB0aGluZyBjb21wYXJlZCB0byBvdGhlciBl
eGlzdGluZyAgcmVuZXNhcyBTb0MncywgcGxlYXNlDQo+IGxldCBtZSBrbm93Lg0KPiANCj4gSSB1
bmRlcnN0YW5kIHRoYXQgY2FycmllciBib2FyZCBpcyB0aGUgc2FtZSwgc28gdGhlIFNvTSBkaWZm
ZXJzLg0KDQpGb3IgUjlBMDdHMDQzIGNhc2UsIGV2ZW4gU29NIGlzIHNhbWUsIG9ubHkgU09DIGRp
ZmZlcnMuDQoNCj5JbiB5b3VyDQo+IG1vZGVsIHRvIGZpZ3VyZSBvdXQgd2hhdCB0eXBlIG9mIGhh
cmR3YXJlIGlzIGl0LCB5b3VyIGNob2ljZSBpcyB0byBjb21wYXJlDQo+IHR3byBjb21wYXRpYmxl
czoNCj4gcmVuZXNhcyxzbWFyYy1ldmsgKyByZW5lc2FzLHI5YTA3ZzA0M3UxMQ0KPiANCj4gSWYg
dXNlci1zcGFjZSBjb21wYXJlcyBvbmx5IGxhc3QgY29tcGF0aWJsZSwgaXQgZ2V0J3Mgb25seSBT
TUFSQywgc28gaXQNCj4gZG9lcyBub3Qga25vdyBvbiB3aGF0IGhhcmR3YXJlIGl0IHJ1bnMuDQoN
CkJ1dCBIZXJlIHVzZXItc3BhY2UgY2FuIGVhc2lseSBpZGVudGlmeSB0aGUgSC9XIHdpdGggZXhp
c3Rpbmcgc2NoZW1lLiBTZWUgdGhlIGxvZ3MgZnJvbSB1c2VyLXNwYWNlLg0KDQovICMgZm9yIGkg
aW4gbWFjaGluZSBmYW1pbHkgc29jX2lkIHJldmlzaW9uOyBkbyBlY2hvIC1uICIkaTogIjsgY2F0
IC9zeXMvZGV2aWNlcy9zb2MwLyRpO2RvbmUNCm1hY2hpbmU6IFJlbmVzYXMgU01BUkMgRVZLIGJh
c2VkIG9uIHI5YTA3ZzA0M3UxMQ0KZmFtaWx5OiBSWi9HMlVMDQpzb2NfaWQ6IHI5YTA3ZzA0Mw0K
cmV2aXNpb246IDANCg0KQ2hlZXJzLA0KQmlqdQ0K
