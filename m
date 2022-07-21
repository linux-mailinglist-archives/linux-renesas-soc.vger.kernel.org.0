Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BD1F57C7F6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Jul 2022 11:46:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232345AbiGUJqh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Jul 2022 05:46:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229982AbiGUJqf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Jul 2022 05:46:35 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2129.outbound.protection.outlook.com [40.107.113.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 878CB814B0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Jul 2022 02:46:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h/Z6yNLcdG62aaNjT8YJqjRuRzONrUlNWWvMCzvCwFg/lvPMEil0W4J9EmD4rAy4RlxpBAo3Zw8r80LSJQbybvNxCCJA5Ws5Fa9SfSRsYHzteumKYYFj5QYK8ky91bBQJdjZB3YY+8cwssus7dU4qPDAeBtmaU55ovwFg2G2XfO+Km5SkQ67fe8jSQpIBs1ONPLR4SXEjwcDTy2To7ft4p7heOA16LQ3hbssvuqYlXwB10jbTC510VKglWjWWwOHG/OsfX9jQ4xadeU5WkWaMZLhfT2k0Fm9QA0uudqi5TMZ5+aSjfX84hwF6SKuF4aMe6JjpZrcAdvl+ky2yUx00g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=be6BPuFsLPhX/I2cpwJJX+xkzUN5oySoqooXpWHIou4=;
 b=Lgt7OZQfQ7AgmIO00tzn94WSrz3VtpHkOiBolrB/nd/I7pH1+K7iU8biTV/AGUb99v3XBAFtnLqk3JiGGbvLjhFM/cauY7BjhQOeGHZqgQRsqoGM3FNXpm3FpQeBLpA/ogXC/0ysur2JuZ4lC5Xth3fyEAea//KJUCqeLMHTseJevVqwxEVuo7VKrq3VG0lAA42qTYd9lTJgdVyDoD7kvqGu9exWYd558ee/zCq8OV5YqRNpqMNNH1bAM00NWta+ILxYdblZZe5Vm+UuwOju+RhiHedIs+twuDpTbO2vVfzb9f/B1Lvi0M6BbFN6clOi1Zb4S0sHcyYYZdYK0nlTBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=be6BPuFsLPhX/I2cpwJJX+xkzUN5oySoqooXpWHIou4=;
 b=LKdBj7rwrSVNvoQbxLxi8hfFAZI2sztrmxk7k0wDL2PjymnxXaPxQGJfgj8/Mw8Q1ElLajmIAsFBkEAnIPLDXlOHT725U5AT6GceD/5RisrIjHWR38hjfHvH5hjH9nhOfn3nSRXuge726wYIjSBKaX7xnQjurFdFJkRm0DxB3mA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYYPR01MB7782.jpnprd01.prod.outlook.com (2603:1096:400:117::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 21 Jul
 2022 09:46:31 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5%4]) with mapi id 15.20.5438.025; Thu, 21 Jul 2022
 09:46:31 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>,
        "p.yadav@ti.com" <p.yadav@ti.com>,
        "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
        "richard@nod.at" <richard@nod.at>,
        "vigneshr@ti.com" <vigneshr@ti.com>
CC:     "michael@walle.cc" <michael@walle.cc>,
        "Nicolas.Ferre@microchip.com" <Nicolas.Ferre@microchip.com>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "Claudiu.Beznea@microchip.com" <Claudiu.Beznea@microchip.com>,
        "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        "biju.das@bp.renesas.com" <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] mtd: spi-nor: Add Renesas AT25QL128A serial nor
 flash
Thread-Topic: [PATCH v2 2/2] mtd: spi-nor: Add Renesas AT25QL128A serial nor
 flash
Thread-Index: AQHYmDmxaDGaoLXUcEiJUkRa88raCq2Ih1KAgAANRmCAAAaeAIAAAKdg
Date:   Thu, 21 Jul 2022 09:46:31 +0000
Message-ID: <OS0PR01MB59221FE257A0E06F225AB6B686919@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220715105716.2415068-1-biju.das.jz@bp.renesas.com>
 <20220715105716.2415068-3-biju.das.jz@bp.renesas.com>
 <7aa7de93-23f0-c94a-bfc3-e79321cdc1f9@microchip.com>
 <OS0PR01MB5922F0D52EACD4686768117686919@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <785e50c4-3c8c-a1a6-de60-4587aef820a8@microchip.com>
