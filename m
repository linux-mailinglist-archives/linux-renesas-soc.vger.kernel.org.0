Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3413629755
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Nov 2022 12:27:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbiKOL1O (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Nov 2022 06:27:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbiKOL1N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Nov 2022 06:27:13 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2111.outbound.protection.outlook.com [40.107.113.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03CA023E88;
        Tue, 15 Nov 2022 03:27:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Birucr7SfAEai48jl88JiXhRuapMn3KqMP6MVE1ODi1YomqTnFycE9xiuggOdRtuuz6kxeZIz9uhr32iu6P4INZMYaSze23lUEj8HMacuPJD8LQ45M4k1pxNnWuGnUi894YS2Kx1AWkhkk7ZGOhWxwhEOazqPmucErHadnlcuB2/sBTKPnfveyv8UGQxqh/NWCUoxD4rwuw29o1rvqKBjOPT78z+Q/UPZ4T2/Epy6raSi5hnv2zeuc74QjcmwrgraQwfD+a315EYRMZeSUQEt3wcTL90zh6uF57scSomxX7Bngx8shZMLznQkDj2wUOeG13XzDUdje90rVAsCWhNgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=63VKO2V4HchyXxagK5JPFo18RAaxBOssU6clGD6uJ20=;
 b=QsVYpVPNGGpdSuRITutsjJWY+CxE48bs4Hp0vijEvMMEooh+Ja13aJiZTxb2j6aLMMWVmvGv1IvlTh7JC8F/MKToqcFhILaHCTqeWCgZEKOS+OFDoe6sBUpQeAiu2EeWh699BjNRjR/hgnAHQvksCl9U3ZJjly15CMOp6fpBrE2vsXboF0gUzMz9AtmlPjk0yyxVUByKAyhMUy6Hh1Ug4qsb5L7qXUsb7hlzrZmeu5Npq4uHeT/FavcGPrtKewvOrU24p61H2LrdygtK9epzPHxKWJ/RdSExYoV/Lmip+rrFPn187PJbIuriPi6gIhJ+clWdNS4w1FXY9pDSRRl7KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=63VKO2V4HchyXxagK5JPFo18RAaxBOssU6clGD6uJ20=;
 b=eysPZ4qWLwzet0pOckBmbRo2frSI6oNNM5oHpAhTKEN9bCtJr6P1datYf7KOu5mDRbLH5zXVltmbXMxOUCqEnNA9ZwCeUSvTlcq5mhzVEOhylPaC+I7onzOYS1DDPiUgwbAq29n1kOnhR4AMTYjkL3g8y+jqJ6krl7upZcUk9dw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB5697.jpnprd01.prod.outlook.com (2603:1096:604:bb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Tue, 15 Nov
 2022 11:27:09 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::5b24:f581:85bd:6ce2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::5b24:f581:85bd:6ce2%3]) with mapi id 15.20.5813.018; Tue, 15 Nov 2022
 11:27:09 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH v2 1/3] dt-bindings: arm: renesas: Document Renesas RZ/V2M
 System Configuration
Thread-Topic: [PATCH v2 1/3] dt-bindings: arm: renesas: Document Renesas
 RZ/V2M System Configuration
