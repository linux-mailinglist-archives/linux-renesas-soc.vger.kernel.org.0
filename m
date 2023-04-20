Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D7FC6E98BD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Apr 2023 17:49:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232671AbjDTPt5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 20 Apr 2023 11:49:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232541AbjDTPt4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Apr 2023 11:49:56 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2107.outbound.protection.outlook.com [40.107.114.107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2084E2;
        Thu, 20 Apr 2023 08:49:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bEPlHanKQnx1xCPjmkb7Mtr0BJ6OI4YQnlJiajNlkEwV+tXplqnd/P90Djbn7uwN4RZ9UJdrXNG7jIs1FZ59UA07WQ6owyPuPtq9tUjlKjruucPaVEwKUR2rD3CBsUjymnty/WAetSrs9KcC+NLvL1eJ6ExLLlY/wjpyzkMpMjsQZ315qCQjN3fJ2cTKPXnDwNuiyGgU0wFsQsiMhIVpj2jXOmuD2UfLM7PBaSS2vtDLbREV3t37HdAzWj/8W6hlDMDGtiaVzgy3JIKnssc9wNo0cz5YyA/NnT6ZKRWCttc8wQiN3THwiKpehcGaXQSiNTVtVXvJR2+tUqwnNMi13Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QrBP1K2BGt1qRYb/5aERpxP42xBAtCnuMnU3EibiFOg=;
 b=aMgqghaqAEmUQDUtwvZ1r1EQZeRrMVeAAXh3kSacXTmcxvxI4fFAdIytuWo4S0j+t0nlqZFwYmZhVP/Vn/b/Qzz7xRdDiHj/pKS/UPxnUFKEpSTvJETuAZYPYJd9IC6DCvxxqujqZ+ubSR17sVhPdgNhrE/y6bY1lkFYRdI38x37FnjO4+3H2I/w0zMgmnIMcHzKiG90rE5BQfM4GQJhjSraMBUsnvDcLL9g/gWMBYjN2Mc1cL6syWVS0B8XWCqZhOt6/EO9Y8K36WoUF4CllnemMuFpNn3xvlxkn9rz7B4i0pD2aSacDQLM5eMYD9o4WQhxtYGF9p6sXW5UZ/Bi3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QrBP1K2BGt1qRYb/5aERpxP42xBAtCnuMnU3EibiFOg=;
 b=YYOCWBd1kj/OKpDtIw9zocjtvhdYxlxLNvOO5QtYhn7vj1RMFD7G6OisJDN6E7ZdQCEvQQ+SuXLQ+oBabNZqG2685ugTjp8SGn8t/fxTEWLU3bGwPpISL3AAxR1FPz0gISowWd4I5AiazdtF14pEMoZuWTJ+UZ3/UHJ11YEEKmE=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYAPR01MB5307.jpnprd01.prod.outlook.com (2603:1096:404:8041::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 15:49:50 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 15:49:50 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 3/3] arm64: dts: renesas: rzg2l-smarc: Enable MTU3a
 counter using DT overlay
Thread-Topic: [PATCH 3/3] arm64: dts: renesas: rzg2l-smarc: Enable MTU3a
 counter using DT overlay
Thread-Index: AQHZcQtLK6/JZK1zYUeFXuixSTqo8q80WqqAgAAATSA=
Date:   Thu, 20 Apr 2023 15:49:50 +0000
Message-ID: <OS0PR01MB59221C7EE8ECA83F1892360E86639@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230417090159.191346-1-biju.das.jz@bp.renesas.com>
 <20230417090159.191346-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdXQ9NLra76pknQ+ASNiRVK2RWSh2jG=Ub+tZpC6uiwK6g@mail.gmail.com>
In-Reply-To: <CAMuHMdXQ9NLra76pknQ+ASNiRVK2RWSh2jG=Ub+tZpC6uiwK6g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYAPR01MB5307:EE_
x-ms-office365-filtering-correlation-id: 87790f5b-4563-4310-59fd-08db41b6e071
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VBxFrJwyxWeesWJJPYwViSapeVOTarTIZY6ARLQS3eK4ys0yoyuSZ3QYXc6+OVjiULGm2jxZaN4RHWP8trSCNHrG2CnfXbAGJEWXRk8637jjLG8gmtaQqU5gtqacoHnO3hkUYgOXXG1wswO89h9rdbG5zuLpw57DYQguo/JUjtz6hF2RsSJfbOrFeyobq02YvmbfRgoPFjMjakSRe1z8nJ0+FqGVcgO7LxBjjm+zfsWy+b0uAxFiH/KOdCL1HB0/WYOLhlirpuQeN7MAfLxypAdLNYoZAJHZ6KIHe0sDPBij2F3OsyJ2bV3t04tsdFUCrEev3zZh6wNhC7ERLIAdsqvy/+jrNNK7Nxprp/IN/rnQu70ypP7t+FjNFXpvJgn81oczo04jCeDoqsBybplC+7FsQpQqQadlZIuFXks4YngoBcHCnSDYXT1Q16RMsIHFmboV3nrPjqLXy0cLm1cy1hSW3WKUpiconoGKkwr94HPWXBkUQ9+3fk+EdmuXXXU1CGUa6DM5S1j3z1ZWs/O5LmKR8nbUHmFTs77FThxvnQxfxUqUtLVL2X3d0DaFhV/LwfJbVnLtIWBFjGDiGGlktKxw7z1w9jWZQcmtIZ0EQrsnObRLXixL2xY5flwbaAyvuJqbpWli2rlqtD9Q2wgsTA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199021)(55016003)(66556008)(64756008)(6916009)(66946007)(66446008)(4326008)(66476007)(478600001)(316002)(54906003)(8936002)(5660300002)(8676002)(41300700001)(52536014)(122000001)(38100700002)(76116006)(53546011)(186003)(83380400001)(71200400001)(7696005)(9686003)(107886003)(6506007)(33656002)(86362001)(38070700005)(2906002)(32563001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RFJHRVlrR2w3TmNqemlic2YveXNjcFZIWnUrejRReTVkT2ZIV0V0Y0lhZk51?=
 =?utf-8?B?b2hSOXY5eGFTMVJoRkptSDFuMStvUTlsQlhNOC9qOWRycmkyMU8zOU5Rby9t?=
 =?utf-8?B?U2ZxMkdHY2xYRG5EcEU2Q1p6QTFraGtyenF1L2NIZXdRbzFOOS9DNTNuTmU4?=
 =?utf-8?B?TDRjY1hYdHE3RTB2QXhManFWZmoxNWZzN0ZzSFNqNmNNSWMvT2E4REYySVYr?=
 =?utf-8?B?ZlMvWStLcm5maFc1ZnBRZTkveFJvR0xwMjkxNzJGMWJlcDlJdG1tMk1DY0hM?=
 =?utf-8?B?Y0w1UWFhMmxoRlBhM2N6S05oSDdMeG9zMWdrcWE0RUYvVTY2UE1nUE5LVDZD?=
 =?utf-8?B?Vm1GY1ZyeDZwOXB1NW4velBidjJpVnFjbU5FalZsNFlNVG1GenVsM0tWeVZC?=
 =?utf-8?B?RWNBRWRtb3JVWDFBY1NLSVlxVXVNb1Fld3FTZXJDMEgzbHQwYzdVS3p3b3lF?=
 =?utf-8?B?TnUvc2ZFczd1bS9aTGVBUVZzMEM1V2VvTlFwWW9NTXJpWkVvdHZIQ3JTWkpa?=
 =?utf-8?B?Y2U4TGdQVm9ra0tYMDVHYVgwZ2JSanYwTlJRTDAybTYzRlp2YUt2ZjZmZERR?=
 =?utf-8?B?OHkycUlFMzhaUjJ6cU90SjdrM3UyT2cwQkVVUkhKdGRrSGYrTXZUbjFFUmhZ?=
 =?utf-8?B?d3puZGJGYW45cEFoemR6dFFCWGpBeGVFd3lBc2dVQytTYkJ1VDdmcVJMUmRF?=
 =?utf-8?B?MUJLbkNLYjQ0aDdPZjh4TDhTcHdFa1VpOFc5K0dXbjZmaWEvY2tWdVRrZ29T?=
 =?utf-8?B?ejU1K0Q4eXdGWTRGcnpMQkFOdWZTbks4emxyWi9XVWFRSEpwT3VBWnpzMW5J?=
 =?utf-8?B?TDFDRStHRzU3N3ExOHhyRW5PcnBlV1BWdGFiVjdwZmUrcTBJVjhuMnVibVZ4?=
 =?utf-8?B?V2NsQVUrNW1YNGdPaHorWlFpaUsvbktKZm5LN0hTK2cvQUpCWVNxNS94YmpH?=
 =?utf-8?B?UXRqMlpKZXFMV01jTWMvRDFMQjVXSlJxNy8yS0tVVlFpZkd0NG9yL2dqbk1K?=
 =?utf-8?B?c0F5ZVVwSUpYcVkxZmo1R3V2L0dLOGR0MW5jVXl5SEVYUFJYU0NwVXNnTXNQ?=
 =?utf-8?B?RHZuMFFlSFZnWk1TL0NHVmJHV1hmalFDUk11ME5YTTFkU0VlaEprODVtQVd4?=
 =?utf-8?B?b3BRZDloZWcxYkFuQm92bGJpYUpZSHFUM1ZNL0N4U080WUo0YUk5UjNwWjk5?=
 =?utf-8?B?akhvM2xIMEprc2MrbjFMSkVpWU40bVVHZ2xPL0V5RFNlNk9CR2pwSForWjNN?=
 =?utf-8?B?OU94YllkMXFQRk4vR1VQN3o4bGtuR1NoTndHSTdOWnVFK042ZGRBRGtoUG80?=
 =?utf-8?B?SmgwNVcyUnJWcDN4MFNNZThCL3pqNTdpWmNEUjJwdHRvdUZ3d0I4ME1BOWJT?=
 =?utf-8?B?WFlIQnJqamdjYmJ4MDY3UlY1b3phSFFBSVAwZmJ0bGtpdzVhVlVvQ1JSYVc2?=
 =?utf-8?B?TDR6K0RZWERBQjZDU09RdENyYytZSGorVDA3aUhLYnV4UnRtZkcrWUxJQUp3?=
 =?utf-8?B?WjNXbHpKNGhGMzd1bVZ1RDBLZGV4cnpFMHZZejNlK1FOWmVMd1RCMG9mMW1H?=
 =?utf-8?B?ZTFHM2owdTVsYTZuSkx3YzZRbmx5cy90Mm45QjdRWnZYMlZCcloyWkdLdDBU?=
 =?utf-8?B?ckNvYThPeC9rSDFZRnZFYXRoNUZaZDNxSVJ1RlkycXp6dzhyemZXeDcxcjhP?=
 =?utf-8?B?V3h2SVRJeUVkT25ZU1kyQXQ4VUNkREdGb3RvdjhENXF0anJxNEkwcHdzRGFu?=
 =?utf-8?B?SDFlYUdLbzJFTzdyN1gwY0lzd3pvUGYyS1pvUStFdjZLaWdybEI4NzNaY1Ro?=
 =?utf-8?B?M0NWeUNBay91Yis2TnZ3WUZ3ZTRIc0JDNU5PTGQ5QVo2YWVDNlNQdmlqdG5B?=
 =?utf-8?B?ZlhzN0FucDcyV0lyb0FvZDQrRXRMMUlTRzUyc25JTXM2WEJ3eW1YSVhiZ2Z3?=
 =?utf-8?B?MHl0TzF1eDdubjhybit0LzQwYlBVM3YvaWsvdVhWdi9xUFJyYVNFZ1ZNbTdP?=
 =?utf-8?B?TWdXdDNCSVVzWVlmRXFRcHBkQ1Y3UGtoOHpDUWlRUFFlOElXL0UzTGNGUFh5?=
 =?utf-8?B?TENVMERzODNtU2RZZUE3NzdaN1I4dExWTlo5ZjBwVVBQbEVVKzJXZjZibVJU?=
 =?utf-8?Q?tsRY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87790f5b-4563-4310-59fd-08db41b6e071
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2023 15:49:50.8245
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z1BPLwjUeA4oTEZXtDR531JS9HW2nD4eJUEH/UZKG9qgYb79+BohR1S3MgHNG9NZsBhzK6jiiPyIgTx/o1C+ac4njQg9p6f8IQD+3Vui6Cs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5307
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBBcHJpbCAyMCwgMjAyMyA0OjQwIFBNDQo+IFRvOiBC
aWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IENjOiBSb2IgSGVycmluZyA8
cm9iaCtkdEBrZXJuZWwub3JnPjsgS3J6eXN6dG9mIEtvemxvd3NraQ0KPiA8a3J6eXN6dG9mLmtv
emxvd3NraStkdEBsaW5hcm8ub3JnPjsgR2VlcnQgVXl0dGVyaG9ldmVuDQo+IDxnZWVydCtyZW5l
c2FzQGdsaWRlci5iZT47IE1hZ251cyBEYW1tIDxtYWdudXMuZGFtbUBnbWFpbC5jb20+OyBsaW51
eC0NCj4gcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVs
Lm9yZzsgUHJhYmhha2FyIE1haGFkZXYNCj4gTGFkIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpA
YnAucmVuZXNhcy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMy8zXSBhcm02NDogZHRzOiBy
ZW5lc2FzOiByemcybC1zbWFyYzogRW5hYmxlIE1UVTNhDQo+IGNvdW50ZXIgdXNpbmcgRFQgb3Zl
cmxheQ0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIE1vbiwgQXByIDE3LCAyMDIzIGF0IDExOjAy
4oCvQU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4g
PiBFbmFibGUgbXR1MyBub2RlIHVzaW5nIGR0IG92ZXJsYXkgYW5kIGRpc2FibGUgc2NpZjIgbm9k
ZSBhbmQgZGVsZXRlDQo+ID4ge3NkMV9tdXgsc2QxX211eF91aHN9IG5vZGVzIGFzIHRoZSBwaW5z
IGFyZSBzaGFyZWQgd2l0aCBtdHUzIGV4dGVybmFsDQo+ID4gY2xvY2sgaW5wdXQgcGlucyBhbmQg
WiBwaGFzZSBzaWduYWwoTVRJT0MxQSkuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERh
cyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0
Y2ghDQo+IA0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRz
L3JlbmVzYXMvcnpnMmwtc21hcmMtcG1vZC5kdHNvDQo+ID4gQEAgLTAsMCArMSw0MyBAQA0KPiA+
ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiA+ICsvKg0KPiA+ICsgKiBE
ZXZpY2UgVHJlZSBTb3VyY2UgZm9yIHRoZSBSWi97RzJMLFYyTH0gU01BUkMgRVZLIFBNT0QgcGFy
dHMNCj4gDQo+IFBsZWFzZSBhZGQgYSBjb21tZW50IGhlcmUgdG8gZG9jdW1lbnQgd2hhdCBleGFj
dGx5IHRoaXMgcHJvdmlkZXMuDQoNCk9LIHdpbGwgYWRkLg0KDQo+IA0KPiA+ICsgKg0KPiA+ICsg
KiBDb3B5cmlnaHQgKEMpIDIwMjMgUmVuZXNhcyBFbGVjdHJvbmljcyBDb3JwLg0KPiA+ICsgKi8N
Cj4gPiArDQo+ID4gKy9kdHMtdjEvOw0KPiA+ICsvcGx1Z2luLzsNCj4gPiArDQo+ID4gKyNpbmNs
dWRlIDxkdC1iaW5kaW5ncy9waW5jdHJsL3J6ZzJsLXBpbmN0cmwuaD4NCj4gPiArDQo+ID4gKyZt
dHUzIHsNCj4gPiArICAgICAgIHBpbmN0cmwtMCA9IDwmbXR1M19waW5zPjsNCj4gPiArICAgICAg
IHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+ID4gKw0KPiA+ICsgICAgICAgc3RhdHVzID0g
Im9rYXkiOw0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArJnBpbmN0cmwgew0KPiA+ICsgICAgICAgbXR1
M19waW5zOiBtdHUzIHsNCj4gPiArICAgICAgICAgICAgICAgbXR1My16cGhhc2UtY2xrIHsNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICBwaW5tdXggPSA8UlpHMkxfUE9SVF9QSU5NVVgoMTks
IDAsIDMpPjsgLyogTVRJT0MxQQ0KPiAqLw0KPiA+ICsgICAgICAgICAgICAgICB9Ow0KPiANCj4g
VW5sZXNzIEknbSBtaXNzaW5nIHNvbWV0aGluZywgdGhpcyBzaWduYWwgaXMgbm90IGF2YWlsYWJs
ZSBvbiB0aGUgUE1PRA0KPiBjb25uZWN0b3I/DQoNClllcywgaXQgaXMgbm90IGF2YWlsYWJsZSBv
biB0aGUgUE1PRCBjb25uZWN0b3IuIFNEIGNhcmQgZGV0ZWN0aW9uIHNpZ25hbCwNCmlzIG11eGVk
IHdpdGggTVRJT0MxQSAoWiBQaGFzZSBzaWduYWwpLiBTbyBmb3IgY291bnRlciB1c2UgY2FzZSwg
d2UgdXNlIGl0DQphcyBNVElPQzFBIHBpbnMuDQoNCj4gDQo+ID4gKw0KPiA+ICsgICAgICAgICAg
ICAgICBtdHUzLWV4dC1jbGstaW5wdXQtcGluIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICBwaW5tdXggPSA8UlpHMkxfUE9SVF9QSU5NVVgoNDgsIDAsIDQpPiwgLyogTVRDTEtBDQo+ICov
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPFJaRzJMX1BPUlRfUElOTVVY
KDQ4LCAxLCA0KT47IC8qIE1UQ0xLQg0KPiAqLw0KPiA+ICsgICAgICAgICAgICAgICB9Ow0KPiAN
Cj4gU28gdGhpcyBwcm92aWRlcyB0d28gZXh0ZXJuYWwgY2xvY2sgaW5wdXRzIG9uIHRoZSBwaW5z
IG9uIHRoZSBQTU9EIGNvbm5lY3Rvcg0KPiB0aGF0IHVzdWFsbHkgcHJvdmlkZXMgYSBVQVJUPw0K
DQpZZXMgdGhhdCBpcyBjb3JyZWN0LiBVQVJUIHNpZ25hbHMgYXJlIG11eGVkIHdpdGggZXh0ZXJu
YWwgcGhhc2UgY2xvY2sgaW5wdXRzLg0KU28gZm9yIGNvdW50ZXIgdXNlIGNhc2UsIHVzaW5nIHRo
aXMgb3ZlcmxheSwgd2UgdXNlIGl0IGlzIGFzIGV4dGVybmFsIHBoYXNlIGNsb2NrIGlucHV0cy4N
Cg0KPiANCj4gPiArICAgICAgIH07DQo+ID4gK307DQo+ID4gKw0KPiA+ICsmc2NpZjIgew0KPiA+
ICsgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsNCj4gPiArfTsNCj4gPiArDQo+ID4gKyZzZGhp
MV9waW5zIHsNCj4gPiArICAgICAgIC9kZWxldGUtbm9kZS8gc2QxX211eDsNCj4gPiArfTsNCj4g
PiArDQo+ID4gKyZzZGhpMV9waW5zX3VocyB7DQo+ID4gKyAgICAgICAvZGVsZXRlLW5vZGUvIHNk
MV9tdXhfdWhzOw0KPiA+ICt9Ow0KPiANCj4gQXMgeW91IGRpc2FibGUgQ0QgZnVuY3Rpb25hbGl0
eSwgZG9uJ3QgeW91IG5lZWQgdG8gYWRkICJicm9rZW4tY2QiIHRvIHRoZQ0KPiBzZGhpMSBub2Rl
Pw0KDQpPSywgd2lsbCBhZGQgImJyb2tlbi1jZCIgdG8gc2RoaTEgbm9kZSB3aGlsZSB1c2luZyB0
aGlzIG92ZXJsYXkuDQoNCkNoZWVycywNCkJpanUNCg==
