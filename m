Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF744EDAA2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Mar 2022 15:36:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233067AbiCaNh5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Mar 2022 09:37:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236925AbiCaNhs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Mar 2022 09:37:48 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2107.outbound.protection.outlook.com [40.107.113.107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D6601E6E98;
        Thu, 31 Mar 2022 06:36:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9YXBef4PDzu2rNOoAvxxVPJQnGuNhU8XsRnhFQAUpBKtsEM/6KkNMpuRf8esv7Nmm0mpvwEbuOTrgz+2GAMVMxpUIW06HBxTbIbdLPNKXpVZ+Vl5gwlVBPa/jrtYTXgjUDe03j+8OHk+imLeg8vfQjXNb4K8UT+hTv7TogQmpxoTgpFNzGVjXHAF49kIVpJdDMHsPQ7aN3/dtxzr2VmGHUopN00Fag7VDHcWFRWgSPxVGCKfzPRFwBvgVWr9CFw8tvP2wS4fMiGVYU6t+XppTTyN/XkaUQHBV6ukjXI33hhz0m/QrCRpV7ZiucgRjO67eHJmgN+T6kfP/PrTyvxQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r6/XwPn6rVACm9PYsbiyuClE9XbnuTOqQX8pCk5JLZI=;
 b=iLjcbGAk55UB3UrYMHS153mAGqcz1UQscqij03VsdLK+VP7PnGQri01gMg3nkC2+KA7GOdyuQpe7BPtY/pLDlOKkY1DDAVOgQNOZPH3sKS5tL4wt8idjMQT4DoD4TtrwWiA1qS31lkm9JhHE4HOQGNBSSWu6gjMUfiv9N5f6W+qk2SluLioZhH9YGNXm3upEEu6WbwnT8K0AnUFrb9VeL34uutYOOsIvFAamWBb3zlAhR7XS5xikMKAhSWhpj66KOpqmH9n0KIrnrFGq4P3YGhUInSIgHCGyRy9Tb7/K7BdqVpxXeZxqZvIEGIRNQNnkfhJKXIgCBxDmB8D81tqBUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r6/XwPn6rVACm9PYsbiyuClE9XbnuTOqQX8pCk5JLZI=;
 b=mkcHb1ezRmbm+dNeGcPXfYZKtAlstASauPKAD/L958JBThWJOXULjCCscOx73bO0hTRUCTUoEVQBc9suroEQkYlqwyhctLCnf22vqObmEapRFHYQ8c8uPL+DXGYcUmQ1FqkvfIdBpI/tGswI/9zSpyVmZdw7aPecTmwktRsSWvM=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB6381.jpnprd01.prod.outlook.com (2603:1096:400:9a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Thu, 31 Mar
 2022 13:35:58 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::7ccd:4eb0:e2ae:fca8]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::7ccd:4eb0:e2ae:fca8%3]) with mapi id 15.20.5102.023; Thu, 31 Mar 2022
 13:35:57 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 5/7] arm64: dts: renesas: rzg2ul-smarc: Enable microSD on
 SMARC platform
Thread-Topic: [PATCH 5/7] arm64: dts: renesas: rzg2ul-smarc: Enable microSD on
 SMARC platform
Thread-Index: AQHYOIWrewB2W2n6Hk+6j6lXhYyd6qzZlBwAgAABpRA=
Date:   Thu, 31 Mar 2022 13:35:57 +0000
Message-ID: <OS0PR01MB5922002E2AABB44A6A679F2286E19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220315155919.23451-1-biju.das.jz@bp.renesas.com>
 <20220315155919.23451-6-biju.das.jz@bp.renesas.com>
 <CAMuHMdUPfMMK2Mv0ffQcYVitpOLv5Y4iB-eVPa1u=nYXF5o7mw@mail.gmail.com>
