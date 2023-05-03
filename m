Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F4326F5271
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 May 2023 10:00:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbjECIAB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 3 May 2023 04:00:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229693AbjECIAA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 May 2023 04:00:00 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2105.outbound.protection.outlook.com [40.107.113.105])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 052D4198E;
        Wed,  3 May 2023 00:59:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Js3E7qea5NhSYKJT9lN+xNd5xizZBDnnFqee+snTNkL1yuPRsiMXdisPQ0KymZ1iEHZw1bnD17yX/r+Eah0LVOAS8L9MZxFBONPVxCxMvlvc5ECFDBJzaemlszuPlPQwjItouZGDFiImTTCAI5vlW8lzVLYxSus0Bn2JeAPx8vswqjf9D+49NKduRWwcx/Tea3xCahsRSTYMNsBnvwuwvwIjZyPfq3jNN7LVrmn/e4JsZc+mp5Ncpzg5j4b/Op5s+LNzwcjAla9a7aNsJRyvDzXG7Y/u6+xJVfPRTl8kP3tRCbS9TqAVxMYOM4DAI7/NPEb3IiqrGgAVWkkKrU5b4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h0BUmMgjZcJtInd1W3aIVPCDmxqjcOuPKyYM/qZP9A4=;
 b=YKd3iQ7ZTMmnIsi5TolnvUldgHpuFgLlBuTMkmhNeqXypEcqkdigxLzyMzPFGYbWA7hfzvEWKXH3vYEVsJDr6KXiWQfZUsXaGQfWAQVfM/hQ7E5k4h55G84DWXe1YBUBd9+Z4l9AacNUV6JXcBEcjvZqqhd/zpru1X++Fgp4a1YSyXn6RWP1+6S41p5jjd0Yf+Ag2kQtKndHTtTowdPgpP8udoz7Nmrn6iTO9RniMtZcTk4eF6wlwzA/biEREhvDj0T8uKki4VzxC+0U6aiGVO3uEVzpg1R57G1RmG33oA44JF+XtfsrQt6R2AClXZituxNeV9mwWUUcwRGe5ByWDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h0BUmMgjZcJtInd1W3aIVPCDmxqjcOuPKyYM/qZP9A4=;
 b=ipROBXz+q9esQtCuNcKhx+TEwdqP2DfpczHda9iOtFAbvlARdX8tBSn1lo+8AkkrIcKRsnH3RShPjuH3DzTVHBMsqtmi2lBuclbXoW8tIxs7H47hk2bWOrFelZXqK2/9kMXAOt4DINXF96wUiG0ztf8Cn1XPEdq/J1I7H7L4tkY=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYYPR01MB8183.jpnprd01.prod.outlook.com (2603:1096:400:fe::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Wed, 3 May
 2023 07:59:55 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6363.021; Wed, 3 May 2023
 07:59:52 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v5 0/3] Add Versa3 clock generator support
Thread-Topic: [PATCH v5 0/3] Add Versa3 clock generator support
Thread-Index: AQHZbhxjDSdzuZdA9kCC1BBZdg8cZa9HJZ+QgABmWgCAAMIcoA==
Date:   Wed, 3 May 2023 07:59:52 +0000
Message-ID: <OS0PR01MB5922738C7DED2C62C2E8670F866C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230413152648.89089-1-biju.das.jz@bp.renesas.com>
 <OS0PR01MB59220C350DFB9C221C801907866F9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <68d2fa14-5504-cee1-5278-bd138c499b9a@linaro.org>
