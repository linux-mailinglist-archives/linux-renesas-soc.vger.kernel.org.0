Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D9416FC087
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 May 2023 09:35:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbjEIHfJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 May 2023 03:35:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233960AbjEIHfI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 May 2023 03:35:08 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2098.outbound.protection.outlook.com [40.107.113.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E38419B3
        for <linux-renesas-soc@vger.kernel.org>; Tue,  9 May 2023 00:35:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EBAn/5nBBCyHCRjvx5RDr6iRE1Wa/bQzy5egoyXjAmemEcM5+i+WVBFKGhwvT0jJQy3aM1v1Sl/vMraXD0cMSL2oJU5qeNrTYPtXCxF9kELJK4VubAiQ1H5qCAVrTtTCcFQBTBNYvodC1NwIQcI40qa6R2Vx0oYW2I8N5W9BVTGVmRIgELmJ23vroZdw/myiTBQC9tMj7qx5pYXUCpg19+o91h6lMgz7psDIhl4fxyGCMFP6yR0gY30RsGeygMAscMQWeK1hTlAba61TWeH0ModeiTS3zgmWxGnV8lLsoPg+fHI2zt1GEXtV6B16QVwmvuNh8F7R/KGaELVO6u8gTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qK3jNUiXwctQMuUYXu3xufpHEhrP1aM9fsupXPJ4qIo=;
 b=htvqfS0ksP0deTVvcr4Yg5/yoGxqLH0wSmOcC2id3QfqC132lYkM9nF4+pGuuCm27lZ7BzCMQMruFygOXhbmRBuSKATmHXgjbKuo5nM5zzS9KeV7hQWC9aSGlY7OKCsOrsHilvHkXDzqimCzkBc+sYMtSgkaJkA2Yz00ZehIJ/0cnl/GiLjv1oW/APkqqnVPOGiJcGJSacQdb1Hzvgg+VxVjgZpF+NA8kI9O9kij/LkTEDZeXQdv7R6IvwkA0rt4EWb8GPY90h9zTatfldNbltxo6SNhd9mHFwZvUGitM9v6zX33L123JcuA2duDuR1TUu20kzZEVKkF5m6u8qRwkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qK3jNUiXwctQMuUYXu3xufpHEhrP1aM9fsupXPJ4qIo=;
 b=VH1rWbYRJRhYxew8sr7vhNRk2Mi2mL0RDMpRwfyld1lI00I8pwjGiRAj45Gk45PRiTVwHzhI0Edu/n1Vtd+fF41HmR5fgVO0NFp8EOZYzYgoTS4LymrSAjaM+VQPqfW8qpWT5kQC0e868zgeC+qg7vTq5CeHOuQIUVCCwZDfUqE=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB11621.jpnprd01.prod.outlook.com (2603:1096:400:3b8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 07:35:02 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 07:35:02 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Lee Jones <lee@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH v2 4/5] mfd: Add Renesas PMIC RAA215300 RTC driver
Thread-Topic: [PATCH v2 4/5] mfd: Add Renesas PMIC RAA215300 RTC driver
Thread-Index: AQHZf3aj2rY7Ee22ykCAZA9TJ0ZPFa9RiFzwgAADeoCAAACWwA==
Date:   Tue, 9 May 2023 07:35:02 +0000
Message-ID: <OS0PR01MB5922474E0B42B6301DB1961986769@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230505172530.357455-1-biju.das.jz@bp.renesas.com>
 <20230505172530.357455-5-biju.das.jz@bp.renesas.com>
 <OS0PR01MB5922CB267130D6E5DBE4AD1086769@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdU36vONu2GMKYZwtLPo_+CDYnWKDXjMytAg0r6BPRUv7Q@mail.gmail.com>
In-Reply-To: <CAMuHMdU36vONu2GMKYZwtLPo_+CDYnWKDXjMytAg0r6BPRUv7Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB11621:EE_
x-ms-office365-filtering-correlation-id: b702891c-16aa-4b69-9af2-08db505fe699
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2xGVLBJNLRykYU1KqAEAH3kLdcxTTdpw/DCMGrIOKJM5pb3Gy80mhjzsRi3TNfCDXNSuRw7Kti6j2K6Cm1pnh50of48hX1OgoGhW9udZ9PjtjApsdOicvyVN7aF/sxkadnlTvBpbbK+WqPjfEljdcqS2+coXNxrbfa3bbXFiS3eNHQVZkPpNU0Xs5QI2q/6mIMyhw64yMpDHLaGqYkNGIecMl4aQLXeSqX4FNGcP98gAcwmxwCPrmeOHeItM4Z3cwMCU4dEPFRRI+MP9pPavN1tqCxkPLVaWGKBxcOjdVDT6E11QVwXg9rE5RHA5qXUeJseaeUR4HUUFR1gou6c231D6OFfivxnM/Vub49rtBlOlvfHwVc34gzYtbhyCMTYXbVV9qGOBtY0zWpsBMaWrCHhaPkq0sXksMJAN3TqVgILWChfbnzB001K4+jwlT+0ePhYqAFzFiDUfNLqpxvVZDT1LdFS9XLR2jtqGEdZNVQRwiKgQJ9j7aiAVQi8DPtoNPNPR7uy/YZafCgcxrzTV9My9lblOlrHz1iL+WEImULWVinNbNwXBL/ZaT78u2k/uQ/1E6kYDElFJyhqtdJXbc6D2j/SvdjQRYbLo2AB1oOw/1jsSGcfCKm6iFGLEg/Ie
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(451199021)(54906003)(86362001)(38070700005)(316002)(71200400001)(7696005)(66556008)(66446008)(6916009)(64756008)(76116006)(41300700001)(66946007)(66476007)(4326008)(8936002)(52536014)(5660300002)(478600001)(8676002)(9686003)(53546011)(33656002)(107886003)(6506007)(2906002)(186003)(26005)(122000001)(38100700002)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGQxaXBUWnUzMkQwYmQyMFAzTFNXZkkyQWpQbjZRdXM4ODgxbUltS3F4QVJH?=
 =?utf-8?B?aytRMmdkckpqY1lWRU9PMDMrQXRDaFg2amtJaUduWkdTTnA5Z2hzNk9ZQitS?=
 =?utf-8?B?aVhNOG1zMjkvV01HN2dGZWViNHkyelp5NTZ6UmhYSEdObHBEL3V4bXBlVmxS?=
 =?utf-8?B?Ykwxejl3QitISmlGMFM4TGdlZWNHQ0dPSGxHQTY1YUZXS0dPUWxqKzR1ZUE2?=
 =?utf-8?B?c0RkeENPUkVNVzZYa254U0dQL2Y5OFU4eldZNFJpY0xQZjd2TE5BYTVOUzhH?=
 =?utf-8?B?Q2tmbmRTOWUxVEpaaEZCb21EOXd1ZEdOaWVnTjhYTFNDc2MrMWhkUGI0K0ZY?=
 =?utf-8?B?RWovRHlyRlVWU21TKzNobDNCQW5FVjdJcVphMDl1MnlyRHlqTDJjK2hnd1JZ?=
 =?utf-8?B?eUFDWXZ3UEdmczd2N1Juc3lpemhTTllvNm5nZlQ5Q2I0ZXJSNVVXRm9xd1cw?=
 =?utf-8?B?bzZxKzZDR3I1VHF5YkxpQTNIYmlTcTBIMnVUTUd4Q3c1bDQ2eXh1WE1ra2Zr?=
 =?utf-8?B?VXFLbnliY3U1TUd2VGNQSlZzODc3TzVTaTJjNDdXU3l1Y1pEZG1FMk5CTDEv?=
 =?utf-8?B?aEJudDVoMEZrSy9HUTVkQkQ1RnY1RmY1dzVNcXYrdExkWEJvWDBXVk9SdHJ0?=
 =?utf-8?B?WFRLY2pMbStuYXpIem9QNFlLVmgzampHQTBVN29nZmNqSFQ3NW84bVlzU2o0?=
 =?utf-8?B?b3FyMW9YbkRJaUVjaFpxeUFsRkwwRjBuTFpPZHJ3ZldUQUN1VzdnVjd3d2c0?=
 =?utf-8?B?MWNlUkh5UklnMWhrdVhjcndqNjkyb3E5Tkd5MGlQN2FKc3BDS0l2bHVJTUlW?=
 =?utf-8?B?QlFYYjA1eE1pL1I4S3pONldpb21Cb3prcFE3S3U0WkZjUkMwQkxTN0k5QU52?=
 =?utf-8?B?MHdWbTNWcEJiaGFGaXFRaEZtSGhGM0drRjJSNDVYNGZ5L2Z3a0ZDSVhiN2dS?=
 =?utf-8?B?YmpzUTNiQkhGK2NVcTIvY1pzTXFsYmhPdS9YenNHVFdSNTRhUzYzNmFsdjdD?=
 =?utf-8?B?Y0YydE5UM3IvbVgrclMwUjNneUdpRXJJdHRiMWFTWGFia3JnZUV4ajNkV21Z?=
 =?utf-8?B?TCtHY1k4RWJSUngra3hHWHlicm12aHlKR0RLT0NEMFZrNWhpa2d2bW4zbGsz?=
 =?utf-8?B?NzJwK0lmQ1V5S0wyNXhFVkpJOFFsTlhYckxiOEJ4cFdZdDlwdVgrc1VLQ2NI?=
 =?utf-8?B?cDZEQmNQelB5eGJXSDZNaHU5QjQ5MU4wNnRhdzA3ckNrM29YSlBBcGp0OTJr?=
 =?utf-8?B?eW9pYjZIV21MSkJhOUZlc0xER0tZRkVKdFlsUjNJUUhuUkZCVlN0WFNKMlNp?=
 =?utf-8?B?Y3JjTXFJbXRKMkVueHZEazcrdnBTd2R6WHdyYVlwV2dDR1I2dFdjSHhOcFdJ?=
 =?utf-8?B?aFIvZUN3RUMxa2tXQjBCWkE3MlFhMXp6amhka3duc05FMWw3TmExT0VUTlR5?=
 =?utf-8?B?S1NnRDJySjZFc3BLT1VXdU1XeVFIcldqSVRGUG5iWWJVdnFzQWVkZGlScDl4?=
 =?utf-8?B?dFQxc3hHNE5GNFdVaXJnRmQ5Y1hkVUtwOWVHV2pMUm5UNDdvM3pIVXFyUkl2?=
 =?utf-8?B?Z0x3MzFoeTVzU3kvOW44YXp4Y1RyOUtrYWdZZDdXK3JNdW5WdHowOFNGMjFx?=
 =?utf-8?B?eldYUStIdXNDZXY3QWdxcHp0Z1ZqeFgwdTBtM3dvYXRsRkY4U2FlWGNuallB?=
 =?utf-8?B?dFJFa0Z3M1hUdlJmYUhxdmVmRFVGRDJlOUtrdTRsekhaRkNQOEJBT0x3c05F?=
 =?utf-8?B?ME5UUUMyY0c1R3poeUZ0VmpQdXRCUEpLUnlZdVU0dDJSY0NxRWY2N254Vlg0?=
 =?utf-8?B?OVI3NEtUeGpWWnhwN1FMbVNPaFlxQVMrNElrWW1QWXozeVIyTGNweTYxK1U5?=
 =?utf-8?B?d1dqbTBkdUp1Q2RLMTZacDR6QlRtRUxmRzZXVjU0ZGl1L1VnSGhvTG4wemRD?=
 =?utf-8?B?OFY2cWJJNFM4Y1MrVUZDeUhIRGRRcEVBMXFVLzhuZG9wNUphOGxXYTBuY1kw?=
 =?utf-8?B?Slg1NW96OEh1bk9xRUx5WW4zMzY4RGI4QlQxYk9KY1BiOTdFUW9xZnB3MU5V?=
 =?utf-8?B?OHZaLzhaSW1ramhVczZkekViYmZKaXpsd3U4TVBVVnRKRHdGUDFhZVhyU1Zv?=
 =?utf-8?Q?oAwxeoSeHu/n1KkBa2zMgGKj3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b702891c-16aa-4b69-9af2-08db505fe699
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 07:35:02.3511
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qSTbVZIzIvcuvIRooLx/UmCqFbsewGtxgTpEJoSsj3lcNviuk3NHf4XxN51jawcWmMMiwT6dSRxCvLG0s16TAkLfn8PMgzQ7ciNSk6+IDko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11621
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgNC81XSBtZmQ6IEFkZCBSZW5lc2FzIFBNSUMgUkFBMjE1MzAwIFJUQyBkcml2ZXIN
Cj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUdWUsIE1heSA5LCAyMDIzIGF0IDk6MDbigK9BTSBC
aWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gU3ViamVj
dDogW1BBVENIIHYyIDQvNV0gbWZkOiBBZGQgUmVuZXNhcyBQTUlDIFJBQTIxNTMwMCBSVEMgZHJp
dmVyDQo+ID4gPg0KPiA+ID4gQ3VycmVudGx5LCBpdCBpcyBub3QgcG9zc2libGUgdG8gaW5zdGFu
dGlhdGUgdGhlIGkyYyBjbGllbnQgZHJpdmVyDQo+ID4gPiB1c2luZyBNRkQgY2VsbCBhcyBpdCBp
cyBub3QgYSBwbGF0Zm9ybSBkcml2ZXIuIEFkZCBzdXBwb3J0IGZvcg0KPiA+ID4gUmVuZXNhcyBQ
TUlDDQo+ID4gPiBSQUEyMTUzMDAgUlRDIHBsYXRmb3JtIGRyaXZlciwgc28gdGhhdCBpdCBjYW4g
YmUgaW5zdGFudGlhdGVkIGJ5IE1GRA0KPiBBUEkuDQo+ID4gPiBUaGUgcnRjIGRldmljZSBpcyBj
cmVhdGVkIGJ5IHVzaW5nIGkyY19uZXdfYW5jaWxsYXJ5X2RldmljZSgpIGFuZCBpdA0KPiA+ID4g
cmVnaXN0ZXIgYXMgdGhlIHJ0YyBkZXZpY2UgYnkgdGhlIGhlbHBlciBmdW5jdGlvbiBwcm92aWRl
ZCBieQ0KPiA+ID4gcnRjLWlzbDIxMDggZHJpdmVyLg0KPiA+DQo+ID4gTm90IHN1cmUgdGhpcyBw
bGF0Zm9ybSBkcml2ZXIgaGFzIHRvIGJlIHBsYWNlZCBpbiBSVEMgc3Vic3lzdGVtIHJhdGhlcg0K
PiA+IHRoYW4gTUZEIHN1YnN5c3RlbSBhcyBQTUlDIE1GRCBkcml2ZXIsIGNhbiBpbnN0YW50aWF0
ZSBpdCB1c2luZyBNRkQgY2VsbD8/DQo+IA0KPiBDYW4ndCB5b3UganVzdCBpbnN0YW50aWF0ZSB0
aGUgaTJjIGFuY2lsbGFyeSBkZXZpY2UgZnJvbSB0aGUgUE1JQyBkcml2ZXIsDQo+IGFuZCBkcm9w
IHRoZSBuZXcgbWZkIGFuZCBwbGF0Zm9ybSBydGMgZHJpdmVycz8NCg0KWWVzLCBpdCBpcyBwb3Nz
aWJsZS4NCg0KVGhlIG9ubHkgcmVhc29uIE1GRCBpcyB1c2VkIGZvciBmdXR1cmUgZXhwYW5zaW9u
IGxpa2UgYWRkaW5nIHN1cHBvcnQgZm9yDQoNCjEpIGJhdHRlcnkgY2hhcmdlcg0KT3INCjIpIHJl
Z3VsYXRvcg0KDQpJbiB0aGF0IGNhc2UsIHdlIGNhbiBzaGFyZSByZWdtYXAgdG8gc3ViIGRldmlj
ZXMuIEJ1dCB0aGVzZSBkcml2ZXJzIGFyZSBub3QgY3VycmVudGx5IHBsYW5uZWQuDQoNCkFwYXJ0
IGZyb20gdGhhdCwNCg0KMSkgSXQgYXZvaWRzIHN1YnN5c3RlbSBkZXBlbmRlbmNpZXMsIGllLCBQ
TUlDIGRyaXZlciBkaXJlY3RseSBjYWxsaW5nIHJ0YyBkcml2ZXINCiAgIGZvciByZWdpc3Rlcmlu
ZyBSVEMgZGV2aWNlLg0KDQoyKSBJIGd1ZXNzLCB0aGUgY3VycmVudCBzcGxpdCB3aWxsIGFsc28g
Z2l2ZSBzb21lIG1vZHVsYXIgZGVzaWduLg0KICAgV2UgaGF2ZSBhIGNvbnRyb2wgdG8gZW5hYmxl
IG9yIGRpc2FibGUgdGhlIGRyaXZlci4NCiAgIGllLCBFbmFibGUgdGhlIGRyaXZlciBQTUlDIHdp
dGggUlRDIGVuYWJsZWQgYW5kDQogICBkaXNhYmxlIHRoZSBkcml2ZXIgUE1JQyB3aXRoIFJUQyBu
b3QgZW5hYmxlZChpZSwgWElOL1hPVVQgZ3JvdW5kZWQpIGluIHRoZSBzeXN0ZW0gZGVzaWduDQog
ICBieSBjb250cm9sbGluZyB0aGUgY29uZmlnICJQTUlDX1JBQTIxNTMwMF9SVEMiLg0KDQpUaGVz
ZSBhcmUgdGhlIHJlYXNvbnMgZm9yIGNyZWF0aW5nIE1GRCBkcml2ZXIgYW5kIHBsYXRmb3JtIGRl
dmljZS4NCg0KSSBtYXkgYmUgdG90YWxseSB3cm9uZy4gUGxlYXNlIGNvcnJlY3QgbWUgaWYgdGhh
dCBpcyB0aGUgY2FzZS4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo=
