Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 970E5625948
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Nov 2022 12:25:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232182AbiKKLZ2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Nov 2022 06:25:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231681AbiKKLZ1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Nov 2022 06:25:27 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2125.outbound.protection.outlook.com [40.107.114.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5F8A60EBB;
        Fri, 11 Nov 2022 03:25:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LzyANz3hfxgDLfrxHWrBgzTpXp1I5HspHrf6j3OGD8dPlsCU0BsMOEGjQrMaPRdZC1rl+kU3hbwidioXcGkplAhT24CjCJwhr+TbogQ92oi4e83aGVy27SMuvxP8v2Hm5su2JTyGji7hIc4JWz7GhUfWB0mknyblh6lWl2AfQVCktLtEm09bNYj19ytR4sDVvJR/hR/PINdXDgdWsslD3aPfKTmA5o8F1iCPRv7Lzr+EWDR1hKu/phgGNr8w82wXqk9cuPFXNhCYLGscymNvJGKGl31fGhxyhXw7K4HAEFYa/n/epRnSxsa0118XcaKZeE31FsUlviJdhXLAPseWXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2GNyuA7vV/RKnk2SRKW1zz0gv2AhQNHu8cTxULpShk=;
 b=YbqH2wZkqjKBHieluCaES2RY8dz9NmTLelFvE+zHbCsVxOMFsYKdWep3SztL5sSVFz4+vEN8S6IT7Am4x8uX48N/8yWmiu7m6x0xhLIaSVNTScqqOa4BKBue1nM2EKf7nsh3cHP0OtTFXIOhvxQtyVx6jlQprCJVTOgQ33J2RCc6VEQgZWvTKGSfjCbqCW1xIvrpHtkyTiuaGGCTCdRI1hZPUpq/zgGIjXQkC9Hmz3hAwRwPM5hS+nHb2LiK3FxX3pVfzc3ecZhlgWBo+Be3phE4MEdHrDgdYjI9RfexPd633LJ7zqxLcok8tM5ZvxSJdREpmjElR9vqICVZy5jphw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2GNyuA7vV/RKnk2SRKW1zz0gv2AhQNHu8cTxULpShk=;
 b=lbof99zKbzJPNh9689AfsjVFK310yrgyLw1xgRkOEG2AiIOz41T09Hodd+fnVGYoy4+haA+PGGULXwwiqguaLRvzOCm0kbPLJ23sx6zmVK6+nSAFAvNH4osSoxq6xyhLg/g6NHXfVRHzHKt1aKU07PIWZWXClooRLpXoIh5fy8g=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB8365.jpnprd01.prod.outlook.com (2603:1096:604:190::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.14; Fri, 11 Nov
 2022 11:25:23 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::5b24:f581:85bd:6ce2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::5b24:f581:85bd:6ce2%3]) with mapi id 15.20.5813.014; Fri, 11 Nov 2022
 11:25:23 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH v2 3/3] arm64: dts: renesas: r9a09g011: Add system
 configuration node
Thread-Topic: [PATCH v2 3/3] arm64: dts: renesas: r9a09g011: Add system
 configuration node
Thread-Index: AQHY9SCF6b1SNCs8dkO8lRnBdWXNLK45ZqwAgAAJIcCAABzNAIAACSkw
Date:   Fri, 11 Nov 2022 11:25:23 +0000
Message-ID: <OS0PR01MB5922237A4E12EDADFDF76FAB86009@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20221110162126.103437-1-biju.das.jz@bp.renesas.com>
 <20221110162126.103437-4-biju.das.jz@bp.renesas.com>
 <b28c469b-f0f0-47c0-dd07-bf2dcde55824@linaro.org>
 <OS0PR01MB5922ADB9F181E6745FE46EE986009@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <b4e54a00-cc37-8c3a-8f72-289fdff5f1d2@linaro.org>