In-Reply-To: <68d2fa14-5504-cee1-5278-bd138c499b9a@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYYPR01MB8183:EE_
x-ms-office365-filtering-correlation-id: 40777dde-f61b-4e5f-cac3-08db4bac6070
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AnxPaq6srF2FkZG7JeKHX/kAHMWpsZ9FEp8hVB0JzjHh8fks0SLXJWR0/mTgoCrTH/Bn0WAjtWBZIlj8F5XEkDrZQGn4l5/1j7+Gxrf61s9kbM0PE2BzqqB4H5cso4Ms5I9jnFBdhLj64AOlteEnPqwp+8555+2Pmhf2KtT/zJDN55b90nSAqtao9aT9ebI5aJhi/rTNp4ByAfqtGZhnn9GgxABH73KQAOfWiK1I0269IteLOTzXAJlwZdevopdgsBXttQ2YyONcWc6HUQOWUCBOjRWH6B/B67zNyrYwvrIwVc8UNpll2ASWwKhHlcINy5QC0z1bFX491l6GVTSRFrnvdRp/NIwLVQSnBCuIbY5SNIgyR5jrqleup39UepB32haoYvZF0hdX+LTzCCsfVqZHZ4wsf1kercJQNMLDoaJCbMMIigo0TGqHlLhf+A3Fzs798uWgQZxkC0o2sfgGtebvDKl2UUwtX1d5JDYrSFIJNd/qI6DTO8cwR525ILDEzeLiyrT8npwz3OL1sbVwThd7RDqOw2jih415h9swWf0CdPvuY3s7Ar7c0bpHkf1msLeQUN3JOoIfIP3OFnIXaOEalr4o0vt0/K8b4drXc6ltYbJfmvqxMtETowuUk4Oe
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(136003)(366004)(39860400002)(451199021)(41300700001)(8936002)(8676002)(316002)(76116006)(66946007)(4326008)(66476007)(66446008)(64756008)(66556008)(52536014)(5660300002)(2906002)(7696005)(33656002)(83380400001)(478600001)(54906003)(110136005)(71200400001)(6506007)(26005)(107886003)(186003)(9686003)(53546011)(55016003)(86362001)(122000001)(38100700002)(558084003)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?enh1QmlwN3pSMytXMGllR3dPTUZGUklhbjM2RlhxUytidmM5enM3U0Z4cGp1?=
 =?utf-8?B?dDFQVEtwNUN0VU9ucEQ4d1Q3czIwMHRZck9ZUDV2c3dsSkk1czE3QkM0NUhE?=
 =?utf-8?B?cEwzTG13cFNWdmw0aFA0OXFKNnI4eXUzMzJkZWxHUUdTcWk0TEhRYW83U3lJ?=
 =?utf-8?B?SEdydE1SNkJFNmRDL1U0eEhleGtaOG9xdS95N1k4bFJjNDZzbnBpeEl6Yit6?=
 =?utf-8?B?UGl6cUVHeE96OTFuSGp2NnY0eFhMSmJwWVFKZndRUEtUdDNVejBkZUZwRk9z?=
 =?utf-8?B?SXZzQ2pLVDY1MUw0cHNxR2NFRUhvNVFpSHhqSTY0Nm5GcUNhNjBLRTkwdTZ1?=
 =?utf-8?B?a0krSzdoOWJrNjRyMnUrbncyUkMraGNRSW8xMmVCZmVOb25hV3JLd2VRYTVF?=
 =?utf-8?B?YTRoaVYvQytXR0I0VkVlY1RVeURNSmtabUphOURXN3hhblhvSjQ0a0MzbVc1?=
 =?utf-8?B?Qy9UZXZBZWJubEpWSXc1NUplNXkwRC8yMmJjZmZBM3JHdllEdVdBa3ROTUZo?=
 =?utf-8?B?b1lxeGtNMzB1WFpKSmNBZyt0RGk2eStLdE5XN05PR0tNUEZCNjF4YWdPQ1k2?=
 =?utf-8?B?OEhkU0RWZlBHR1R2SEJXQ0Z1MUJQblJ2SDRibGFndG0vYWtxeHlGZTAzZHZp?=
 =?utf-8?B?ekdmQ3lkZENsb09mRnRWYmJEZC91eGVNc0FHdzg0MFlKWFBJM1Z0WkhXMWZD?=
 =?utf-8?B?Zi92OXFiaEVOK2pkczNUQVV2SUZjbENPWTN6Zk1uclR3M2tLMFBXMEpqVG8z?=
 =?utf-8?B?cTN4VHpuTExLT0E2eVVidHcreVJZQWYxWWN4RFlXMzloVzB6RXJwbDh4eVlm?=
 =?utf-8?B?eXNQYytUenlLcTlqUjhTcitwQnRJZ3pmOEVCLzhnTHNaWU9BQ3ltdnJuNWtJ?=
 =?utf-8?B?d3c3RHBQcnhCbWRsMlovNzVvSWxJUnhtZE9tYjR4U1JJNXozWGFBR3lEdTZl?=
 =?utf-8?B?T1U4WEJiOUEwdmFMUTFHMWRSWHRJbjhuWXRrREQ4TGxibXVUYmRuV3YvR1Rh?=
 =?utf-8?B?Rmk4OWJqSDNxU3pJQTV3eVlLenA4UlIvOTRiM1Y2WFRGRDVSelFFallpK3ZG?=
 =?utf-8?B?TDF3d05iNjdLazNkcFZWZEhqazhleElKRm9YRWZ2RTdFaThrV1lXTzhYM0p2?=
 =?utf-8?B?VGM4ZWVLMHZOT1pmNVlyc0hkZGQ0dytWQ3BPZG1LSzdSYTZJanJQS1lrb0VM?=
 =?utf-8?B?MGhhNklkMGpvbHJwckEvSkJ3QXp6VE1MOFoza1RCUGNrb0RIRUFURkZDMXo3?=
 =?utf-8?B?amxvY0RBaVQ4TVRFTG4rb0Z5aGMzU1VMUXlQNlVCT0RZdW9JM2hiamlJWEFB?=
 =?utf-8?B?TDU3TXNkRmgyRlkyWVFMRDBDOVhMSkhJRlduOUJTTlRzam5VVVJnWUVnOENM?=
 =?utf-8?B?S2hMMGQwM1hZdGpCbE1VZVFsNk12L1JqNU00WWY3V2Y1RVlUUUQxdkNZS0x2?=
 =?utf-8?B?WVFQVFdTZWw1NjQ2ODRpQnFiWW9xcUthcTJvM0xTd1FsUUo5N1FCMTRRTUVp?=
 =?utf-8?B?MlhlNVVHRklOb2NwS0s1UktwdlpueGtzbWI2ZXdRRGdTQktQdFMrdm5ET3hM?=
 =?utf-8?B?VUJTdlV6cDkvcHFKNjlaTzlvTzJxTThRengydVNnUXF4bjRVbXhDR2VPeG9u?=
 =?utf-8?B?dTdob2x1bTBCbE92VlpaaU5LVzFOQzkvWDcrdll5TkRBL1F0dy83UzNNcGFj?=
 =?utf-8?B?emJrOFZteWhIdTgzR2pNdThxUzJGdmo2dklGZE03NG9RZzV4K2JoeXlpUFpY?=
 =?utf-8?B?NEhIekJjMFg3aVhqS0hnQm51Sy9oS2pldXd2SHNGTWZjajE0U2FVZlVHTnRz?=
 =?utf-8?B?SUwyeHRsYlBXc0xqN2ZmRnNJZ0pvQTJqYklPdmpFU0E4Z2xvdWNEcTErWEFG?=
 =?utf-8?B?NVRjVUh4aHlvUko2UUthSnVTc1lOekFtbTFNeldjNDV2U08wUlByZWZ1bnVN?=
 =?utf-8?B?SXowZkdBK3FzbmpwbUpNR0VYWnZPNXE3Vk5GeFErM2FIaUJYbkpYKy9ZWjAv?=
 =?utf-8?B?WWQ3VmdwcnhiN1BadlVDUmFLVU1qT2NCbEY4Uis2ajIzUFR1SXNQQUtJeWNq?=
 =?utf-8?B?NVFZak05V3F5M0tnUWxXM0Q1K0hDbFprUEVxYmpsLzVGU2tQb0p5OXk4SGNy?=
 =?utf-8?Q?JG4NGl6WF4GSSptfI5QRECQ5P?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40777dde-f61b-4e5f-cac3-08db4bac6070
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2023 07:59:52.7435
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YoPZSpFq/0+LNYZfrJwIxhcYGA6yQaGzkOl9e65CBSXRdTe3/Hut83WJgiCTaRvsGUL09daceRSbkkwu3mtpNxym/VTjeWE438hiXyf9KqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8183
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDAvM10g
QWRkIFZlcnNhMyBjbG9jayBnZW5lcmF0b3Igc3VwcG9ydA0KPiANCj4gT24gMDIvMDUvMjAyMyAx
NjoxOCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gSGkgQWxsLA0KPiA+DQo+ID4gR2VudGxlIFBpbmcu
DQo+IA0KPiBJdCdzIG1lcmdlIHdpbmRvdy4gUGluZywgb3IgYmV0dGVyIHJlc2VuZCwgYWZ0ZXIg
aXQgZmluaXNoZXMuDQoNClRoYW5rcyBmb3IgdGhlIGluZm8uDQoNCkNoZWVycywNCkJpanUNCg==
