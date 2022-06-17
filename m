Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DE6F54F19D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jun 2022 09:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380456AbiFQHNL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jun 2022 03:13:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380443AbiFQHNK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jun 2022 03:13:10 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2093.outbound.protection.outlook.com [40.107.113.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA7E75E145;
        Fri, 17 Jun 2022 00:13:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m2ct0jpsEo5IRXwl02C7Beq5AmVatVwK6DZQ9RDRvcZC6GK01X1sLeb43WlMa6yibNaWs3bCb5VfmbdrDFtx+e9kDDMB0vk9m59sjUF++DvXhfR+KpgaPmmzpoY/JkiZehWXUoxnfkDhYzfcEGJG08duuAIhAJZk37rcoutdluoh+7GTTIOd1pr4RINpwqP9EjShVriYELpLPWgJ6025E0b2zt5iwf7WaMG5z4wYq6Rpp48rulSK26aG+C1zON6O3JN4yyws3RbYHmn+sMLpKsggbhYj289DpVLFg91kjgVuh4YNqTso2oNVNqkGdHfvAl1xXKlCk++nrSXFdHrV7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkRbkEVdIoh168gqU9eQq+ljEne+fhIF8Vgz0rrQUWc=;
 b=i7BKluUK2NiF+IUWVYu6gJuYqlNmMu0aRnT9Y2oj55B/5Zn7GrnG8DTrxIcV60Kvah3pLhJPhhkDcargQeOOLkTXUkRLSBhC0aWANjxEGjAkh6mdO/d5SV+12V4JilY/jbKgQTMVS6F1+uu1SYP2VUI0YEzc2Sy3qBUJ8s83SmxI/WoGIfPCnAWW5g/xCF9RHae+W1mDIBObV6iSkaA37TtUOZGUX9c48hw/N9NHWOoAGvgHCTRhfY+R88yvmxpoWcHO9We6AILcgE3ZAu3dixffLldzvtyIuQQvRiGG8OxQsqmyW2hZ/ladfo7JRSuQPloSf4EyT24y8/THiZYIhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkRbkEVdIoh168gqU9eQq+ljEne+fhIF8Vgz0rrQUWc=;
 b=iRx+v98OuaIZoW0BGMlg8xcpXuHkPjhzEnGGn2P7D9434324EkpTb7tOSfo7W4FfBaXV3U1bi5OwmhxhvFfAS/81rc89MKPcZ9FVxGEDttrFmhXaO4xeHLH0cQ/atSAXNsr+urnH8Gvyocpt1FsRyMclaJubYaTbamx8qg5BSEw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB2593.jpnprd01.prod.outlook.com (2603:1096:604:1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Fri, 17 Jun
 2022 07:13:05 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::dc06:eb07:874:ecce]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::dc06:eb07:874:ecce%7]) with mapi id 15.20.5353.016; Fri, 17 Jun 2022
 07:13:05 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux USB List <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: usb: ehci: Increase the number of PHYs
Thread-Topic: [PATCH] dt-bindings: usb: ehci: Increase the number of PHYs
Thread-Index: AQHYgL9EpS8EJvfSJEqgO1MJ+ZDgva1Qt+gAgADyw4CAAYW5QA==
Date:   Fri, 17 Jun 2022 07:13:05 +0000
Message-ID: <OS0PR01MB5922E72A4D64A5B93D2EFFB886AF9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <c5d19e2f9714f43effd90208798fc1936098078f.1655301043.git.geert+renesas@glider.be>
 <CAL_JsqJbmdJd6+D9zog6NwF_LPO5QC_HsODg4FHLJOnMmPP-mg@mail.gmail.com>
 <CAMuHMdU3PnY6yZf70kB9wme7_WTjcPJwmzo--Ua3vJ45w7mD8w@mail.gmail.com>