In-Reply-To: <b4e54a00-cc37-8c3a-8f72-289fdff5f1d2@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB8365:EE_
x-ms-office365-filtering-correlation-id: b7264c94-8e45-4422-f30f-08dac3d76c95
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MU1Hvw+NmwQG6XXbisolna8cxC6kxkPkeSKfX/BLIguHbym4QVtK8c5RftALLVAQnJw0pdxKjCOwyPOp44BP7T6wSncHKWxtCbYLu6Xu6MGUPBL/Y9kVKSig7VPQgVvakzqOFxmwljLhD28km0/tJFtGs1lBZxUOZMEASRww6fCbynM2bNHf7esEerO72plso7n0LrQYhO8AmEBWzfkzEIaHdeM8aO4LlnGim5Dj235bK2CPPPhhxnYl6BRbIKzH52tXjd1Tr4jv+IOcohw98ZvpOPnLL3a2ArMwRXza+ZQ+9ELpxG83S61W3GePbHqE3WB82qynUlgmWz13XcP2DS4uZIj31yURhPmynu6oUOIxacz5L0JVASnuSclF17IomG8cRpwwYO0OixUih/o+uvRha0wFqtG+aAOXngv7EiIhCCsUvGW1h6tFsH0zuUmA+LgvU8pSynWGVQfsFSqG2aAk+Hj6U8ArBBGYEZvn8foWfqNXpl0L2JLTc/YSJXPvuYR6uYmS8JWPFVkUkJHZp34/a4kq1AlkSQ7azWGnZFUxzKdzHPzdHKJMRAKqqlJrHSDfjvhGoN8atFhBOlPeULyJN/J9w/EhTg4mz2qMpA7YJNUoryjTucTKcFz5HRzGI/GhmtVerE/dSCAVzf3belrENpyIRzxatdaLee2mqxIdNJEcwQ6h+uYD9wwtsd2qmN22ppkqZe409gCZSCFWP884ydzWjuVe1FDeHfqdkXV7kJg1PiWwL2007uQ9UTv1PJohwZy0bev5lgaISC163ZtTMjVAY7fAMA8nmzsim5U=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(451199015)(55016003)(316002)(107886003)(71200400001)(478600001)(966005)(8936002)(186003)(52536014)(38070700005)(110136005)(54906003)(7696005)(6506007)(2906002)(122000001)(83380400001)(8676002)(5660300002)(4326008)(53546011)(38100700002)(76116006)(66946007)(66556008)(66446008)(64756008)(86362001)(66476007)(41300700001)(26005)(9686003)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y1BDR2RTcXd2aXI4TlFtVlNaZTR3MGZoZzB1OE9oWHNqZnZyM05vZUJiOTlQ?=
 =?utf-8?B?akM4WlRwblZaQlF5ejNualJ2ODduazJGdWZtUE1vTk50Y0c5MmxaZEc0U1kw?=
 =?utf-8?B?K1d3ZVlPMWIyQUg4d1VWZFU0elM3ZUxIdU5UZndsWW5UbENhaGg2Q2lJYlA0?=
 =?utf-8?B?SnFYQ0w1QW5oN29tazBTaVlTMHRRRk9WdElwdTIyY0hoYVBSWlV0RHlERXh1?=
 =?utf-8?B?akpveVpRbGtOMXp4VDdVSlM3bUxsNUh3c3lDVkNsN3czeEM1ZFdwRms5SENV?=
 =?utf-8?B?Wmt0WnlaK3JNR3FBRVVkaXZqQ3I0SjFSVkYrZ3B2ZVA0Ym5UY3NMcVFqcUpl?=
 =?utf-8?B?T3FUUm9HWkR5VVFacGNXREhLWURybWUyQjFhRnBBMldlaVEyMjkrNEs4aWEx?=
 =?utf-8?B?NmZRdW1SWmhGVjhiVDJJc1djaGlwdXV6VzFrc3lJSVRiZFJEODVlSlgrU0Iz?=
 =?utf-8?B?dGpMcjZ6OEgvdjFGRUlPL241Uld5VFQ3bllwTlliTHJoSnlQTFhLQUYzTytk?=
 =?utf-8?B?aWhGV0pBYVJ5VjNrQTlNV0F4cXQ4QUFnd2IzbXlNQUlFSHRCb2M3VG1rM2c5?=
 =?utf-8?B?TVk5OHlGMCtJamR2QVg4ZUkxR0p6ZU1IdWRKOGFCVFM1U0pxV3FQRTRZY2NK?=
 =?utf-8?B?V0F5SWNvQVhMamFMeURjVVh1V1J1ZEJYNCtiNG9TMkhiWkxudThiVDFyelpV?=
 =?utf-8?B?M2NvS1VmTkpDZGJJVSsxVlQvLzZPbjk0emdldGE2NXQxeFRrcGpsSnNza2ZI?=
 =?utf-8?B?TEpqeUtxTHo2d2J6SXlrV1htdEM2a2pzM2lOYlBiVDd3cXhkRzZPVUs0dGhG?=
 =?utf-8?B?elowaFBDL28wYUM2Zmw3dWRjMkVpdytnYWxyRU94dHpnY2E5K2x2QkNWc0hF?=
 =?utf-8?B?dHNrSkl2amdSK2tkUHJhTU1wYWhscmFkTEU2ZCt6RjJjWmdyTTlDTjFHRTA2?=
 =?utf-8?B?VU8wbGxNbkY1QVU5Sm95eTgvbjhsKy9aVTFYKzZhYzFRQlp2T3pxcnZhZ0g4?=
 =?utf-8?B?UVRickF6YSt5OGcvWGxCQk9YNFRnTXNwVmFPR3I0Ymg4VldvN204dDY0ZW02?=
 =?utf-8?B?eHhBZjByUlh0Nm5TZkE0VWd5OW9NZFd2VXVyNzcvWGhqS1FhY3Z6Y3ZNbG1r?=
 =?utf-8?B?eVY5c0RkejZYV2xOMmFLT1pURURRYldjemJJNllrd3VZUi9LY1NJblRNWUdt?=
 =?utf-8?B?QkNXcEF3ZnVWLysveGhVbFhOelJvNkZKNEpIZXc0dCtKRDgzb3lNTzJtQmJJ?=
 =?utf-8?B?WlJ1VUtKS1FDSzZLWFJLNFVJMjhySGxvcHRKUHMyVEJGSkU0NjNRVGVLbVkr?=
 =?utf-8?B?d0IxdmorZUpWa014ZGMwNVRpMzRWR3A4K0hrRVFmZ3ZkL3h2THdBQzkyTUEv?=
 =?utf-8?B?dElGMnZHQ2U1UElDMldSZlhVTEFmb21zZVIwbGNCZGtVdkJBcWJxSlRYWVBJ?=
 =?utf-8?B?SE1aSDk1VmJCaU45dkpIUVcyeTI2VSsrWEVDNnNlNG8zaUZZNm01bkdhTGYw?=
 =?utf-8?B?emZnYmhqY0ovdm0zN1ZMWVNkdXU1d3NEM0p6eDJTSGdod1FIdGNmY3E5VWty?=
 =?utf-8?B?MXhVMngvaHFUcFV4WVJWU2tuQ08vLzd0S2pyWVVrQzE5bFphTk44U3czbHV5?=
 =?utf-8?B?ek5aN3Z6ZG9Ia2RrMVM2Nmp1dlpGdHBwYWRhZjNjL1gwWkJ1MVFnaFUyMUdF?=
 =?utf-8?B?djMvVVF3VW9XVlVhRkRxaUI1NnNydDFQcktLb2hxWWtGU1NXVDArYXhzcU9F?=
 =?utf-8?B?ZVZjVzJvL3ZKeFVISUt1cDh4aDlROEo2bXdYdjR2K1pmcFU2MTg1ZUZvY3pZ?=
 =?utf-8?B?OGhNRVRlNUhJMFRCMEdYT3grY0hnVTFtV1RvNUx0SXo5OVFrOTlIczVjY3BN?=
 =?utf-8?B?Q1JYUVpxNG5OWmNvZi92YXBLODhpcS9QVVJmK3c3bEpnUnN3aHpFc25uT1F1?=
 =?utf-8?B?eFl4NWlJNklpTXdib1pVOEdiVlI4RUZDamNPa3U4Q295SUN0bFc0dlc3eVM4?=
 =?utf-8?B?VVNDajdGUll4Q3lnQzd3SWFVRUxEM2NSWmtxZ3RRMDBnL3l2bklpc2NpUVVa?=
 =?utf-8?B?bllZekI2bHFiN1pTMi85dStkWDdxYTZ2TDhzdjQ0eTJpSWZXbmhyRFo5R2oz?=
 =?utf-8?B?S29VZUhmVXZ2WmJ4eDg5SEcxaHloOVZyTlpCSEg1K0s1MzVrNXFYUnVzaFZi?=
 =?utf-8?B?MkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7264c94-8e45-4422-f30f-08dac3d76c95
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2022 11:25:23.3029
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j1D7y8wmY6yQhKvl92yyk73161GlEsHLNo51GYXI6CyQyOaCbi4XijzslcwLFnIin8O7rQIqQVGBTePUTWNMaT49QSALtQaktZz5PuL/mDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8365
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5v
cmc+DQo+IFNlbnQ6IDExIE5vdmVtYmVyIDIwMjIgMTA6NTENCj4gVG86IEJpanUgRGFzIDxiaWp1
LmRhcy5qekBicC5yZW5lc2FzLmNvbT47IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+
Ow0KPiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5v
cmc+DQo+IENjOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPjsg
TWFnbnVzIERhbW0NCj4gPG1hZ251cy5kYW1tQGdtYWlsLmNvbT47IGxpbnV4LXJlbmVzYXMtc29j
QHZnZXIua2VybmVsLm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IENocmlzIFBh
dGVyc29uIDxDaHJpcy5QYXRlcnNvbjJAcmVuZXNhcy5jb20+Ow0KPiBGYWJyaXppbyBDYXN0cm8g
PGZhYnJpemlvLmNhc3Ryby5qekByZW5lc2FzLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
MiAzLzNdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHI5YTA5ZzAxMTogQWRkIHN5c3RlbQ0KPiBjb25m
aWd1cmF0aW9uIG5vZGUNCj4gDQo+IE9uIDExLzExLzIwMjIgMTA6MTAsIEJpanUgRGFzIHdyb3Rl
Og0KPiA+IEhpIEtyenlzenRvZiBLb3psb3dza2ksDQo+ID4NCj4gPiBUaGFua3MgZm9yIHRoZSAg
ZmVlZGJhY2suDQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJv
bTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPg0K
PiA+PiBTZW50OiAxMSBOb3ZlbWJlciAyMDIyIDA4OjM1DQo+ID4+IFRvOiBCaWp1IERhcyA8Ymlq
dS5kYXMuanpAYnAucmVuZXNhcy5jb20+OyBSb2IgSGVycmluZw0KPiA+PiA8cm9iaCtkdEBrZXJu
ZWwub3JnPjsgS3J6eXN6dG9mIEtvemxvd3NraQ0KPiA+PiA8a3J6eXN6dG9mLmtvemxvd3NraStk
dEBsaW5hcm8ub3JnPg0KPiA+PiBDYzogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2Fz
QGdsaWRlci5iZT47IE1hZ251cyBEYW1tDQo+ID4+IDxtYWdudXMuZGFtbUBnbWFpbC5jb20+OyBs
aW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmc7DQo+ID4+IGRldmljZXRyZWVAdmdlci5r
ZXJuZWwub3JnOyBDaHJpcyBQYXRlcnNvbg0KPiA+PiA8Q2hyaXMuUGF0ZXJzb24yQHJlbmVzYXMu
Y29tPjsgRmFicml6aW8gQ2FzdHJvDQo+ID4+IDxmYWJyaXppby5jYXN0cm8uanpAcmVuZXNhcy5j
b20+DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMy8zXSBhcm02NDogZHRzOiByZW5lc2Fz
OiByOWEwOWcwMTE6IEFkZA0KPiA+PiBzeXN0ZW0gY29uZmlndXJhdGlvbiBub2RlDQo+ID4+DQo+
ID4+IE9uIDEwLzExLzIwMjIgMTc6MjEsIEJpanUgRGFzIHdyb3RlOg0KPiA+Pj4gQWRkIHN5c3Rl
bSBjb25maWd1cmF0aW9uIG5vZGUgdG8gUlovVjJNIFNvQyBkdHNpLg0KPiA+Pj4NCj4gPj4+IFNp
Z25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPj4+
IC0tLQ0KPiA+Pj4gdjI6DQo+ID4+PiAgKiBOZXcgcGF0Y2gNCj4gPj4+IC0tLQ0KPiA+Pj4gIGFy
Y2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwOWcwMTEuZHRzaSB8IDYgKysrKysrDQo+ID4+
PiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQ0KPiA+Pj4NCj4gPj4+IGRpZmYgLS1n
aXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDlnMDExLmR0c2kNCj4gPj4gYi9h
cmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDlnMDExLmR0c2kNCj4gPj4+IGluZGV4IDdi
OTQ5ZTQwNzQ1YS4uMDcxNjRkOWU0YTBmIDEwMDY0NA0KPiA+Pj4gLS0tIGEvYXJjaC9hcm02NC9i
b290L2R0cy9yZW5lc2FzL3I5YTA5ZzAxMS5kdHNpDQo+ID4+PiArKysgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL3JlbmVzYXMvcjlhMDlnMDExLmR0c2kNCj4gPj4+IEBAIC0xMzAsNiArMTMwLDEyIEBA
IGNwZzogY2xvY2stY29udHJvbGxlckBhMzUwMDAwMCB7DQo+ID4+PiAgCQkJI3Bvd2VyLWRvbWFp
bi1jZWxscyA9IDwwPjsNCj4gPj4+ICAJCX07DQo+ID4+Pg0KPiA+Pj4gKwkJc3lzYzogc3lzdGVt
LWNvbmZpZ3VyYXRpb25AYTNmMDMwMDAgew0KPiA+Pj4gKwkJCWNvbXBhdGlibGUgPSAicmVuZXNh
cyxyOWEwOWcwMTEtc3lzIjsNCj4gPj4+ICsJCQlyZWcgPSA8MCAweGEzZjAzMDAwIDAgMHg0MDA+
Ow0KPiA+Pj4gKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4+DQo+ID4+IFdoeSBkaXNhYmxl
ZD8gWW91IGRvIG5vdCBoYXZlIGFueSBvdGhlciByZXNvdXJjZXMgbmVlZGVkLiBUaGlzIGlzIG9k
ZC4NCj4gPg0KPiA+IE9LLCB3aWxsIGVuYWJsZSBieSBkZWZhdWx0LiBDdXJyZW50bHkgdGhlIGRy
aXZlciBjb21wYXRpYmxlIGlzIHVzZWQNCj4gPiBmb3IgZ2V0dGluZyBTb0MgTWFqb3IgYW5kIE1p
bm9yIHZlcnNpb25zLiBCdXQgbGF0ZXIgd2lsbCBlbmhhbmNlIHRvIHN1cHBvcnQNCj4gbW9yZSBm
ZWF0dXJlcy4NCj4gDQo+IFdoYXRldmVyIHlvdXIgZHJpdmVyIGlzIGRvaW5nLCBzaG91bGQgYmUg
cmF0aGVyIGluZGVwZW5kZW50IG9mDQo+IGVuYWJsaW5nL2Rpc2FibGluZyBub2RlcyBpbiBEVFMu
IEdlbmVyaWMgcnVsZSBpcyB0aGF0IGFsbCBTb0MgY29tcG9uZW50cywNCj4gd2hpY2ggZG8gbm90
IG5lZWQgZXh0ZXJuYWwgcmVzb3VyY2VzIGZyb20gYm9hcmQsIHNob3VsZCBiZSBlbmFibGVkIGJ5
DQo+IGRlZmF1bHQuIE9mIGNvdXJzZSB0aGVyZSBhcmUgZXhjZXB0aW9ucyB0byB0aGlzIHJ1bGUu
IERUUyBpcyBhbnl3YXkNCj4gZGVzY3JpcHRpb24gb2YgaGFyZHdhcmUsIHNvICJkcml2ZXIgY29t
cGF0aWJsZSIgaXMgbm90IGFwcHJvcHJpYXRlIGFyZ3VtZW50DQo+IGZvciB0aGlzIChvciBJIG1p
c3MgdGhlIG1lYW5pbmcgYmVoaW5kIHRoaXMpLg0KDQpPSywgYWdyZWVkLiBUaGFua3MgZm9yIHRo
ZSBkZXRhaWxlZCBkZXNjcmlwdGlvbi4gDQoNClByZXZpb3VzbHksIEkganVzdCByZWZlcnJlZCBb
MV0gZm9yIGNvbnNpc3RlbmN5DQpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvYXJjaC9hcm02NC9ib290L2R0
cy9yZW5lc2FzL3I5YTA3ZzA1NC5kdHNpP2g9djYuMS1yYzQjbjYzNQ0KDQoNCkNoZWVycywNCkJp
anUNCg==