Thread-Index: AQHY9SCBIuQl3m8nV0Kf1Ch8X1TBHq45ZpOAgAAH2aCAAB6FgIAABS+ggAUMRDCAAAS2gIAAAUsggAAD6gCAAACZMIAAJtqAgAABIaCAANe1AIAAL6vQgAAHGACAAABV8A==
Date:   Tue, 15 Nov 2022 11:27:09 +0000
Message-ID: <OS0PR01MB5922D42931ADA58D715B24A986049@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20221110162126.103437-1-biju.das.jz@bp.renesas.com>
 <20221110162126.103437-2-biju.das.jz@bp.renesas.com>
 <ae35fd75-64d3-3ab9-8cc0-3cbcc9c34b78@linaro.org>
 <OS0PR01MB59229179DE3D3D00C4963F3186009@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <a7bbfdd1-1abd-2ee5-1d32-47d0bcb7e1f2@linaro.org>
 <OS0PR01MB5922863B8EC8DF54D8E881FE86009@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922C8A590502C8820B05A7186059@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <839d9740-e814-897e-d484-ded3d531a97a@linaro.org>
 <OS0PR01MB59226FC7CA88208AB5C0AED586059@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <a3e5d695-535e-8587-6ccc-4c65fbeba278@linaro.org>
 <OS0PR01MB5922FB7D32AEC159234037D886059@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdU=h_0Ay4U+PkzNQLE6nHP0UQ19fCdN4WPeh6e1H5TBZw@mail.gmail.com>
 <OS0PR01MB59220BB367224A4215365F0E86059@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdV3K9kSvp3_7L+v9Lw2rUPzXS-Ocd=9k4pQQYioCdGoyQ@mail.gmail.com>
 <OS0PR01MB5922E8CD3F8CE372C63179A186049@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdWpckU_uPfUR7uxiHfTA5sVGOoYxhKtnW4GvaGAFdaiQQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWpckU_uPfUR7uxiHfTA5sVGOoYxhKtnW4GvaGAFdaiQQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS0PR01MB5697:EE_
