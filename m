Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 822D76698E7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jan 2023 14:44:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233059AbjAMNoR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Jan 2023 08:44:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241634AbjAMNnT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Jan 2023 08:43:19 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2122.outbound.protection.outlook.com [40.107.113.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AEAE6D51F
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Jan 2023 05:36:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jQP2hNCOIPKWEeRgZWIhPPwd/Y01szs5AFFHYdici/5nF3M4M2obsCacVPIN9WodTpSV4z/+xMTcJlJJXXbvmVJKDIPoQ/ddLRow2tMCXw5AsQ0WU+XQhxglLfZAjDCJVDPI8BFL/iVf+TlRC4FlF/bc4fZzb2FbfO19V/BVbBJQN+z9iW1/+HxgkJ81zyrsM4xcto0YlK65Bd0J/O08QN+JdF+4EE23A4ups04Rema+lY9jHurybJR9TOMnyqGzuGKkpPkPl9IlY6TsuBWc8cjBKQ4H2h5mh35Tc/z5aJsNLRrX9TyByMHZpgliiw0SGBPNQzWBEHPxC8OxVlmiTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMja5OwIzA7IxaEAXz6oHgMdXWosGVuX4GFwXDe0plA=;
 b=WmNu6wMqx7DsDbrjBB8KXbpxzjxeSy/rYM0cz/DyB3sqo9MsXOeUun5Cc8gOn/JGMZO0gJ2D3ja72DmO7+33W5EQtQlC0iNE2rO4ecM014b8je6DyBOWPqLFQIFEwi4oz1t+cZA1s6fUAhTnon6HNe3fsCGAohH049atrUG6AAI2ncOPufrRcJ+OkkcdS9n8LGNn4j35PrKpmZVFSFlqJSK78IPrDhmCbsBi/x3VBexAsq8G4VlChsDVgl4Dob2R5Mkr+e2dz+67IfNhPXaBxhsFCstL6YVs06IXeA4I0rHBS7R7xXXuBBLhtBLlHxaDEUc4o1pn1J2xF9FD8r62kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMja5OwIzA7IxaEAXz6oHgMdXWosGVuX4GFwXDe0plA=;
 b=C85EZxl5GiwfVJWuvwou4hYIl9T1mjo7+Qqfkp5qtxj/DDA7p0S/F3iG/Vr/sTKfmi//Dlh6Za3YtD+27px/FYvGoOm4Uh1JFOzSTuRCL3QnQehM9ZMBchee0jAv0H0/GVc8oRUmJN1swzMe6Mm2sqNDS3+1gI+XSWTgwqOGNuQ=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OS3PR01MB9530.jpnprd01.prod.outlook.com
 (2603:1096:604:1c9::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 13:36:46 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::3e61:3792:227e:5f18]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::3e61:3792:227e:5f18%8]) with mapi id 15.20.6002.012; Fri, 13 Jan 2023
 13:36:46 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: renesas: r8a779f0: spider-cpu: Enable UFS
 device
Thread-Topic: [PATCH] arm64: dts: renesas: r8a779f0: spider-cpu: Enable UFS
 device
Thread-Index: AQHZFehjzUyxezh+wUaozJDZb2c0uK6ZhSyAgAEDAgCAAC3RAIABxiHg
Date:   Fri, 13 Jan 2023 13:36:46 +0000
Message-ID: <TYBPR01MB53419FEB4E20EC155E52AE56D8C29@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20221222093252.3613915-1-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdW7LT-JNH-iPACLQfdS=oh_g-y2OXW-1R4xM5s+jWnUUQ@mail.gmail.com>
 <TYBPR01MB5341E6C6A0FF0D2B69B879BCD8FD9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <CAMuHMdX2xJ=Tovo-VZMsPFn6zZ26=ZLtr0Uh7AGTE8MHV3ewsA@mail.gmail.com>