In-Reply-To: <785e50c4-3c8c-a1a6-de60-4587aef820a8@microchip.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45d3aa31-27e8-43e7-c055-08da6afde451
x-ms-traffictypediagnostic: TYYPR01MB7782:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PKxzjicpmJRW48rESc8pPT0GRhDt4Dg1cvP+ojR8BeBudMfhDaCinreJqejUJq2Ng57WUL5mjKKyf9busVxXuYUtf//MiWEFD0OJUvdj9vwPbbx/DTZEV6fDLxR/fLQ2HkryQ9sdbRBp5L3JxP1uhYrhtX5hW7gfVB3ePyWaG80AYulKuqqB10cy7HOztiSmiXHi8sGvz4vWC5bJy5USl0ZB9S43G+jq+c5WuJvHUZZayKSuAl4W6wr3Wbd+Q8qZjfdu+4A7SFZsiZUT6macDXsd8xdMT1/Vf/3dvoxzSBOBiNMeedLCAQmf8Od/a1HcN8i258oFMm2YOJCIIdBO/lOy8BgAhlp1hPY83k3X2KkRyD4XkfXm3kpz8zT58kNUJYt+5Fri0nc6DDpzJ5itk1/RvUAecez0HZJpel3ccghhrGby78SVefiJxDioMUY1YmvVhkIQOZ5kBysinJy8v5+JvBlBEqR4NHTOP+9Jjf90lGPKMcxi4nBuDY/ceMkSsbAIWDd+g2ORv8pbNd1SO46sq2jTb+R+7Z+9t2fwEWkdeUJ8L76p8Iryb4cSoBZ0O8NLlTw8VNwcWY7lYC/fyI+xjvQgUCYXg4/p5dLCo42dG4FeThHPJ8z8+hgWpYvUSa9nGBuhcgMvzYSYJehJXHgvxc/KbONDm+kIIzSFMWAxj3I8LIMx47944ZXlTnozj1GKzN1i+yIXZA6k9fnMHnAPpWRlOgDsXfc+B923524ANjUgK+EFlZxm23Kix7v+Oj2VocSmMcuedZ+1PWSS4dYtpye7niXGLiya7av1QIXf0ZKvwPL7X+QDa20u5vuQ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(478600001)(71200400001)(86362001)(41300700001)(38070700005)(53546011)(7696005)(26005)(6506007)(110136005)(186003)(83380400001)(316002)(54906003)(66446008)(55016003)(4326008)(66476007)(66946007)(76116006)(7416002)(66556008)(5660300002)(8676002)(8936002)(9686003)(33656002)(64756008)(122000001)(2906002)(38100700002)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UEpHSkhVVkw5WnNIOW5yek0zSlY3U3N2V1RIQ0huWTNDS2wxRkpwR3lvNXRx?=
 =?utf-8?B?YmpqNW96YS9SZjhNNVNzcHZZRXVSSEluNXZpYWNSUzNzUzlyUGxyNnp1ZStH?=
 =?utf-8?B?MmlmNTNYYVpxNU5FbHQ2cVFVd2JUckFXUEdnSE8vRWpjOWhydE5lTmx1QTEr?=
 =?utf-8?B?SVhuY3dURmhYZ0NxcTk4cStmTENHTXhFcXhkSHllS2Y5V2lTZFM1T3FzdFUr?=
 =?utf-8?B?RHVxdkRGaFlDT2ZSU0ZSbGFFc0FVdlFYeEFacytXNThWVXJxUjNud1d3YW5h?=
 =?utf-8?B?ZXNoK1Q5bTdXYXM0UVYyV0VCOGg5M2U2Q3hESFR3ckxRRk92bFRKSDhlWTdo?=
 =?utf-8?B?OXBuMzRhNU12SzVuTUVYQ1ptU2dHWGhjUE5MZThUNVZQTERuTjNxdnVhODlv?=
 =?utf-8?B?TUluN3dyamhJMWE3dFl0ZHpjcXQ1TDFEVldhaVJ4dURXdy9oZzB6M1VLWFBt?=
 =?utf-8?B?ajFNaUU2T1BNYW5pclhxOCs1WjJHS05iSTdMbUk1SUl0SUZmcFJKTjhxanc2?=
 =?utf-8?B?eGlLM041N3p4eU5uVzBHdlcvSzVtYms2dnN1YmVRZXdSK0h4bm1CTCtRK0Mx?=
 =?utf-8?B?VDFGYXc5TEhmeXRkUmlUazltR0NwQUJpRnFRa2QxYmZCdk9xOXQ0LzNRRFo3?=
 =?utf-8?B?TDZ5ajZxWTY5LzRTVXRTMlBtMDBQbXErblFRVXVMOWVnMFVhcE9VN0VzQkZL?=
 =?utf-8?B?aEhpcUdqNVZ2cSt0UWpnWmpESVRYYmQ5dXcrRjEweEhYbkdiS0EycFNtNkhp?=
 =?utf-8?B?QThINXBsSVpMcVNKN2pFOHluQmZqckRPZVFGdXpCVVdLN0lsS2pNSTcvZHhr?=
 =?utf-8?B?UWpCdHZKclpBQXZlVGt2dEp3cnJIVzE3ZE9Sc3o0eW9ZdlN3S2p4aFkxNHVL?=
 =?utf-8?B?elNKV0I5MDA1YXQzRUxsVWZyWlFrRXFWRnNRdjV3V2FoeHplU2xmUWJMZ3dw?=
 =?utf-8?B?ekY1Y2Q1NzJ4bjhCcXhwRTZLcDVCUm9OKzFsQkMzeCtsNThLSGdQdkpUdDkz?=
 =?utf-8?B?UHhrTXZNeUJlY052WUl5VWhYMFEwVjRXRWNmMURQb0RWWW9qTWVSbHNMQkc4?=
 =?utf-8?B?TVF1ckd0QjdWMDQzUHBrMTFPdlY4L3VjK2E5c0hFbXJHTWlQTjBwK1FxV3hV?=
 =?utf-8?B?YXBUa1FHd2YrVjRVTUU2VXQ1Q3Z3UklZcFlQd29qdG1vZFVoSFZldzhYc0Zr?=
 =?utf-8?B?dGVjWXhYcEEvRVJBSzRqVFVjelBIOFBucDdBTWs0UFJPUkZJblJTUGdwMTRz?=
 =?utf-8?B?U2x6S1V1NHdJT0xWZFNreUFUNGRnNlpSR3lKOWtvMGU0N0J3YTB4c3o3bi9B?=
 =?utf-8?B?d2FsdE56QkFSSmdnaVA3VUFFU0VSTHVEc2cxRGtjaEo1ODY2dVcrQkRlNWV0?=
 =?utf-8?B?V1B3SXZXaC9EeWxyVXZRWDlTM0VsemdhNUZuTEdOOWJKWVEwRkdJS3BIQnVP?=
 =?utf-8?B?MjQxU2cxVVJmS3Ura3E3dCs4am9nR3ZETHRpNHlncEhFWTkzNEZqUWZsT0Vq?=
 =?utf-8?B?Zm5DcDVJdnBVaEZkNVRwdEdpejBQTlhvV09BZFZVaFRWOFF2OWxTY0s2Umtk?=
 =?utf-8?B?aWplaFp4VkZPSytLTURFRkVxc3J3SVpYTTJqMUdHSUE1WEZRbW1HY0cyRDAv?=
 =?utf-8?B?MjZCbjdzcGtWZFlYcEFQc2dJSXJQeVNUOXA0ZXAyVU9Haml0VU9jREVaQURr?=
 =?utf-8?B?M0FKd0VCSlh1UUY0WlF3SEcvZFVtcDFGSkR5UjNNSGY1d203ZEhsZGhKMHNK?=
 =?utf-8?B?UXVpWlVDKzN3TzBKaXg4Y0czRHR6aE9rMmFjMTY3dU5EdmRyUGowMFZmK201?=
 =?utf-8?B?NlB6Q05wU25aWDc4SXdDdU9LanVha2I5SWQ5RHFRYTFVRmdHWG5yOTZjVnYv?=
 =?utf-8?B?bXFFS2MySENlUjYrTzBuMU4xd1JTV0J4OUNSWnNsVUpCSEdQQkxNWDhUd2Vj?=
 =?utf-8?B?VUVkVVM5R3FsVE5XUVJwZURCS0Q3NVBjYWFtQmlsNFlDWVV4OXYwZ1FXRWdj?=
 =?utf-8?B?UVpHdk1ERjRVdU43RVRjYmFaa0JCNjZrYm9KTFhscTdoYXFFcmZVdCs5M1lW?=
 =?utf-8?B?UzBJU2dQZGNocmhxUSs2MUlpVHdKSkYvNngxMkx3N0gyTEhVQjRTSUVZOXpD?=
 =?utf-8?B?VGU1eG5DUW4vejVwQW41ZkkwWEFvUnpEL0Z2TVpjMXpYc2VRRUEvVEZJWUcr?=
 =?utf-8?B?RUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45d3aa31-27e8-43e7-c055-08da6afde451
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2022 09:46:31.6023
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8z7gKvPFoe9oDKj98gYbzaBAxHJzl5d7Y+1Z21c2UGv4SB6efmznSlsyWhf/A2m9vDwbzxV1EK6XQVTI2UZ99wc2zBlCrSx3uO1F5CSfLNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7782
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgVHVkb3IgQW1iYXJ1cywNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2MiAyLzJdIG10ZDogc3BpLW5vcjogQWRkIFJlbmVzYXMgQVQyNVFMMTI4
QSBzZXJpYWwgbm9yDQo+IGZsYXNoDQo+IA0KPiBPbiA3LzIxLzIyIDEyOjIzLCBCaWp1IERhcyB3
cm90ZToNCj4gPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW5sZXNzIHlvdSBrbm93DQo+ID4gdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiA+DQo+
ID4gSGkgVHVkb3IgQW1iYXJ1cywNCj4gPg0KPiA+IEkgaGF2ZSBkb25lIHF1aWNrIHRlc3Qgd2l0
aCB0aGVzZSBnZW5lcmljIHBhdGNoZXMuIFBsZWFzZSBmaW5kIG15DQo+ID4gb2JzZXJ2YXRpb24g
YmVsb3cuDQo+IA0KPiBUaGFua3MhDQo+IA0KPiA+DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djIgMi8yXSBtdGQ6IHNwaS1ub3I6IEFkZCBSZW5lc2FzIEFUMjVRTDEyOEENCj4gPj4gc2VyaWFs
IG5vciBmbGFzaA0KPiA+Pg0KPiA+PiBPbiA3LzE1LzIyIDEzOjU3LCBCaWp1IERhcyB3cm90ZToN
Cj4gPj4NCj4gPj4gSGksIEJpanUhDQo+ID4+DQo+ID4+PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90
IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdQ0KPiA+Pj4ga25vdyB0
aGUgY29udGVudCBpcyBzYWZlDQo+ID4+Pg0KPiA+Pj4gQWRkIHN1cHBvcnQgZm9yIFJlbmVzYXMg
QVQyNVFMMTI4QSBzZXJpYWwgbm9yIGZsYXNoLg0KPiA+Pj4gRGV0YWlscyBvZiBmbGFzaCBjaGlw
IGNhbiBiZSBmb3VuZCBoZXJlIFsxXQ0KPiA+Pj4NCj4gPj4+IFsxXQ0KPiA+Pj4NCj4gPj4+IFNp
Z25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPj4+
IC0tLQ0KPiA+Pj4gJCB4eGQgLXAgc2ZkcA0KPiA+Pj4gNTM0NjQ0NTAwNjAxMDFmZjAwMDYwMTEw
MzAwMDAwZmYxZjAwMDEwMjgwMDAwMDAxZmZmZmZmZmZmZmZmDQo+ID4+PiBmZmZmZmZmZmZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZlNTIwZjFmZmZmZmZmZjA3NDRlYjA4NmINCj4gPj4+IDA4
M2I4MGJiZmVmZmZmZmZmZmZmMDBmZmZmZmY0MmViMGMyMDBmNTIxMGQ4MDBmZjMzNjJkNTAwODQy
OQ0KPiA+Pj4gMDFjZWVjYTEwNzNkN2E3NTdhNzVmN2EyZDU1YzE5ZjYxY2ZmZTgxMGMwODBmZmZm
ZmZmZmZmZmZmZmZmDQo+ID4+PiBmZmZmZmZmZmZmZmZmZmZmNTAxNjUwMTkwMDAwZmZmZg0KPiA+
Pj4NCj4gPj4+ICQgbWQ1c3VtDQo+ID4+PiAvc3lzL2RldmljZXMvcGxhdGZvcm0vc29jLzEwMDYw
MDAwLnNwaS9ycGMtaWYtc3BpL3NwaV9tYXN0ZXIvc3BpMS9zcA0KPiA+Pj4gaTEgLjAvc3BpLW5v
ci9zZmRwIDIzZTNlYzU2YjViOGY5ODZkMDQ4OGJhNDcyNzIzOWRkDQo+ID4+PiAvc3lzL2Rldmlj
ZXMvcGxhdGZvcm0vc29jLzEwMDYwMDAwLnNwaS9ycGMtaWYtc3BpL3NwaV9tYXN0ZXIvc3BpMS9z
cA0KPiA+Pj4gaTENCj4gPj4+IC4wL3NwaS1ub3Ivc2ZkcCAkIGNhdA0KPiA+Pj4gL3N5cy9kZXZp
Y2VzL3BsYXRmb3JtL3NvYy8xMDA2MDAwMC5zcGkvcnBjLWlmLXNwaS9zcGlfbWFzdGVyL3NwaTEv
c3ANCj4gPj4+IGkxDQo+ID4+PiAuMC9zcGktbm9yL2plZGVjX2lkDQo+ID4+PiAxZjQyMTgNCj4g
Pj4+ICQgY2F0DQo+ID4+PiAvc3lzL2RldmljZXMvcGxhdGZvcm0vc29jLzEwMDYwMDAwLnNwaS9y
cGMtaWYtc3BpL3NwaV9tYXN0ZXIvc3BpMS9zcA0KPiA+Pj4gaTENCj4gPj4+IC4wL3NwaS1ub3Iv
cGFydG5hbWUNCj4gPj4+IGF0MjVxbDEyOGENCj4gPj4+ICQgY2F0DQo+ID4+PiAvc3lzL2Rldmlj
ZXMvcGxhdGZvcm0vc29jLzEwMDYwMDAwLnNwaS9ycGMtaWYtc3BpL3NwaV9tYXN0ZXIvc3BpMS9z
cA0KPiA+Pj4gaTENCj4gPj4+IC4wL3NwaS1ub3IvbWFudWZhY3R1cmVyDQo+ID4+PiBhdG1lbA0K
PiA+DQo+ID4gV2l0aCBnZW5lcmljIGZsYXNoIGRyaXZlciBwYXRjaGVzIEkgZ2V0IGJlbG93IHJl
c3VsdHMNCj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tDQo+ID4NCj4gPiB4eGQgLXAgc2ZkcA0KPiA+IDUzNDY0NDUwMDYwMTAxZmYwMDA2MDEx
MDMwMDAwMGZmMWYwMDAxMDI4MDAwMDAwMWZmZmZmZmZmZmZmZg0KPiA+IGZmZmZmZmZmZmZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmU1MjBmMWZmZmZmZmZmMDc0NGViMDg2Yg0KPiA+IDA4M2I4
MGJiZmVmZmZmZmZmZmZmMDBmZmZmZmY0MmViMGMyMDBmNTIxMGQ4MDBmZjMzNjJkNTAwODQyOQ0K
PiA+IDAxY2VlY2ExMDczZDdhNzU3YTc1ZjdhMmQ1NWMxOWY2MWNmZmU4MTBjMDgwZmZmZmZmZmZm
ZmZmZmZmZg0KPiA+IGZmZmZmZmZmZmZmZmZmZmY1MDE2NTAxOTAwMDBmZmZmDQo+ID4NCj4gPiBU
aGlzIHJlc3VsdCBpcyBzYW1lIGFzIGFib3ZlLg0KPiANCj4gb2ssIGFzIGV4cGVjdGVkLg0KPiAN
Cj4gPg0KPiA+IGNhdA0KPiA+IC9zeXMvZGV2aWNlcy9wbGF0Zm9ybS9zb2MvMTAwNjAwMDAuc3Bp
L3JwYy1pZi1zcGkvc3BpX21hc3Rlci9zcGkxL3NwaTENCj4gPiAuMC9zcGktbm9yL2plZGVjX2lk
DQo+ID4gMWY0MjE4MWY0MjE4DQo+ID4NCj4gPiBUaGlzIHJlc3VsdCBpcyBub3QgbWF0Y2hpbmcg
MWY0MjE4LT4xZjQyMTgxZjQyMTgNCj4gDQo+IGhlcmUgaXQgbG9va3MgbGlrZSB0aGUgSUQgaXMg
c2VudCB0d2ljZS4NCg0KT0suDQoNCj4gDQo+ID4NCj4gPiByb290QHNtYXJjLXJ6ZzJ1bDp+IyBj
YXQNCj4gPiAvc3lzL2RldmljZXMvcGxhdGZvcm0vc29jLzEwMDYwMDAwLnNwaS9ycGMtaWYtc3Bp
L3NwaV9tYXN0ZXIvc3BpMS9zcGkxDQo+ID4gLjAvc3BpLW5vci9wYXJ0bmFtZQ0KPiA+IHNwaS1u
b3ItZ2VuZXJpYw0KPiA+DQo+ID4gVGhpcyByZXN1bHQgaXMgbm90IG1hdGNoaW5nIGF0MjVxbDEy
OGEtPiBzcGktbm9yLWdlbmVyaWMNCj4gDQo+IHJpZ2h0LCBhcyBleHBlY3RlZA0KPiANCj4gPg0K
PiA+IHJvb3RAc21hcmMtcnpnMnVsOn4jIGNhdA0KPiA+IC9zeXMvZGV2aWNlcy9wbGF0Zm9ybS9z
b2MvMTAwNjAwMDAuc3BpL3JwYy1pZi1zcGkvc3BpX21hc3Rlci9zcGkxL3NwaTENCj4gPiAuMC9z
cGktbm9yL21hbnVmYWN0dXJlcg0KPiA+IGNhdDoNCj4gPiAvc3lzL2RldmljZXMvcGxhdGZvcm0v
c29jLzEwMDYwMDAwLnNwaS9ycGMtaWYtc3BpL3NwaV9tYXN0ZXIvc3BpMS9zcGkxDQo+ID4gLjAv
c3BpLW5vci9tYW51ZmFjdHVyZXI6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkNCj4gPg0KPiA+
IFRoaXMgcmVzdWx0IGlzIG5vdCBtYXRjaGluZyBhdG1lbC0+IGNhdDoNCj4gPiAvc3lzL2Rldmlj
ZXMvcGxhdGZvcm0vc29jLzEwMDYwMDAwLnNwaS9ycGMtaWYtc3BpL3NwaV9tYXN0ZXIvc3BpMS9z
cGkxDQo+ID4gLjAvc3BpLW5vci9tYW51ZmFjdHVyZXI6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3Rv
cnkNCj4gDQo+IGhlcmUgd2UgY291bGQgaW50cm9kdWNlIGEgZ2VuZXJpYyBuYW1lIGFzIHdlbGwu
DQoNCk9LLg0KDQpNaWNoYWVsOiBEbyB5b3UgaGF2ZSBhbnkgcGxhbiB0byBhZGQgZ2VuZXJpYyBu
YW1lIGZvciBtYW51ZmFjdHVyZXINCmFzIGNvbXBsZXRlbmVzcz8NCg0KPiANCj4gPg0KPiA+IEhv
dyBkbyB3ZSBnZXQgcHJvcGVyIHBhcnRuYW1lL21hbnVmYWN0dXJlciBkZXRhaWxzIHdpdGggZ2Vu
ZXJpYyBmbGFzaA0KPiBkcml2ZXI/DQo+IA0KPiBZb3UgZG9uJ3QsIGFzIGl0IGlzIHlvdSBnZXQg
anVzdCBnZW5lcmljIG5hbWVzIGxpa2UgZ2VuZXJpYy1zcGktbm9yIGFuZA0KPiBnZW5lcmljLW1h
bnVmYWN0dXJlci4gV2h5IGRvIHlvdSBmaW5kIHRoZSBmbGFzaC9tYW51ZmFjdHVyZXIgbmFtZXMN
Cj4gaW1wb3J0YW50Pw0KDQpPaywgY3VycmVudGx5IG15IHRlc3Qgc2NyaXB0IGV4cGVjdHMgcHJv
cGVyIHBhcnRuYW1lL21hbnVmYWN0dXJlci4NCldpbGwgY2hhbmdlIGl0IHRvIGdlbmVyaWMgb25l
Lg0KDQpDaGVlcnMsDQpCaWp1DQo=