In-Reply-To: <CAMuHMdUPfMMK2Mv0ffQcYVitpOLv5Y4iB-eVPa1u=nYXF5o7mw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d823e957-f710-41e6-7aec-08da131b6355
x-ms-traffictypediagnostic: TYCPR01MB6381:EE_
x-microsoft-antispam-prvs: <TYCPR01MB6381626E9A75071246466C9386E19@TYCPR01MB6381.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VxFz0X4s9dEBkme7UlVWxlbMw0kxnYSUVL5OHVXSfhdSyp+7xRlUIlB1kfrMhZMpY65UNWLHvgiCtyOIq6NX39R6LySZRvjFDnPXl3d73G4uRaXKs3AAR8RRGDrePnmCrskqHbpO7q9x2YYgdNQM+AcfqxIPlkuEYRXLg/bJ0FPwAc5Hjk3+CISfdNUESYE0nRb7/CkD2vQNLchGD5r7PFklV/kyvOChcVgYlhMtL7czD7YD9WWjOKgYr/ghUI4aZTe7zZT2Kug1iRmsHjtwocpniTRDIFVbybNn7Pet+9CboyGm0oyshW2R0tP/qxEv/fwI4heCaxDC7oaEllGewj44P2DwAu6w5IxmDW9zab4R1M6VnpFd5Uqsue5JoRyS4chEy6I8i+jysZsCTkmW0yEM2JuZ4LdaBo7lpaYP4yeyf42ePw28RTfrTLdroIDl6W6nGgwzb4abGGMN97nVAt75BRII8nhhqGf60eUeiDRxicN/AZSVyXPHE1gl0sR33HZ57COzKJtYko9zqJrlWpjqsDc6oBFKhEXgbCv1GFkfGmKqhIUVsFp0/FERtz0/RV281edoiFIpji9Djs/RkKzaJaD1W8cZbP7wCzxuGbg9c/Y41fhNiYmHz/a1tPgO4PT2XKoYvcM1vL+WMUUSEhA7TRMZoamBU0VTH2c7yKTbnvh4fkh5sJoGuSDwkYU+c8eFnjZU0gaqrXcGDPBsig==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(6916009)(52536014)(8936002)(53546011)(4326008)(7696005)(54906003)(71200400001)(508600001)(55016003)(9686003)(2906002)(33656002)(6506007)(316002)(26005)(83380400001)(8676002)(66446008)(122000001)(66556008)(186003)(76116006)(38100700002)(107886003)(5660300002)(64756008)(38070700005)(66946007)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QmxLL2ViOWE0RENVR3RGSUhYMnVBb25FbG5sc1Z3TENMczFwaEZVNU96Mlpm?=
 =?utf-8?B?VVdrR1lEdlZhbVE2OWZ0NHZSR3VjMm5GTTdKQ2I4a0VPcmVwM2NwTzhtOGRk?=
 =?utf-8?B?SmRBODRRTnBoY256Vlc5NUFFYkNLYW1uM0FkQjZGZ0J0MEZCUFI1QWcxSldo?=
 =?utf-8?B?VWpId0hyRE1tc3N6OHQ3a2FEUzRnNHVOMWpDMGFDQWMxQy9DS0FNY29zZUtQ?=
 =?utf-8?B?SXE5Z3l3c0Z3bmh6VmxCNzRLVzh4aEpOVWxjeGYwakJnTHU1RzVKUW53R2h4?=
 =?utf-8?B?N3FSSWU1dWlMU0k4OExnN0Z5N2duTUd4VVdSbS9uNzNlcHVGcSt2ZGdqRG1G?=
 =?utf-8?B?Sk5tNVplVUxKSmUxdlZzZTJydDQ3K2thSFpKYlR0WGhBdjBKcm4ySnJEUVZn?=
 =?utf-8?B?elMxN2U5czVrdCtlNFlxWmJXZ0phSGhUT2I1UG9RTy8ySnZ5NmNKc2tXV1dw?=
 =?utf-8?B?WVZoTDM3M1VMaGVFVVVMNlY0blpiWnpDcjRTakVHclIvdm9nblgrejJCZDEr?=
 =?utf-8?B?bnFwOXVnb0tmYnZrak9QMkJqdWN5ZGhUR2E4TGJ0aE9KeW1LbXhHVDVIWDdH?=
 =?utf-8?B?b0xNeHRGRGkrSnlDY0ltcTlrMGJ5SVFaRkZwdmF1Q0ZjcXBIY0c4aFlYRjN3?=
 =?utf-8?B?czhhZWpPNnd1M25GK3VJMnlRSkdyREdXc3hzcTlSM3ZIcTltZW4valB0MmVP?=
 =?utf-8?B?TFVaMlp2OGpVMTlLZXZweDBZcXRQZ3NYSWdsSHZoVnZDRmhaOGFUaDBBOFVD?=
 =?utf-8?B?c2hrWkZrYTN2Q2ljMmk2V0JsajlXSm9LU1NTT1h1aXFmL0NpT2tXckoyK3VN?=
 =?utf-8?B?VzJiaVFIOFhaQ0RzR1hvZmtBQklrWWpsZWRrcmJlMUg1V1VhTm9Zc0hGbVlo?=
 =?utf-8?B?QWhoMEMxZXRia214MW9WVi9FaGVTVU9sbmlhTzdPSDRlTGV2SWlZck9TYi9w?=
 =?utf-8?B?Q3hCcFMvOHJ1azkyN1hSM2J4bTQwS3FjcDV2QzJ3MFhoMmdFSnh4L01JRVdu?=
 =?utf-8?B?Zlk3RmFiV3ZXRlV6K2F1bHJycVBnVzF6QmpjZUdHZzBGTkdKeWJhSkxCcm9Z?=
 =?utf-8?B?NkNmUy9wMCtCUS9nYndhZ09BUEo4NWxHMUFRbmhhZXpzKzVqRzhFQnNRUWtt?=
 =?utf-8?B?WWkyY1NSU3k5YWl2aXF4a1AwVzU3MmdLeW9aZVUrMk9UMTFCYXd2ZzdQQ1Zi?=
 =?utf-8?B?WEpTR3VUY09BWVM3disyY3NQYjhLdHhwSXp4aHZIUTJ3STh0Y1hzWlg4RkxP?=
 =?utf-8?B?QUNzbGJyb2U4a1ZsN1h4enN0c3dIL056ejU5MFZHNUhYelIzZU9GbHZMdkRS?=
 =?utf-8?B?Z0Qyc0Vmd1BENGRkbEpuUkIyb1VLZnlWSGhOZHZUMWh6WVpuaFA4OEs1UTRM?=
 =?utf-8?B?T3M1SStuSzEvK0RjQW1UK1VqVDUyVXVsanZNTzBlSE1ST0paY2FUZ3psNkZW?=
 =?utf-8?B?V0xrNWFDNU8zUVdPLzNIWGxnYlBVNFo4Z3l3WENSbVdaTnlRSXBFNmFtRHdE?=
 =?utf-8?B?T1ZjcS9tYzBzSDZXdExNbHhwZGtrdU5TbnI1WEdGV3RJa2ZSb2R2VTdURjVs?=
 =?utf-8?B?OFlxTGdsTWxjTmxUYXRWQXRvOXJGa1o3QW5mNm1aTmMrOE9tVWdQdEh1WFN3?=
 =?utf-8?B?OW1SM2VzbmRDVTF4RWI3VVRqdDRKbDkybjFGcWQ0WVlWOXRlSmtJRy82YzQ2?=
 =?utf-8?B?WWFHbVpsQ3MzaVlObTNyVytZazQ4WlhsNmNrVFJuaExjb1k1M3pxQVg3NnpZ?=
 =?utf-8?B?MFhScDZpODNReVBxK2Rtcmp1RkR1cHdsVzVxaXM2Vnkza1J5dFBrWTVCcEY5?=
 =?utf-8?B?MzRPU1B6bkpxaVp6Z0NVNWd4NWhUR1VtS21sc3IyY25Mb0h3QXpqWm5Rb3dL?=
 =?utf-8?B?OFBKVGlMcElrWm5kSzdZQ0FWQmhOT2VLSlQ5U0RkN2NmNzRuc3RIRVRwdkFl?=
 =?utf-8?B?UWVGckZJL1NhNG9OTHkraW9SSUlvZk1iaEhicno1Szg0SENRampZTk9NKzRj?=
 =?utf-8?B?SXFmd2s3ZDR6OFhJNGwvb3RJRjJDdUxDVlYzU3krMXFlVHRiSFRDWUdKYXoz?=
 =?utf-8?B?Z1pQajRuU29WRzVFWnlDdnBpZnZQa01RQzlTaGk0ZUM2V3oxZFJSVEwyYStZ?=
 =?utf-8?B?OXFiZEk5cWZuZU11TXdsQWVZeFpTVkZtUERLd2NWNWpSVGZYL1dUL2JlT1Vw?=
 =?utf-8?B?ZHlYU1FuTjd1Y0E3RXN6bHBZcjVDK2hXdFBHMW1mdVdEWnY2OWxEbWpnUFhE?=
 =?utf-8?B?L1czL0dLdmFqejBUekUrdTB4bjRzRjFkdmRKTXpjbnBoNCtGaXBwUzExRFpC?=
 =?utf-8?B?TldKeDRUV2xiVUtoM0JjSGFFR21VVzdTdzZHUWp3UHp6RnkzSXlndTFDR3Fs?=
 =?utf-8?Q?9xr5oD0BkXJ/GCvA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d823e957-f710-41e6-7aec-08da131b6355
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2022 13:35:57.7157
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T97KPfZZHAE4akzkr8ekHaBSOvuypDdKo8gsPMxBtT4XlhTGKiM2O8WuBi+DZeRwbWazMkiRqnEkaqm2ahnAamkbbbnuqRt7M3qxTtjz0HE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6381
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggNS83XSBhcm02NDogZHRzOiByZW5lc2FzOiByemcydWwtc21hcmM6IEVuYWJsZSBtaWNy
b1NEDQo+IG9uIFNNQVJDIHBsYXRmb3JtDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVHVlLCBN
YXIgMTUsIDIwMjIgYXQgNDo1OSBQTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5j
b20+DQo+IHdyb3RlOg0KPiA+IEVuYWJsZSB0aGUgbWljcm9TRCBjYXJkIHNsb3QgY29ubmVjdGVk
IHRvIFNESEkxIG9uIHRoZSBSWi9HMlVMIFNNQVJDDQo+ID4gcGxhdGZvcm0gYnkgcmVtb3Zpbmcg
dGhlIHNkaGkxIG92ZXJyaWRlIHdoaWNoIGRpc2FibGVkIGl0LCBhbmQgYnkNCj4gPiBhZGRpbmcg
dGhlIG5lY2Vzc2FyeSBwaW5tdXggcmVxdWlyZWQgZm9yIFNESEkxLg0KPiA+DQo+ID4gVGhpcyBw
YXRjaCBhbHNvIG92ZXJyaWRlcyB2cW1tYy1zdXBwbHkgZm9yIFNESEkxLg0KPiA+DQo+ID4gU2ln
bmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IFJl
dmlld2VkLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVu
ZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSAvZGV2
L251bGwNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnMnVsLXNtYXJj
LmR0c2kNCj4gPiBAQCAtMCwwICsxLDI3IEBADQo+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCj4gPiArLyoNCj4gPiArICogRGV2
aWNlIFRyZWUgU291cmNlIGZvciB0aGUgUlovRzJVTCBUeXBlLTEgU01BUkMgRVZLIHBhcnRzDQo+
ID4gKyAqDQo+ID4gKyAqIENvcHlyaWdodCAoQykgMjAyMiBSZW5lc2FzIEVsZWN0cm9uaWNzIENv
cnAuDQo+ID4gKyAqLw0KPiA+ICsNCj4gPiArI2luY2x1ZGUgInJ6ZzJ1bC1zbWFyYy1zb20uZHRz
aSINCj4gPiArI2luY2x1ZGUgInJ6ZzJ1bC1zbWFyYy1waW5mdW5jdGlvbi5kdHNpIg0KPiA+ICsj
aW5jbHVkZSAicnotc21hcmMtY29tbW9uLmR0c2kiDQo+ID4gKw0KPiA+ICsvIHsNCj4gPiArICAg
ICAgIHZjY3Ffc2RoaTE6IHJlZ3VsYXRvci12Y2NxLXNkaGkxIHsNCj4gPiArICAgICAgICAgICAg
ICAgY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZ3BpbyI7DQo+ID4gKyAgICAgICAgICAgICAgIHJl
Z3VsYXRvci1uYW1lID0gIlNESEkxIFZjY1EiOw0KPiA+ICsgICAgICAgICAgICAgICByZWd1bGF0
b3ItbWluLW1pY3Jvdm9sdCA9IDwxODAwMDAwPjsNCj4gPiArICAgICAgICAgICAgICAgcmVndWxh
dG9yLW1heC1taWNyb3ZvbHQgPSA8MzMwMDAwMD47DQo+ID4gKyAgICAgICAgICAgICAgIGdwaW9z
ID0gPCZwaW5jdHJsIFJaRzJMX0dQSU8oNiwgMSkgR1BJT19BQ1RJVkVfSElHSD47DQo+ID4gKyAg
ICAgICAgICAgICAgIGdwaW9zLXN0YXRlcyA9IDwxPjsNCj4gPiArICAgICAgICAgICAgICAgc3Rh
dGVzID0gPDMzMDAwMDAgMT4sIDwxODAwMDAwIDA+Ow0KPiA+ICsgICAgICAgfTsNCj4gDQo+IFRo
aXMgcmVndWxhdG9yIGlzIGFscmVhZHkgZGVmaW5lZCBpbiByei1zbWFyYy1jb21tb24uZHRzaSwg
d2hpY2ggaXMNCj4gaW5jbHVkZWQgYWJvdmU/ICBUaGF0IGRlZmluaXRpb24gZG9lcyB1c2UgYSBk
aWZmZXJlbnQgZ3Bpb3MgcHJvcGVydHksDQo+IHRob3VnaC4NCg0KWWVzLCBPbmx5IGZvciB0aGlz
IFJaL0cyVUwgYW5kIFJaL0ZpdmUgU01BUkMgRVZLIGl0IGlzIGRpZmZlcmVudCBjb21wYXJlZCB0
bw0KUlove0cyTCxWMkwsRzJMQ30gU01BUkMgRVZLLg0KDQpTaGFsbCBJIG1vdmUgcmVndWxhdG9y
IGZyb20gcnotc21hcmMtY29tbW9uLmR0c2kgdG8gUlove0cyTCxWMkx9IGFuZCBSWi9HMkxDIFNN
QVJDIGR0c2k/DQoNClJlZ2FyZHMsDQpCaWp1DQoNCj4gDQo+ID4gK307DQo+ID4gKw0KPiA+ICsm
c2RoaTEgew0KPiA+ICsgICAgICAgdnFtbWMtc3VwcGx5ID0gPCZ2Y2NxX3NkaGkxPjsNCj4gPiAr
fTsNCj4gPiArDQo=