In-Reply-To: <CAMuHMdX2xJ=Tovo-VZMsPFn6zZ26=ZLtr0Uh7AGTE8MHV3ewsA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|OS3PR01MB9530:EE_
x-ms-office365-filtering-correlation-id: ce228bf7-85d9-45af-c1a9-08daf56b3772
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YLQT+sX+gQ43mUMZj3UZu+jSNoCTcl1Gzgdd0DD6ZNPOMxlDWqAWQ6vUub+HN9reCwqwU+kLoVYgCXdEGfEhSQDlQNLWrknR/pyZ+rbqAHNBNIv5lPOE58Nyen/9Kv3sAfBnU0Cu0zaSLx9/tSUdc+vEbxdCR4Zbi1FNA3XCoKW72rFrsC1VMzUkTpg/IJwQpMtxrIvttyJQQsliDrDUrG7nGUM5OzoUwq6rjxHnwU1zQGSeFzQfP7mhD8t2Zir8w+wiISXIa+UxtpDIVlYi+XlRCxfgS9rQrAYv7FR16+2YgaIWYGDO/NpznEB1Vu7E8T7EjuuBMkXOpwFOx3dPRUQN162zdXnKZjdBdHSqfE4fcSZ1Xj9h4exH6Hh5rkYg8maRHaYjQm195/GnxJly0j6Eoi0IzUFt5OvHDkRMMk4EfKqS97tqqKKeGw3Xo8DDokEwyff8/6Cx01W9ylcFzL8ANNWCk0wffnEZ1FxEf3xEgc4v5MA6Wd0IDi8uXyr6WdU/Qwow9dj2UoHYAYimi/an8xllfmbMfXITl2qdzavi+hyVlj5zn+6WJzX0gPz/cgxMf04FREOiEEMisRKHSlZEixdQiLX2Pg58ghbg7c0JdEVxZFGt0G+oqnacnOieUHZjwr9UJ8+ZMuHOJzLvOucS75OXLTQ5ap8mNGicapXLzAQnEb19F/fvDHnQLE4R+e5cXPue76XCpYirdRxqiQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(451199015)(4326008)(6916009)(66946007)(66476007)(76116006)(8676002)(66556008)(54906003)(64756008)(316002)(7696005)(66446008)(38070700005)(8936002)(5660300002)(71200400001)(41300700001)(52536014)(38100700002)(122000001)(186003)(86362001)(83380400001)(53546011)(6506007)(33656002)(478600001)(26005)(9686003)(2906002)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V1ZWaUJQd0k4UGlYeEtqL1hqSkJmck9MbW5NaUg2eGFhM2phcC9HT0gzYXU4?=
 =?utf-8?B?cm1oTmZ0SWdhWG54OTZHU1BHdXN2TlhZS1FQd2o3a3VpTkRSeWJuNHNMQ2hZ?=
 =?utf-8?B?RlNIeHI2SlBWWnFheUZaVHBwQXBCcTJqLzF3N3Z6emZVVys4TXBRZ3FjbFJS?=
 =?utf-8?B?bHl1dkdRVVcvbWxLcGN4aExaY1cxdmlrOVZqNGlwQTFEVzM0bWtDNjZWdzFy?=
 =?utf-8?B?Y0Y2Z01nRlRJRUlQTzRTcXJiKzNXZGNrbDRseEdOZ1hrcjljYmMwdDhTck0y?=
 =?utf-8?B?SEFod3UzNndDc01KcExYSGJQUkhXWDExeTJoL0xlOXNrd2Q1LzYvbS9zSVh3?=
 =?utf-8?B?aTZ5ZkUvVmJZRjhiTERpMGo3Q2JWTDRuQWYwYUU2ZTNJV0dhNThUdVd5VlBT?=
 =?utf-8?B?QkE2N2VKaXFFSURvMVJBQ2x2NHd6Q3VjNk5NTGJ3V0NiaXZXbjJYaW9QUGZY?=
 =?utf-8?B?R0c0dzVGclBMMW5raWZ6OUpseVZxSUpSeEV3aFlQQlRJdGxsTEhTTnVVZnJ4?=
 =?utf-8?B?N3JScFNWYWEwZStnNkpNZ1RTUkN3RUMxb1dPejc5bGtKL25iTlZvSncyVnNV?=
 =?utf-8?B?WkYzVjMvM0k1U2tPTzI0T3lWdUtwOFNETG0waTZnNzhtZ1RQeG5rR0lFR3VQ?=
 =?utf-8?B?Y1BVNUl6K2pTWmxUdjd6OEFYTG5HOVFEQXJaRkxpMGx5NFM3UytycGtodTlR?=
 =?utf-8?B?dVpvNzhTZVJINUxMemhHRTQ0dlkzejMyNWgrRXBYb1VXajNSeWhtMHA1TFFn?=
 =?utf-8?B?NG9Gc3QzMHNnWnFNVXRIZDFMbW9xVkJxczNwY1dlQnBDM0l1b1JWdEtGOHcv?=
 =?utf-8?B?MnRvU2JwaFM2SGdoVmFXdE5jNlV6VnRTVndwbCszNDBVY3JJcDc2TTQ0VVM1?=
 =?utf-8?B?MmhUUm9WV2FMejZ3WW1JaysraXUrY2p4Umg1cjFxZWQ0Mk5JMWRDR0tkOEln?=
 =?utf-8?B?bFoydTdHZFJqSzJyU3lCQmF2SFV4dEQzV0F6VnhwemtPVi91TTVKTHB1WnNX?=
 =?utf-8?B?UzNSRTAzUHp2WEt5OWR6UkRocXFKYTRNYjNZQVF0eGFLS2hmcFVJOU9kQWhP?=
 =?utf-8?B?bUpuOTY5M3hDRW5oUzJ5dWJ2TysvUzJ6RWo5VDdrNjlXVFZEVzkwRVZBazZl?=
 =?utf-8?B?c09ScVBtOElmVSszYVBHM01HeVdhNlJpR0FwYUs4TE0vK1FnYUEvNnlPc1ht?=
 =?utf-8?B?bGhIc0lRYitla0w2NjFjSTZId0l4RGtxbGk4TXMwZUhVK21WWmVFeXV4VTRD?=
 =?utf-8?B?eGpUWndnbmhlRXk5QWFTdENwT1gyWUdQbk5jY2pMVHpXN2VBK3pPZHRaemRr?=
 =?utf-8?B?MTNNNEZyRjdQUUg4VzFiMDF5dCtnSXBRdGZhV25CZjJvS3UycVBoVFdOdDgx?=
 =?utf-8?B?U3dJUk13Uk0rUW9FR3MySWJTVENJNnZscDF4MzJsZGdQQ0lrNG5oMGFXMzMr?=
 =?utf-8?B?djhPSjZzRzNQUC9RS0xpTE03UVJSWmlFbGM4aVpycnJPK3czdWhyWVdQM25S?=
 =?utf-8?B?N2M1WUdDcFBCdkcrZFlWYkdFcmRBbWFCZGNKWWgrTS9YNUFQQVluMjJuUFow?=
 =?utf-8?B?bXM4bGVuMit3Nng1NWpNTSt4M0dJbFNBazRheGRQbWI3ZDBaNlBHdHFIL0Vj?=
 =?utf-8?B?bndyVFFHazgxZHZTR1dMRzNLVEUzUzJWRklLNEJiTGpjK1Bac3E3T1l6TVlC?=
 =?utf-8?B?WjVrYW1DdjN6aGRYQjU3OXkrRElocHcwNUZxM2JKT2pYaWM4TkpLdEl0SEsy?=
 =?utf-8?B?SEtrYU03M1RGMnJ3bmI5NlowWVBnTGtEUkFBeDFHdS9UQ0JjUVI5Uy84SDlq?=
 =?utf-8?B?WjgvYWY0bXZ6YkdWenFKcXQrUmc3ZWZqY2pocVdpbmg1QkJGMGJpcFpGMk53?=
 =?utf-8?B?eWRtQWhrdGNxbk4xNm1jMkI2Ry9vV3c5a21URzM2RWprVEhDdXl2NkRVSDB2?=
 =?utf-8?B?dU1LbUwxSXUrZDN6NSt1SlFpZHp2ZDB6S1pZeVlHSTZ0NUtibmh4TkVxamxo?=
 =?utf-8?B?b2JTUmcvbS80bWdzOU9nU0cyaUpkcHZPUXY3WGZtWThQYWtXUHNOSnpkamlz?=
 =?utf-8?B?NWo0aWV2VzIrdVlHQXExWkViNGVzWDFLZUZQTEI2S3M5dnBCczZERU0raXRy?=
 =?utf-8?B?M0xUd0FQT1QxaG1PQldQTmRYblZ4OXJrd2ZNeHNtSC8veXR0bUlJYU1tL0tU?=
 =?utf-8?B?Tnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce228bf7-85d9-45af-c1a9-08daf56b3772
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2023 13:36:46.6450
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sDNfT42AD5LOQHMq9JnbSktZfo9cPDCezj1aV8/N32OuUVtmMWP5kqNY3VKxn1KxMWUIJ/t/RebfSuR3lvG2M6IjUfWEnFwnt5jhd1FnMgcgiWldMSw2/RPcs+fOk8M8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9530
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVGh1cnNk
YXksIEphbnVhcnkgMTIsIDIwMjMgNzozMSBQTQ0KPiANCj4gSGkgU2hpbW9kYS1zYW4sDQo+IA0K
PiBPbiBUaHUsIEphbiAxMiwgMjAyMyBhdCA5OjAyIEFNIFlvc2hpaGlybyBTaGltb2RhDQo+IDx5
b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiBGcm9tOiBHZWVy
dCBVeXR0ZXJob2V2ZW4sIFNlbnQ6IFRodXJzZGF5LCBKYW51YXJ5IDEyLCAyMDIzIDE6MjAgQU0N
Cj4gPiA+IE9uIFRodSwgRGVjIDIyLCAyMDIyIGF0IDEwOjMzIEFNIFlvc2hpaGlybyBTaGltb2Rh
DQo+ID4gPiA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4g
PiBFbmFibGUgVUZTIGRldmljZSBmb3IgUi1DYXIgUzQtOCBTcGlkZXIgQ1BVIGJvYXJkLg0KPiA+
ID4gPg0KPiA+ID4gPiBOb3RlIHRoYXQgdGhlIGNvbmRpdGlvbnMgb2YgUkMyMTAxMiBvbiB0aGUg
U3BpZGVyIGFyZToNCj4gPiA+ID4gIC0gT1VUMTEgKGZvciBVRlMzMF9SRUZDTEtfVikgaXMgZGlz
YWJsZWQgYXMgZGVmYXVsdC4NCj4gPiA+ID4gIC0gT1VUMTEgaXMgY29udHJvbGxlZCBieSBHUElP
MCBwaW4uDQo+ID4gPiA+ICAtIFRoZSBHUElPMCBwaW4gaXMgaW52ZXJ0ZWQgc2Vuc2UgKGxvdyBh
Y3RpdmUpIGFuZCBwdWxsLXVwIGVuYWJsZWQuDQo+IA0KPiA+ID4gPiBUbyBvdXRwdXQgdGhlIGNs
b2NrLCBwaW4gNCBvZiBUQ0E5NTU0IG9uIHRoZSBTcGlkZXIgYm9hcmQgbmVlZHMgdG8NCj4gPiA+
ID4gb3V0cHV0IGxvdyBsZXZlbCBzbyB0aGF0IHVzaW5nICJncGlvLWdhdGUtY2xvY2siIGZvciBp
dC4NCj4gPiA+DQo+ID4gPiBEb2VzIHRoaXMgbWVhbiB0aGUgR1BJTyBzZXR1cCB3YXMgdGhlIG9u
bHkgbWlzc2luZyBwYXJ0LA0KPiA+ID4gYW5kIHRoZSBpMmMgY29tbWFuZHMgZnJvbSBbMV0gd2Vy
ZSBub3QgbmVlZGVkPw0KPiA+DQo+ID4gWW91J3JlIGNvcnJlY3QuDQo+ID4NCj4gPiA+IEkgd2Fu
dGVkIHRvIGdpdmUgdGhpcyBhIHRyeSwgYnV0IHRoZSByZW1vdGUgU3BpZGVyIGlzIG9mZmxpbmUu
DQo+IA0KPiBUaGUgcmVtb3RlIFNwaWRlciBhY2Nlc3MgaXNzdWUgd2FzIGZpeGVkLCBhbmQgdGhl
IHRocmVlDQo+IFVGUyBzdWJkZXZpY2VzIGFyZSBkZXRlY3RlZCBmaW5lLg0KPiBIZHBhcm0gc2F5
cyAyODAgTUIvcyAoY29tcGFyZWQgdG8gMTcwIGZvciBlTU1DKS4NCj4gDQo+IFRlc3RlZC1ieTog
R2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCg0KVGhhbmsgeW91
IGZvciB0aGUgdGVzdCENCkknbGwgc2VuZCB2MiBwYXRjaCBzb29uLg0KDQpCZXN0IHJlZ2FyZHMs
DQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAt
LSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5v
cmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxl
LCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3Vy
bmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0K
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