In-Reply-To: <CAMuHMdU3PnY6yZf70kB9wme7_WTjcPJwmzo--Ua3vJ45w7mD8w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bbc159f7-bb38-4904-1089-08da5030d322
x-ms-traffictypediagnostic: OSAPR01MB2593:EE_
x-microsoft-antispam-prvs: <OSAPR01MB2593772A7E27252B62FCC0DF86AF9@OSAPR01MB2593.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jxBTbldklqlj7aAv27wqtd5wBcOKcbmt1DLUNx8IXcl0hSscFfdmKIbz0n6aNOwjouH8iMLBcgSVZoCmhRhhSQs4XGm4kRPuY/jvVoiLxSAiWMBKxCCOEQ2XJGPD3UkI7EsgphDOwnHd+qSnu9lzSoTnMBjyLk7S9NcW5FnIX4qs+slC0jOQ6tx2KjAEryr4PNlPol+qd6/vmZuAzostxzv9v2T2lWQM+AId0QCYQ+b7U+oc8QdolXhr52VO5dI7Y6WDZ2Wmv6o/27i00kMdjF/oSRB8at3tOkx3wrxbgbV3+H2Yqum37LpdWhli25NlI0EWcr67/7h77BpUwPpHHSMTATpETT0DEzLo9vligCZU4SEiLSswYjgxnhkrm8hc1cGqbOuimDUTWYSmMViHPx/nxOc8onP/99zuTWFAjb0OvOTa7bs6XFFUFALcLe2fAVDGqErF3y06LfDfW8qxamuFJBWcCAQMzwL5ZX8cLDSXUvGo0a+M7wtGknRHQ3n5qLeT3uOtK4TsxhhAWXtJhxOZ3CiwvMW5exWqm7sa0p18nE9LqN1MFmBOo+0o+xS0v9fAVkB8SBq+lkUI6GHo4G/PULfDFQafDq7pnss+03MJe5NSlMxUF9IuysIRqfsHaLJOgWnMu9Lsh0IJlBwQ8adre09I2V1R+e1WexW6bKQLOBNddvhWNauR+//uqqjk9LLYTS4wghWXOgMfiBSCEw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(8936002)(52536014)(55016003)(53546011)(54906003)(86362001)(508600001)(38100700002)(122000001)(2906002)(71200400001)(64756008)(66556008)(66946007)(5660300002)(38070700005)(8676002)(76116006)(66446008)(4326008)(9686003)(316002)(26005)(186003)(33656002)(110136005)(6506007)(7696005)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VTlDRFY4Y1I5cTV6SlUzNzZKdnRVb3BFWUthMWtTd2RYR01jMFlja0VSdkpG?=
 =?utf-8?B?a0djWDZWNDBWSWNCLzN2eEJ1Myt0STBROFY5TVFiMC9GS1k0dlp1R0dxM1Zz?=
 =?utf-8?B?NzEwSmFUTjFLajJUWWJzWVZpbnJ4bCsyb3RJOW82S2ZlS2JmZ1lDNHB6V0M3?=
 =?utf-8?B?Z0VoNkV0NlFGbGErL0l5OVFRL2pyV1BPMW01RG5DWFE5Z09pZ0UzN2ZnQWlS?=
 =?utf-8?B?a2E0SzFYb0p3QkFhemdpSXQ1MFhYdHU0Mk9Xc0xyVGcyWXhDclAySllnWC9F?=
 =?utf-8?B?NWVGbEFyUmIwMitUdHBCNVVUQ1ZXbk9Yb1Q5UXUyNmpEOC9KdEJsclJSRFZH?=
 =?utf-8?B?NDYxN1hMeG93ZTRvRFVXSUFTTFFINW1rZlp1bkVSejJZYTlYNVhST2hGUE9a?=
 =?utf-8?B?S3YvZ0lvK3VmMDVjTEI5UDM5bW92ZlZtTUdKcTdRTnNKVXdZZzFKeUN1ZFJo?=
 =?utf-8?B?MUFtUm4vNXRXT0pVd0tPOVlGMm0vYXNwOEpUazZyZTBzbDhCZDBiVmt2YzFh?=
 =?utf-8?B?UzVSUVpUK2V5OWlIdHZyRnhmV0ZOdUZwaVlLbStJZmYrQTNkR29uZTZKVmFV?=
 =?utf-8?B?SkN2TjNaU3B0Y2VsNG9ldjFXYi9PMElxUC9VR1I3eWVNVlpYeGgrYVB4aXpo?=
 =?utf-8?B?RSs5czZldHZUd0RQSWcrUXpiVHU5SHZTL051d2d2bC9JZzA0Qi9JOXVJeVFG?=
 =?utf-8?B?elZ4T2U2OUU5UFR5Y3JJYnJEYTlIbVBOZUc1WG9hay8xdTBrOXNlellIZUJ0?=
 =?utf-8?B?Ynp5UDhkYlJsUnVaTC94N3Y1NFRQNjNOcFIwVXBMSUo1YSsyUTFYSEJaWEE4?=
 =?utf-8?B?TFJJa1huVnh0MmlkNDgrUnB6Q3JuMnIxTVBTWk1QVDZUL0dnbDRlVjBDcWJC?=
 =?utf-8?B?ak9UdVlaVWtudi9ROTJsN2k4bm5XUjUyd0VUWE11bTdyY01rL1BEZlh0MTgw?=
 =?utf-8?B?cGNFVlR3VDh4YW1zbWVyd1R6S2hqWnRNTXQrOVJzUUNGVGUxQSs3VFdJQVp3?=
 =?utf-8?B?UnVMWE01bjFwL0VCcUtqQUhCWmp0d29YSC8ycjhrVzJWTVIrbTR1Wklsc0ZO?=
 =?utf-8?B?M2ZCYWV4QnNXZWhweGNpVXZnQ3ZsZTh4UTVOUVdjclhJZUVwdFE5Q2x3TDdF?=
 =?utf-8?B?dXVaN0VaRnRONXE0MTViREdYS2JPNTBzazM5bkxyWnFuTm5PWmxmb0ZTZS9s?=
 =?utf-8?B?NnF1cWVWS0xrb2xraE9DWkQwS2dINVlQT2RKa1NPbkNyY3IvRkZHUzRDT0Jy?=
 =?utf-8?B?VHpLWkVXU2FDZlo5RXRrajVab2g1L3FnTENjUjJyb2krZjJ1Yk9KRThPRWtP?=
 =?utf-8?B?bmYzYk41czM4clZSOXVFYm9sOHA0c3dOam5PL0hCc1RpdUl3VlpPNUhkSWV2?=
 =?utf-8?B?YjZqZUlxTWs2YW1GRVVUVnJiSjFOMG9vNHdueVJHSlk4TWIzQmRjekprK0JY?=
 =?utf-8?B?MmVtQ0ZMT2tkaFJMUUlxV09kWDQyUWFzT1JkKzFlV0Y1R1dlZ1JSZ2lScTZk?=
 =?utf-8?B?OXhHM3B4VW5kOTdSNjh5YitXOENjeTlSZGtzRFZEMlIzMGtEeE94M3hGazJY?=
 =?utf-8?B?Z1R5RnAzUE82UzZJbnhibllzRTZXUDhiY2JaOEdEdjdMdEROTzJCR282ek9K?=
 =?utf-8?B?UityeEFQZCtoZktEdThjeVJtNHUySERQMU1tN1VsZW1pRTVHb0h2aDFRazlM?=
 =?utf-8?B?RDQ3anFWTjl1RWhHRjlXTkEzQWRwY0pWc3dzcEtLTWJzNW11a2V2RnhyVTNW?=
 =?utf-8?B?VXpNbFNKZU5qOTFxdzdhbGpwOG5EeHFaeW1FdlJZaUtCWFovcnVXTDMvY3FT?=
 =?utf-8?B?UkdvTk5IMk9DYUN4Y09FSGx4bGc2TDFDOEZ1VzVEVyszdjFYcG8vVEJYNFox?=
 =?utf-8?B?bSs0MXBURmxtM0ZDczl2alEyczFDWFN2K1QzV0ZIeHpVWmpyaHhGUy9KWjM0?=
 =?utf-8?B?dDJtOTMxQ1NjcVpmcW9nWFdPZlVXYmMxK0FXcmx4Uk9MVFlkSXVwbmRzZGJK?=
 =?utf-8?B?dGFUWnFKeTJhTEx0LzJ0TWJVNXVDWm1lWkd2VmlhK0pOdGdNSXROZXBFK05F?=
 =?utf-8?B?ZWI2aVpJVUxibS83TC9ML0xYeVpjZTVFZGVGR0lUVEMyQ1ZaOGpLVG9VYWEx?=
 =?utf-8?B?b1JTenRWS0VTVWhaOFo1UTRabytEclQ3NkNXaUNFVVJXamowK2Z6VGpHY1Rx?=
 =?utf-8?B?TFFaczUwZlBGRlV1dUNMWVdrRkRtcExFOUx0SlFPRkdSR0xsZlBMdENVeFpV?=
 =?utf-8?B?anVoTGlrQzMzMVFMNUY1UFFpMGVhdUlZR3FaNmUveUNib1VXZlNWTzZ3L21S?=
 =?utf-8?B?TVRaZmFoNVhuY1FZV1BLNG5rMHhtS2NNbjBISDZKODYrWXRIeU9KL0pXeklT?=
 =?utf-8?Q?lklXiip+zbTvjt5Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbc159f7-bb38-4904-1089-08da5030d322
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2022 07:13:05.6598
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ULxRMuOR2sH12M4djy5aacNB6702lMFsSNartnYKKZ1F2XskvUFIibEEfcFjVpAY9lsmGxBrfPcE4hBIhFVX4xE8r3QwRn3wtmlb5CdtS/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2593
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQgYW5kIFJvYiwNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkdC1iaW5kaW5nczog
dXNiOiBlaGNpOiBJbmNyZWFzZSB0aGUgbnVtYmVyIG9mIFBIWXMNCj4gDQo+IEhpIFJvYiwNCj4g
DQo+IE9uIFdlZCwgSnVuIDE1LCAyMDIyIGF0IDc6MjQgUE0gUm9iIEhlcnJpbmcgPHJvYmgrZHRA
a2VybmVsLm9yZz4gd3JvdGU6DQo+ID4gT24gV2VkLCBKdW4gMTUsIDIwMjIgYXQgNzo1MyBBTSBH
ZWVydCBVeXR0ZXJob2V2ZW4NCj4gPiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+IHdyb3RlOg0K
PiA+ID4NCj4gPiA+ICJtYWtlIGR0YnNfY2hlY2siOg0KPiA+ID4NCj4gPiA+ICAgICBhcmNoL2Fy
bS9ib290L2R0cy9yOGE3NzQ3MC1pd2cyM3Mtc2JjLmR0YjogdXNiQGVlMDgwMTAwOiBwaHlzOg0K
PiBbWzE3LCAwXSwgWzMxXV0gaXMgdG9vIGxvbmcNCj4gPiA+ICAgICAgICAgICAgIEZyb20gc2No
ZW1hOg0KPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2dlbmVyaWMtZWhj
aS55YW1sDQo+ID4gPiAgICAgYXJjaC9hcm0vYm9vdC9kdHMvcjhhNzc0NzAtaXdnMjNzLXNiYy5k
dGI6IHVzYkBlZTBjMDEwMDogcGh5czoNCj4gW1sxNywgMV0sIFszM10sIFsyMSwgMF1dIGlzIHRv
byBsb25nDQo+ID4gPiAgICAgICAgICAgICBGcm9tIHNjaGVtYToNCj4gPiA+IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvZ2VuZXJpYy1laGNpLnlhbWwNCj4gPiA+DQo+ID4g
PiBTb21lIFVTQiBFSENJIGNvbnRyb2xsZXJzIChlLmcuIG9uIHRoZSBSZW5lc2FzIFJaL0cxQyBT
b0MpIGhhdmUNCj4gPiA+IG11bHRpcGxlIFBIWXMuICBJbmNyZWFzZSB0aGUgbWF4aW11bSBudW1i
ZXIgb2YgUEhZcyB0byAzLCB3aGljaCBpcw0KPiA+ID4gc3VmZmljaWVudCBmb3Igbm93Lg0KPiA+
DQo+ID4gTWF5YmUgbm90IHNvICdnZW5lcmljJy4gV2h5IGFyZSB0aGVyZSAzPyBJIHVuZGVyc3Rh
bmQgVVNCMyBIQ0kgaGF2aW5nDQo+ID4gMiBmb3IgU1MgYW5kIEhTLiBJcyBpdCBmb3IgbXVsdGlw
bGUgcG9ydHM/IFRoZXJlJ3MgYSB0aHJlYWQgYWJvdXQgdGhhdA0KPiA+IGN1cnJlbnRseSAoTWVk
aWF0ZWsgSUlSQykgYW5kIGhvdyB0byBoYW5kbGUgbXVsdGlwbGUgcGh5cy4NCj4gDQo+IFRCSCwg
SSBkb24ndCBrbm93IGZvciBzdXJlLiBJJ3ZlIG5ldmVyIGJlZW4gbXVjaCBpbnRvIFVTQiwgYW5k
IHRoZQ0KPiBSWi9HMUMgVVNCIGFyY2hpdGVjdHVyZSBkaWZmZXJzIGZyb20gb3RoZXIgUmVuZXNh
cyBTb0NzIGluIHRoZSBzYW1lDQo+IGZhbWlseS4NCj4gDQo+IFRoaXMgaXMgVVNCMiwgbm90IFVT
QjMuICBUaGVyZSBhcmUgdHdvIGNoYW5uZWxzIG9mIE9IQ0kvRUhDSSwgYW5kIHR3bw0KPiBjaGFu
bmVscyBvZiBVU0IgT1RHLCBhbGwgd2l0aCBjb3JyZXNwb25kaW5nIFBIWXMgKDQgaW4gdG90YWwp
Lg0KPiBUaGUgZmlyc3QgT0hDSS9FSENJIGNvbWJvIGlzIGxpbmtlZCB0byBvbmUgb2YgdGhlIGhv
c3QgUEhZcywgYW5kIG9uZSBvZg0KPiB0aGUgT1RHIFBIWXMsIHNvIHRoYXQgbWFrZXMgMiBQSFlz
Lg0KDQpZZXMgMSBIb3N0IHBoeSBhbmQgb3RoZXIgT1RHIFBIWSBtYWtlcyBpdCAyIFBIWXMuDQoN
Cj4gVGhlIHNlY29uZCBPSENJL0VIQ0kgY29tYm8gaXMgbGlua2VkIHRvIHRoZSBvdGhlciBob3N0
IFBIWSwgYW5kIHRvIGJvdGgNCj4gT1RHIFBIWXMsIHNvIHRoYXQgbWFrZXMgMyBQSFlzLiBJSVJD
IHRoZSB0aGlyZCBsaW5rIHdhcyBkdWUgdG8gc29tZQ0KPiBkZXBlbmRlbmN5IGJldHdlZW4gdGhl
IDIgT1RHIFBIWXMuDQoNClRoZSB0aGlyZCBQSFkgaXMgYSBkdW1teSBvbmUgdG8gaW5pdGlhbGl6
ZSB0aW1pbmcvaW50ZXJydXB0IGdlbmVyYXRpb24gcmVnaXN0ZXJzDQpieSByZXVzaW5nIHRoZSBw
aHktcmNhci1nZW4zLXVzYjIgZHJpdmVyLg0KDQpSZWdhcmRzLA0KQmlqdQ0K