x-ms-office365-filtering-correlation-id: 219217a7-080b-425e-a05b-08dac6fc55a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: daHqFMccESXjJAGu+aSEWDt6XK/9r5Gsj16LhwZhu9u5udAsmj6fSuLbPtr47iwoyUCXQH/uKtj5NHqZ3XOYMIIcQwoLL+pXuLTlWC2zdOe+/T1AtmIVyBEPcPELO6kXBjCkdd0aiZnVpyJ1Z60fM1KQwUiqyVela6UUiBerUiIvhfwQNNrJenE/Ltqu5FZxQPLz8d5FsyEqQ5JSNN3dEXH9GWp7WGdmcbc7dy9JmdfecMeBtxwp+kijQFaPfyA/aQFXVKYiqFQekbWA3Om4xT3OpTffBzFCBcOiNl9mFjHmLrm+JC6lvNj4uL9SajVxWsrUl6gP9gBhwnwrwysRivxjcxAXrHXhC6eosk0CCQvZMxAGHhxrM+copAMtDwkjJWxT8Dd6YMn1zr6NEwv9Nq4dpQEZCEFbiy16kVFsSUwPZuGWNTxSqrTnz/6UgvpKzQ3j4EEK2jsNLJGmkc8ALy6PpOPovYyNKkhly11KQzE43AVQxNMyyrPX3jH8Z56Yulr6fiGldsU9JLbApCkZQBx/hEh20ZsY3e4/auBuA2OgK2W8iiFF2nSIMtLKX4Fa/t6AEZBXmEfbLWnDVCoqCK9qAxbeWgfaAo1DRaMhEU6WZHDB8LXiYMXanV6G4mpvWkcysVDdrtmnvOyPfrQ2Yk/TiB8Pjx8H5sgIEGPIjYZ/9nlWLTZ61G/mF94PPUePnjcJIUPIWiAP4rB2lje0xQ4NweH+j//P2A2nX/K5yLKcN1PJv5ucjEsemAhEUWPXItkY/gisrVvKutDD+804lA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(451199015)(53546011)(316002)(7696005)(6506007)(6916009)(54906003)(55016003)(86362001)(41300700001)(33656002)(5660300002)(2906002)(8936002)(52536014)(186003)(38070700005)(8676002)(4326008)(66446008)(122000001)(38100700002)(66476007)(83380400001)(66946007)(64756008)(26005)(66556008)(9686003)(76116006)(71200400001)(107886003)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TnNvdlMrMERoaG1aK00vbldVRldMYVlENTkyTTllNXFPbFpZeXo5UGNOb0pp?=
 =?utf-8?B?SFd5YzVvaU91aHc1RmVwTHVVeVg1ZVJRY2NGT2RDTkoyNjhwM2F5YldlK1Vz?=
 =?utf-8?B?QWZJaGFVNDBNR0lpQ1JLbU4xVU9qby95Vm5YMVBXQ3pBSXo5dFlESkhvckxU?=
 =?utf-8?B?VXAxaEN1MWxUOWQyUEZLMnVXbjY2UnlJUHUzakN5eUsyOXYwZ0xDRk9aaER5?=
 =?utf-8?B?WFhJdGIrT1pIUlB0TWljWnIyR3J2R01JT3N3Sncwa3R0NWdkWlRwNExveEEy?=
 =?utf-8?B?NG10bEhwWGp5eU9oK05Rb3Z6RWRQVGJFaUNrZVhQZ0VyWTdqRC9MVms3Wmtq?=
 =?utf-8?B?c25XYTRxdTltRTlSQnFRWGl3c3RFNkduSkhoQmlCLzlYYkFYQ3pvQy9kRWs4?=
 =?utf-8?B?aXozTzVuKzFzSUV5MUFBcnN6aTJETlBlOGdGVkhGQ0xRcFQyQnpDTmh0NFF6?=
 =?utf-8?B?RkdwM1BPQjVVRW5rVmJwN3NzN2l0WDNvMVUwNUZGT0tXQWF3WklVVFlnbE8r?=
 =?utf-8?B?dHBsbnhxZWRNYUkxaE96ZDhrdUhrNjJhNUJ2eTNNZXpkOURWampvVGlNS1hF?=
 =?utf-8?B?SmYwMVFiYjQwVk9WTE1kNzdhakJEdmpFb09iQ010RWFhdzFTVVJiMGpieEdk?=
 =?utf-8?B?NDhHVnN4Y0lMQWJ4QmZoZGxqSkk4dkcyZXVYaFRJVUVOL293dWx6b1phaCt5?=
 =?utf-8?B?VFJvY0pVQmVKVXFydUkwZFZNcFR5Lzk2UTVYVGRxcTBRdFlBWFNKc2w4cndp?=
 =?utf-8?B?VjlaenJuMTh0ekZrTU1BNjd0MnczK3ZDYnhha2FuVUhNWHpaanBnL1Zkelh3?=
 =?utf-8?B?RXZPc0s3V1MyTnEyc29rN0NnWnN4aUlXTDdPeDdWUUVnTk0xTWxEWGtWMW52?=
 =?utf-8?B?TFRqQ3hyMFB6cE1XcnM2ZU1NdUx3dkl5ekpRK2w4SCt1cjNyMS80VGZZbGVY?=
 =?utf-8?B?REd5TmpEcFpyRS9iTHFlM2JZa0JoY0RDdGhUVmc2MUtST3pNWWdtUDZlMEdD?=
 =?utf-8?B?dHJ1ODVWcUptLzdDRmVTSGs0N0F1L0RCaWVzNWhsQWp6eC9uaFdnYk1SL2lS?=
 =?utf-8?B?K0lXNlUySlFUK1h1Q0VaY3lPYnV2aHYyVEtYVkhuVStRQlowVmkyc2d4b0p5?=
 =?utf-8?B?bDZxZ2lIK1lBY1Z0L3hpb2xjV0lIU2lyVkJkRGdGcGhmUlpYcnJUMWd0eG1o?=
 =?utf-8?B?bWhrY0JPUmIxY2VPQkZ2dVI2NW5oL1hzcGxJOGVpdnNrZWRNMnptSDh5Yzlw?=
 =?utf-8?B?NFpzMGYram9pMU9sNmRZUVN6Z0pHYXg5N0hRNWU2Y1p2b0QwMVZPc2xzY3gw?=
 =?utf-8?B?aGFRVEZPR1lHbkk2cTRCVHc5ZHBYS042N3UyVHFiWW9TNm1Ib2xlbDBmMng0?=
 =?utf-8?B?QVJDNzY1VUdhNHlKTFRwN1QraXlFVDQxRXkwMUlWQ0YxQWdtL29YdHpQOHZ1?=
 =?utf-8?B?UmMrMTRqV3I5Y0RLdUVlYmxmSHJnYWFmakhDb0ZCdFRZV3ZIZDdlVWNBR2Fo?=
 =?utf-8?B?UnZFc2ZoK2RCNGtlUDlIMUl4RjlOTmsreXVDclNpVWpiK3lWbHRETndRcHp5?=
 =?utf-8?B?K1dHWGZnQWhESmFaSC9IZVVhSFFFOUdzUExuaU9wVGI4TFBMaEdEZWV6d1VI?=
 =?utf-8?B?YldLKzJRWXprVklKS3VqNVFGdUZmM3dQQnhnelBXbmpWaHdkYWhCenZ5S1Bx?=
 =?utf-8?B?c2JObHU5TkVoc1ZyRVhHUnBYenRjR2cwTTBwbkQvSTJVeG83ZWRhQ203SkFS?=
 =?utf-8?B?RXJLbFpjcExPV3RkaXEwN09vMnY2QUNFUUl1YkFJRENGZ0l3dmxBNGo5WXN1?=
 =?utf-8?B?dXZnd1gvdnZhMFZ1VWF5YnBDcXkzdXZXSjRCdTJkbnZwenl0VFJjem1lcmJK?=
 =?utf-8?B?aFhVaVpCQ20zR1VNSk9sakE3MFZQWGJmd3piUWhmcWp5NlAxNnk3amtQNGRT?=
 =?utf-8?B?cWRaVHRrY2U0YXRnSkx3WENCUUhoUExzYnVQempVV2ZkS3ZVdVpLclI5bU16?=
 =?utf-8?B?S0FhK3ZST0pxQ01UMUZDMm9WT21sRmYxOXRuRml6QjlzMkNwZml5VHN0UEJv?=
 =?utf-8?B?ankvdi9LRVlWdERvUUI4VVhVYTQ0V0d2S3NGK1lQM0hxbU1GVGdOMWxycXFs?=
 =?utf-8?B?ckowTHJYaWZBY004YWJvb0Z2MU9XcmFOL1dtbllNSXdhUVQ5N1NPZDVIN2V4?=
 =?utf-8?B?V2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 219217a7-080b-425e-a05b-08dac6fc55a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2022 11:27:09.7428
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uU+1xKPEPlVW3yAHybtsaCr8tXJz8GuqZvALuLRWhPNgJ2Msxg83GT+Dqhn5Te8Nlp6vdXp8NxaI2RUNS//3Ingeo9G2I8q8cttZBtPAlEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5697
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMTUgTm92ZW1iZXIgMjAyMiAxMToy
NA0KPiBUbzogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiBDYzogS3J6
eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPjsgUm9iIEhl
cnJpbmcNCj4gPHJvYmgrZHRAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3psb3dza2kNCj4gPGty
enlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZz47IEdlZXJ0IFV5dHRlcmhvZXZlbg0KPiA8
Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+OyBQaGlsIEVkd29ydGh5IDxwaGlsLmVkd29ydGh5QHJl
bmVzYXMuY29tPjsNCj4gTWFnbnVzIERhbW0gPG1hZ251cy5kYW1tQGdtYWlsLmNvbT47IGxpbnV4
LXJlbmVzYXMtDQo+IHNvY0B2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwu
b3JnOyBDaHJpcyBQYXRlcnNvbg0KPiA8Q2hyaXMuUGF0ZXJzb24yQHJlbmVzYXMuY29tPjsgRmFi
cml6aW8gQ2FzdHJvDQo+IDxmYWJyaXppby5jYXN0cm8uanpAcmVuZXNhcy5jb20+DQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjIgMS8zXSBkdC1iaW5kaW5nczogYXJtOiByZW5lc2FzOiBEb2N1bWVu
dA0KPiBSZW5lc2FzIFJaL1YyTSBTeXN0ZW0gQ29uZmlndXJhdGlvbg0KPiANCj4gSGkgQmlqdSwN
Cj4gDQo+IE9uIFR1ZSwgTm92IDE1LCAyMDIyIGF0IDEyOjE5IFBNIEJpanUgRGFzIDxiaWp1LmRh
cy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENI
IHYyIDEvM10gZHQtYmluZGluZ3M6IGFybTogcmVuZXNhczogRG9jdW1lbnQNCj4gPiA+IFJlbmVz
YXMgUlovVjJNIFN5c3RlbSBDb25maWd1cmF0aW9uIE9uIE1vbiwgTm92IDE0LCAyMDIyIGF0IDg6
MjINCj4gUE0NCj4gPiA+IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4g
PiA+IHdyb3RlOg0KPiA+ID4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMS8zXSBkdC1iaW5k
aW5nczogYXJtOiByZW5lc2FzOg0KPiBEb2N1bWVudA0KPiA+ID4gPiA+IFJlbmVzYXMgUlovVjJN
IFN5c3RlbSBDb25maWd1cmF0aW9uIE9uIE1vbiwgTm92IDE0LCAyMDIyIGF0DQo+IDY6MDUNCj4g
PiA+IFBNDQo+ID4gPiA+ID4gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3
cm90ZToNCj4gPiA+ID4gPiA+ID4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9m
Lmtvemxvd3NraUBsaW5hcm8ub3JnPg0KPiA+ID4gPiA+ID4gPiBPbg0KPiA+ID4gPiA+ID4gPiAx
NC8xMS8yMDIyIDE3OjQ0LCBCaWp1IERhcyB3cm90ZToNCj4gPiA+ID4gPiA+ID4gPj4+Pj4gSWYg
dGhlIGhhcmR3YXJlIG1hbnVhbCBzYWlkIHRoaXMgaXMgY2FsbGVkICJmb28tDQo+ID4gPiB3aGF0
ZXZlci1uYW1lIg0KPiA+ID4gPiA+ID4gPiA+Pj4+PiBvciAicno4NTczNmRmbngyIiwgeW91IHdv
dWxkIHVzZSBpdCBhcyB3ZWxsPw0KPiA+ID4gPiA+ID4gPiA+Pj4+Pg0KPiA+ID4gPiA+ID4gPiA+
Pj4+PiBOb2RlIG5hbWVzIHNob3VsZCBiZSBnZW5lcmljLg0KPiA+ID4gPiA+ID4gPiA+Pj4NCj4g
PiA+ID4gPiA+ID4gPj4+IEkgZ290IHRoZSBmb2xsb3dpbmcgZmVlZGJhY2sgZnJvbSBMU0kgdGVh
bS4NCj4gPiA+ID4gPiA+ID4gPj4+DQo+ID4gPiA+ID4gPiA+ID4+PiAqVGhlIHJlYXNvbiB3aHkg
d2UgdXNlICJjb25maWd1cmF0aW9uIiBhbmQgbm90DQo+ID4gPiAiY29udHJvbGxlciINCj4gPiA+
ID4gPiA+ID4gPj4+IGlzIHRoZSBwb3NzaWJpbGl0eSB0aGF0IHVzZXJzIG1pZ2h0IHRha2UgaXQg
dG8gbWVhbg0KPiA+ID4gPiA+ID4gPiA+Pj4gImNvbnRyb2wiIG9mIHN5c3RlbSBvcGVyYXRpb24g
KHByb2R1Y3Qgb3BlcmF0aW9uKS4NCj4gVGhpcw0KPiA+ID4gdW5pdA0KPiA+ID4gPiA+ID4gPiA+
Pj4gZGV0ZXJtaW5lcyBob3cgdGhlIHdob2xlIExTSQ0KPiA+ID4gPiA+ID4gPiA+PiBjb25maWd1
cmUgdG8gb3BlcmF0ZSBMU0ksIHNvIHdlIHVzZSAiY29uZmlndXJhdGlvbiIgZm9yDQo+ID4gPiB0
aGlzIElQIG5hbWUuDQo+ID4gPiA+ID4gPiA+ID4+Pg0KPiA+ID4gPiA+ID4gPiA+Pj4gQXMgcGVy
IHRoaXMgaXQgaXMgbm90IGEgY29udHJvbGxlci4gSXQgaXMgYQ0KPiA+ID4gPiA+ID4gPiA+Pj4g
Q29uZmlndXJhdGlvbg0KPiA+ID4gSVAuDQo+ID4gPiA+ID4gPiA+ID4+Pg0KPiA+ID4gPiA+ID4g
PiA+Pj4gV2hhdCBzaG91bGQgYmUgZ2VuZXJpYyBub2RlIG5hbWUgZm9yIHN5c3RlbQ0KPiA+ID4g
PiA+ID4gPiA+Pj4gY29uZmlndXJhdGlvbg0KPiA+ID4gSVA/DQo+ID4gPiA+ID4gPiA+ID4+DQo+
ID4gPiA+ID4gPiA+ID4+IFRoZW4gaXQncyBjbG9zZXIgdG8gY2hpcGlkIGFuZCBzaG91bGQgYmUg
aW4gaHdpbmZvPw0KPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gWW91IG1lYW4sIHN5
czogaHdpbmZvQGEzZjAzMDAwIGluc3RlYWQgb2Ygc3lzOiBzeXN0ZW0tDQo+ID4gPiA+ID4gPiA+
IGNvbmZpZ3VyYXRpb25AYTNmMDMwMDAgPz8NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4g
UmF0aGVyIGJlIHB1dCBpbiBod2luZm8gZGlyZWN0b3J5LiBUeXBpY2FsIG5hbWUgaXMNCj4gImNo
aXBpZCIsDQo+ID4gPiBidXQNCj4gPiA+ID4gPiA+ID4gSSBkb24ndCBrbm93IGlmIHlvdXIgZGV2
aWNlIGlzIGEgY2hpcGlkLg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IFRoaXMgSVAgaXMgZm9y
IHN1cmUgbm90IGEgY2hpcGlkLiBXZSBjYW4gZGV0ZWN0IFNvQyB2ZXJzaW9uLg0KPiA+ID4gVGhh
dA0KPiA+ID4gPiA+ID4gaXMgb25lIG9mIHRoZSBmdW5jdGlvbnMgcHJvdmlkZWQgYnkgdGhpcyBJ
UC4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gQWxzbyB0aGUgc2FtZSBJUCBibG9jayBp
cyBwcmVzZW50IG9uIHJ6L3YybWEgYXMgd2VsbD8NCj4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+
ID4gPiA+IFNoYWxsIEkgdXNlIHRoZSBzYW1lIGZpbGUgcmVuZXNhcyxyenYybS1zeXMueWFtbCBm
b3INCj4gYm90aA0KPiA+ID4gPiA+ID4gPiA+IHI5YTA5ZzAxMS1zeXMgYW5kDQo+ID4gPiA+ID4g
PiA+IHI5YTA5ZzA1NS1zeXM/DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBBcmUgdGhleSBzdWZmaWNp
ZW50bHkgc2ltaWxhcj8gRS5nLiB3ZSBoYXZlIHJlbmVzYXMscnN0LnlhbWwNCj4gZm9yDQo+ID4g
PiB0aGUNCj4gPiA+ID4gPiB2YXJpb3VzIFItQ2FyIHJlc2V0IGNvbnRyb2xsZXJzLCB3aGljaCBo
YXZlIGRpZmZlcmVudCByZWdpc3Rlcg0KPiA+ID4gbGF5b3V0cy4NCj4gPiA+ID4NCj4gPiA+ID4g
SSBoYXZlIGJlZW4gdG9sZCBib3RoIFJaL1YyTSBhbmQgUlovVjJNQSBhcmUgZXhhY3RseSBzYW1l
LCBidXQNCj4gPiA+ID4gbGF0ZXINCj4gPiA+IGRvZXMgbm90IGhhdmUgSVNQIG1vZHVsZS4NCj4g
PiA+DQo+ID4gPiBPSy4uLg0KPiA+ID4NCj4gPiA+ID4gPiBJZiB0aGUgU29DIHZlcnNpb24gcmVn
aXN0ZXIgaXMgbG9jYXRlZCBhdCB0aGUgc2FtZSBvZmZzZXQsIGl0DQo+ID4gPiBtaWdodA0KPiA+
ID4gPiA+IGJlIHdvcnRod2hpbGUgdG8gYWRkIGEgZmFtaWx5LXNwZWNpZmljIGNvbXBhdGlibGUg
dmFsdWUsIHRvbywNCj4gc28NCj4gPiA+IHRoZQ0KPiA+ID4gPiA+IHNvY19kZXZpY2UgZHJpdmVy
IGRvZXNuJ3QgaGF2ZSB0byBjb250YWluIGEgYmlnIGxpc3QgdG8gbWF0Y2gNCj4gPiA+IGFnYWlu
c3QuDQo+ID4gPiA+DQo+ID4gPiA+IFRoZSBTb0MgdmVyc2lvbiByZWdpc3RlcnMgYXJlIGxvY2F0
ZWQgYXQgdGhlIHNhbWUgb2Zmc2V0Lg0KPiA+ID4gPiBCdXQgdGhlcmUgaXMgbm8gd2F5IHRvIGRp
c3Rpbmd1aXNoIGJvdGggdGhlIFNvQ3MuDQo+ID4gPg0KPiA+ID4gU28gdGhleSByZWFsbHkgYXJl
IHRoZSBzYW1lIFNvQywgd2l0aCB0aGUgSVNQIGRpc2FibGVkIChieQ0KPiBmdXNlcz8pLg0KPiA+
ID4NCj4gPiA+IFRoZW4gSSBndWVzcyB0aGUgbW9zdCBzZW5zaWJsZSB0aGluZyB0byBkbyBpcyB0
byBqdXN0IHVzZQ0KPiA+ID4NCj4gPiA+ICAgICBjb21wYXRpYmxlID0gInJlbmVzYXMscjlhMDln
MDU1IiwgInJlbmVzYXMscjlhMDlnMDExIg0KPiA+ID4NCj4gPiA+IGF0IHRoZSB0b3AgbGV2ZWws
IGFuZCBrZWVwIGFsbCBvdGhlciBjb21wYXRpYmxlIHZhbHVlcyB1bmNoYW5nZWQ/DQo+ID4gPiBD
ZnIuIHdoYXQgd2UgZGlkIGZvciBSLUNhciBHZW4zZSAocjhhNzc5bVgpLg0KPiA+DQo+ID4gT0ss
IFRoYW5rcyBmb3IgdGhlIHBvaW50ZXJzLg0KPiA+DQo+ID4gV2lsbCBzZW5kIFYzIHdpdGggZmls
ZSBuYW1lIGFzIHJlbmVzYXMscnp2Mm0tc3lzLnlhbWwgYXMgS3J6eXN6dG9mDQo+ID4gbWVudGlv
bmVkLCBXZSBjYW4gaGF2ZSBnZW5lcmljIGZpbGUgbmFtZSxpZiB0aGUgZmlsZSBjb250YWlucw0K
PiBtdWx0aXBsZQ0KPiA+IGNvbXBhdGlibGVzKEN1cnJlbnRseSB3ZSBoYXZlIHI5YTA5ZzAxMS1z
eXMgYW5kIHI5YTA5ZzA1NS1zeXMpLg0KPiANCj4gRG8gd2UgbmVlZCBkaWZmZXJlbnQgY29tcGF0
aWJsZSB2YWx1ZXMgcjlhMDlnMDExLXN5cyBhbmQgcjlhMDlnMDU1LQ0KPiBzeXM/DQoNCk9vcHMu
IEkgSnVzdCByZWFsaXplZCBpdCBpcyBub3QgbmVlZGVkIGJhc2VkIG9uIChyOGE3NzltWCkuDQoN
Ckkgd2lsbCByZW5hbWUgdGhlIGZpbGVuYW1lIGFzIHJlbmVzYXMscjlhMDlnMDExLXN5cy55YW1s
IGFuZCBzZW5kIFYzLg0KDQpDaGVlcnMsDQpCaWp1DQo=
