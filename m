Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57BFC7C82AD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Oct 2023 12:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230235AbjJMKCR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Oct 2023 06:02:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230179AbjJMKCQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Oct 2023 06:02:16 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2113.outbound.protection.outlook.com [40.107.113.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDD00A9;
        Fri, 13 Oct 2023 03:02:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=myDFsQnVSVgms3+7nW7YcCO1V7jLtsLqrr1sOFUojdAuEBoePwhe9S+ZZwxODQAscW7vdfZ4DJNbvzD5SKUy4xyQR37QWidcraabcPwJUt4pHwfzzzl52S7A078iQac5wnKbiAhx84EGhAKE9LLNOwOrfzsZTv913AuIOk4TpVYOfcmh3EseLBXmYyV74cBicRE9xEAJeRM6HPPAUzkMxGN2Q70pzJJiIm7NmWhmSeGgFGRFumlV2Alk5MQtCPd3+m8YFYfdELyhDkSYNTi24UZpca6A/bCLdWf1MHvAqT+xQxCpDCtKGkS/r+azOs34VbbpS1S52lb4uZaU1kKY2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xx75h2YA+T1OolDAd3RH4KsQU4v//2BRyZAq8+6cbkM=;
 b=n4BkbhNBv/LY6SIDOWyhmqMZwnYDZP6CdKNGTbjVCKYFY2i8FjksKAI0WmoA6eMatR0QZWDgNfS0G6PMOWPewS3Vsn32dPbGVgR8PnaM3QQqzOMCU3aCmFs3hq1xgG49tlolGbtE4Wers4ZKArpNUoDStOkzQkeBMNAupl/6Jy5ejhPOuB2HmkDmcjLIMQyfQpEhTCf9O/pd6YiD5ViK9GcHbCTsxX/1UObyQ7tBQhuP1R5XRAg2zVkhX7G9UKZbFmD748eq8oI1ROczo10f5Pppetc/WtPC96x5RQlb0+Esqb79OkDQrA16DeufkmrCaAZSiszXezX7ny7qc4stqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xx75h2YA+T1OolDAd3RH4KsQU4v//2BRyZAq8+6cbkM=;
 b=e4jKPHU/OQ7azGYckN2JYccgcn+XxOVOzDAFZBreYFxxqm0+025SDWqtwvdiSVP2vzLY/y5M6jdur6WgUS3pCcevY7nUu3siSbLg2J99MV8vN7XNuEn2o35vync0T9wsK4Zcbqjdxhlpczy1hK1dFi/OfTUO8od67qGSwQUaLno=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYCPR01MB6078.jpnprd01.prod.outlook.com
 (2603:1096:400:4d::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.46; Fri, 13 Oct
 2023 10:02:11 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::1dc4:e923:9916:c0f7]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::1dc4:e923:9916:c0f7%7]) with mapi id 15.20.6863.046; Fri, 13 Oct 2023
 10:02:11 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     "s.shtylyov@omp.ru" <s.shtylyov@omp.ru>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "edumazet@google.com" <edumazet@google.com>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net-next] rswitch: Add PM ops
Thread-Topic: [PATCH net-next] rswitch: Add PM ops
Thread-Index: AQHZ/QXyGwTSvnuvKE+t4wejKpfSH7BGFwMAgADbmiCAAGERAIAAFX3ggAAJdICAAAo0sA==
Date:   Fri, 13 Oct 2023 10:02:11 +0000
Message-ID: <TYBPR01MB53411F936A70688D34CD459CD8D2A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20231012121618.267315-1-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdWAk9kJBGGq9K-RnC0HFZk1XbaosTBO2OW1kpYFPh1Mqg@mail.gmail.com>
 <TYBPR01MB5341F5AAE321E3E373012E4DD8D2A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <CAMuHMdU9Udd7xX7Us+3T06YMLAb4y0xnSOipN-5c-d-MfpvKdg@mail.gmail.com>
 <TYBPR01MB5341D9408B9C4EA701E5E5D1D8D2A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <CAMuHMdUNrdr8YTQBxzX=7=W+SBtK-uH6CjjUgR9VRj3CpKFh1g@mail.gmail.com>
In-Reply-To: <CAMuHMdUNrdr8YTQBxzX=7=W+SBtK-uH6CjjUgR9VRj3CpKFh1g@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYCPR01MB6078:EE_
x-ms-office365-filtering-correlation-id: 7dbf5fd2-b7a1-444d-0c6c-08dbcbd377da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MjiHgfHtiGZ81XKs3wQnmgKyhwZwe8wVc1VuewvyVr79xc8ADN317+Yj6UGcDBIss2TiP7mNg3EkYbI5CgPFLMQ5cuHTuZKRbC7UJta9n9x2fISQ5Ou93VD2cPdyWQEaLNkDezhIPDnAMBZNSLJ/tAKI8YNLmAFhWBbhaNyi1UpRgpj4qWMUuCBq4Cphkw2Lr8VrV5Bd6AKtUW3m2Xz/7NUuZcUxwdvpK4JPMxL+wp0jlgM+mTJ2ajzyN5N2w80RWbZcJ6QqpuyHRjEgGDCxpXY2+4vpuQrKUEjC9ek9+ZG2bXe+5VSBz20gUMksBHTtEN6dmaxAV7bc7O6vIVj/1hX7BI90L9Y8aAKYfuH4/GmpLlm5WkTLWKo1UQ25Hs/S23Yap2Zo7+RdvwyTqfHK6dp2vRkVN3sfukDmFowiPgeviSpDJ1xKyV3IlbYr5afq6n6TEphxOxF4aNqYwvl/HW50EPZY9hKDnM2Hv8JE53OYMyF+OH6Tvq3PJuJhsS+45q4k21QbyAzfVCh4+AKByGu6MmRqnwjRXr/y4RCljNHTj01gafhK3cj65+nF9nu54y0+jBI3QjObDG0QGQMBvnvPzaYE9KfLU20Pb7A9GXMwCQughEvto7AnvkYeVpJD
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(376002)(39860400002)(346002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(55016003)(122000001)(33656002)(38070700005)(38100700002)(83380400001)(9686003)(6506007)(7696005)(53546011)(76116006)(66946007)(66556008)(66476007)(66446008)(6916009)(316002)(54906003)(64756008)(478600001)(41300700001)(2906002)(71200400001)(86362001)(52536014)(5660300002)(8936002)(8676002)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OXBRWlAzMForTVUzRUlMQ2VtMU5rbUZ2dHFZUWJXNitTQkRJM2J6RVNkSUtG?=
 =?utf-8?B?U2E2TDRiRG5INFA2M0FPdHk1ek1YZUc3RURPNW9jdmV3dFg5UHI2UFRhc3pO?=
 =?utf-8?B?dkRmUnRYZjZFMlA1M0l1QzlOTnhTNVA0RGRlUFZIUExVb0c3SHlYR2svMjhJ?=
 =?utf-8?B?eFczNHk5M3FsTzdrWi8zckpDM3ovVkVTMUl4Z3NVakp1bnVDVndFU1pDQUxU?=
 =?utf-8?B?T0xVMzR6TEM2cjZXQ2FteThTdURBaXFWc1pjTzNFb2s5dElJMW1VYkRIU2JY?=
 =?utf-8?B?UlBhc1ZEUnpQYlBIYXYrMjlHdUFnbkc1TGozcG5KRVZqM090bDVpNWRSZUdv?=
 =?utf-8?B?N08wdkxpL1VFSlVnZFNLaWdyNWxSTWhZUnRZdjBja2JjcXo4bVpOS0VrRjJU?=
 =?utf-8?B?dlhHQUxaekRndjBBUGE1bm9uVnBpZzZ3aHMxWjMzY0syQm1WMXIxQ3U1UE56?=
 =?utf-8?B?VjVFWk8xVWY0R3NxKzJ4K0NjQzJSNGNFWFJwUG9HWUdxNERFWWo3c0NnVG8w?=
 =?utf-8?B?L0VLRG9nVitHSEw0eFJUckZ6TndtalFBKys1UkZrQXJJM21qbGtTR2FTc3FM?=
 =?utf-8?B?Wnc2Uld4OURIK3llTjUvLzYxUGtlenB4Vk5MbjZ6K2FoMFplSEVlOHhrbkw4?=
 =?utf-8?B?a0hqbHVUdVRjV01uK0dWcTR1c2hYVjJkY3dtS1VjcFJHdjNEMUhyTDNDQ1VN?=
 =?utf-8?B?SGRpSHhsVjVwalVyQVpoWnk3a3AwSEhFeTN0c3pQQ0J0TE5kLzRUL1RlU3BR?=
 =?utf-8?B?ZXZoWDJFN2hLQXdEbjNxUEJod0loWVB6eWZ4bnBJZVR4SnZPWnZBQ1NVbjYz?=
 =?utf-8?B?eldFVU1OY0hBTGpCU1NBOTZFVTVjNmJub0IveEJhZ2ozcEdMVVI3Q3JrRHNO?=
 =?utf-8?B?Y1BRcXkzY0lQMUs3R3VUZ0N2cE9YUzJoWjliYXhjeFQwd2x0aGU2YS9kS1Ny?=
 =?utf-8?B?T0kxLzNSSmRFbTh0aFRJNDBFSHNGNjIweVB6OTNlZXNEeXd0RHVRQUVMamRC?=
 =?utf-8?B?RmlzNnFzNjVFZ3cxMWxpK28zM3cyeDhMSWlrRmY5R2xUZ0tNVitBVDl1S0tr?=
 =?utf-8?B?MG9vdlJKOGZOR2l4K200MkR0QisxTmcyTGIrdnVaRzRkc2ZGZkUrVnc5bCsv?=
 =?utf-8?B?RmtaU250SmxTQi9rcm9sdUlFS1laYlN6dVZ5cjJkTTV6a0xHUWd6U2Mwc3pm?=
 =?utf-8?B?SjFlZDJ2MTYrdEZHdUxxZ1RpTlhqMHowVDRmanpxRTNVa0RIazF0OVpUaFVT?=
 =?utf-8?B?MkVxenVMR2Y3VkRPTmpDWXZXVGJLM29kS250MTFwejd6RFo4dVM2bkx2enp2?=
 =?utf-8?B?Q1N4ZlZxeVdSUUNydVpEVGo4OVlHcndxWVlvVmlSSmJWRjBsMjFBWEJHRzUr?=
 =?utf-8?B?WVZxd3VZUlBJM3ZjWmxHUXdiZ05NdXBYRnloOFdTTnBDSW5jczVmNjc3aXNG?=
 =?utf-8?B?RnhZK0QxWUN3U3h0a2o4SVowbjJnUUlSb3ZGUXUwZi9GeFExM211SmVIYlMy?=
 =?utf-8?B?MTRqN0RKSCtnSGtaTnFxRVdReHZhZVVSaTFnalRDNElZVlhEbHBxZFZZRWFm?=
 =?utf-8?B?bVZUUmw0U1pzOC8xU21na1ROd1N1TEpaU3ZkQ010RDFYLzBmYVJFSjhFbGpN?=
 =?utf-8?B?bWFYUUlPTG5MMFlabW9Mek4vM1g3WlZEcWxRUVcrNXlZRmZ6SVJZZmhOazI2?=
 =?utf-8?B?YUw4anRQNFVvbW95ZkYvVkRMN0d1RjJUUHlEWTFxWXBmcjdkaUo0Y0NWc0ZH?=
 =?utf-8?B?QmFoL3NVbjlhYWsvcHVncEdCUTBZaXhDNUtCbEg4S1dCejNtbVBwY1VQZ25I?=
 =?utf-8?B?eTdldzlmV2JpR290Q1gyamxuKzlwaGpXNEpkWXk1Wlg1ZTMyckFMcVNEYlZq?=
 =?utf-8?B?NU5NVjJBSEtsRFdCNVErVTRlSzZGM1dSdDZhNjh3YlZZZFRmV2V0ZjVibWp0?=
 =?utf-8?B?U0FzN284bkl2UnA0VkwwajlKb2tLYVUvVnJHZWdCSGZmNVN4VjVrelE0c3RI?=
 =?utf-8?B?UWpPY1BDU09qODhtTlQ5LzBFV1UxVlM4N3diaVArcXZ6a3ZUVlhKUTRBRzNW?=
 =?utf-8?B?S0l6dDZYZzhVR0NoVlBpM3NsVDM5ZXU5VEJhcjQwN0tMejlTdFpaVXAvTHlS?=
 =?utf-8?B?RXh2ZFhoUGxpaENtbXN6eGFza1JoUHRvTFNncUpoWWVFTUZkZm1vUUpCQ3Az?=
 =?utf-8?B?eXNNeGxHenE1NGQ2SUZvazBFbmQ5S095YlNKcDJCcGdmcWx3RTA1Sm5GWjVS?=
 =?utf-8?B?UjBuWkV4TEZCUkpwTzIwczJGRVlRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dbf5fd2-b7a1-444d-0c6c-08dbcbd377da
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2023 10:02:11.2257
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PViXW4SkaOWmLfvdvF/BchRYAqmbNEg8nWP7PwVPHWrVfV7kNMX4pqw3y8bhiOEJ6DIeBAnFkDr3PQCH9k0rmK3BCDLYHgrckxIvZe21M2aOD7NAO40E0Or1rC53vWfy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6078
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogRnJpZGF5
LCBPY3RvYmVyIDEzLCAyMDIzIDY6MTkgUE0NCj4gDQo+IEhpIFNoaW1vZGEtc2FuLA0KPiANCj4g
T24gRnJpLCBPY3QgMTMsIDIwMjMgYXQgMTA6NTXigK9BTSBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA8
eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gRnJvbTogR2Vl
cnQgVXl0dGVyaG9ldmVuLCBTZW50OiBGcmlkYXksIE9jdG9iZXIgMTMsIDIwMjMgNDoyOSBQTQ0K
PiA+ID4gT24gRnJpLCBPY3QgMTMsIDIwMjMgYXQgNDoxMOKAr0FNIFlvc2hpaGlybyBTaGltb2Rh
DQo+ID4gPiA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4g
PiA+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVGh1cnNkYXksIE9jdG9iZXIgMTIs
IDIwMjMgOTozNSBQTQ0KPiA+ID4gPiA+IE9uIFRodSwgT2N0IDEyLCAyMDIzIGF0IDI6MTbigK9Q
TSBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA+ID4gPiA+IDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5l
c2FzLmNvbT4gd3JvdGU6DQo+ID4gPiA+ID4gPiBBZGQgUE0gb3BzIGZvciBTdXNwZW5kIHRvIElk
bGUuIFdoZW4gdGhlIHN5c3RlbSBzdXNwZW5kZWQsDQo+ID4gPiA+ID4gPiB0aGUgRXRoZXJuZXQg
U2VyZGVzJ3MgY2xvY2sgd2lsbCBiZSBzdG9wcGVkLiBTbywgdGhpcyBkcml2ZXIgbmVlZHMNCj4g
PiA+ID4gPiA+IHRvIHJlLWluaXRpYWxpemUgdGhlIEV0aGVybmV0IFNlcmRlcyBieSBwaHlfaW5p
dCgpIGluDQo+ID4gPiA+ID4gPiByZW5lc2FzX2V0aF9zd19yZXN1bWUoKS4gT3RoZXJ3aXNlLCB0
aW1lb3V0IGhhcHBlbmVkIGluIHBoeV9wb3dlcl9vbigpLg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8uc2hpbW9kYS51
aEByZW5lc2FzLmNvbT4NCj4gDQo+ID4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5l
dC9yZW5lc2FzL3Jzd2l0Y2guYw0KPiA+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJu
ZXQvcmVuZXNhcy9yc3dpdGNoLmMNCj4gPiA+ID4gPiA+IEBAIC0xOTkxLDExICsxOTkzLDUyIEBA
IHN0YXRpYyB2b2lkIHJlbmVzYXNfZXRoX3N3X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQ0KPiA+ID4gPiA+ID4gICAgICAgICBwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBO
VUxMKTsNCj4gPiA+ID4gPiA+ICB9DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gK3N0YXRpYyBp
bnQgX19tYXliZV91bnVzZWQgcmVuZXNhc19ldGhfc3dfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpk
ZXYpDQo+ID4gPiA+ID4gPiArew0KPiA+ID4gPiA+ID4gKyAgICAgICBzdHJ1Y3QgcnN3aXRjaF9w
cml2YXRlICpwcml2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+ID4gPiA+ID4gPiArICAgICAg
IHN0cnVjdCBuZXRfZGV2aWNlICpuZGV2Ow0KPiA+ID4gPiA+ID4gKyAgICAgICBpbnQgaTsNCj4g
PiA+ID4gPg0KPiA+ID4gPiA+IHVuc2lnbmVkIGludCAoYWxzbyBiZWxvdykNCj4gPiA+ID4NCj4g
PiA+ID4gSSBkb24ndCBrbm93IHdoeSB1bnNpZ25lZCBpbnQgaXMgbmVlZGVkLiBPdGhlciBmdW5j
dGlvbnMgdXNlDQo+ID4gPg0KPiA+ID4gVGhlcmUncyB0aGlzIG9sZCBtYW50cmEgInByZWZlciB1
bnNpZ25lZCBvdmVyIHNpZ25lZCBpbiBDIiwNCj4gPiA+IGFuZCBhIHZhbGlkIHBvcnQgYXJyYXkg
aW5kZXggaGVyZSBpcyBhbHdheXMgdW5zaWduZWQuDQo+ID4NCj4gPiBJIHVuZGVyc3Rvb2QgaXQu
DQo+ID4NCj4gPiA+ID4gcnN3aXRjaF9mb3JfZWFjaF9lbmFibGVkX3BvcnR7X2NvbnRpbnVlX3Jl
dmVyc2V9KCkgd2l0aCBpbnQuDQo+ID4gPiA+IEVzcGVjaWFsbHksIHJzd2l0Y2hfZm9yX2VhY2hf
ZW5hYmxlZF9wb3J0X2NvbnRpbnVlX3JldmVyc2UoKQ0KPiA+ID4gPiBoYXMgdGhlIGZvbGxvd2lu
ZyBjb2RlLCB1bnNpZ25lZCBpbnQgd2lsbCBub3Qgd29yayBjb3JyZWN0bHk6DQo+ID4gPg0KPiA+
ID4gT2gsIHRoZXJlIGlzIGFsc28gYSByZXZlcnNlIHZhcmlhbnQsIHdoaWNoIGluZGVlZCBuZWVk
cyBhIHNpZ25lZA0KPiA+ID4gaXRlcmF0b3IsIGN1cnJlbnRseS4uLg0KPiA+ID4NCj4gPiA+ID4g
LS0tDQo+ID4gPiA+ICNkZWZpbmUgcnN3aXRjaF9mb3JfZWFjaF9lbmFibGVkX3BvcnRfY29udGlu
dWVfcmV2ZXJzZShwcml2LCBpKSBcDQo+ID4gPiA+ICAgICAgICAgZm9yIChpLS07IGkgPj0gMDsg
aS0tKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+ID4gPg0KPiA+ID4gSSB0
aGluayB0aGlzIGNhbiBiZSBtYWRlIHRvIHdvcmsgd2l0aCBhbiB1bnNpZ25lZCBpdGVyYXRvciB1
c2luZw0KPiA+ID4NCj4gPiA+ICAgICBmb3IgKDsgaS0tID4gMDsgKQ0KPiA+DQo+ID4gSSB0aGlu
ayB0aGF0IHRoaXMgbG9vcCBjYW5ub3QgYWNjZXNzIGluZGV4IDAgOikNCj4gDQo+IHJzd2l0Y2hf
Zm9yX2VhY2hfZW5hYmxlZF9wb3J0X2NvbnRpbnVlX3JldmVyc2UoKSBpcyBtZWFudCB0byBiZQ0K
PiB1c2VkIGluIHRoZSBlcnJvciBwYXRoLCB0byB0ZWFyIGRvd24gYWxsIHBvcnRzIHRoYXQgd2Vy
ZSBpbml0aWFsaXplZA0KPiBzdWNjZXNmdWxseT8gU28gaSBpcyBhbHdheXMgdGhlIGluZGV4IG9m
IHRoZSBmaXJzdCBwb3J0IHRoYXQgZmFpbGVkIHRvDQo+IGluaXRpYWxpemUsIGkuZS4gaSA+IDAg
b24gZW50cnkuDQo+IA0KPiBTZWUgImdpdCBncmVwIC1XdyByc3dpdGNoX2Zvcl9lYWNoX2VuYWJs
ZWRfcG9ydF9jb250aW51ZV9yZXZlcnNlIi4NCg0KVGhhbmsgeW91IGZvciB5b3VyIGNvbW1lbnQu
IEFuZCBJJ20gc29ycnksIEkgY29tcGxldGVseSBtaXN1bmRlcnN0b29kDQphYm91dCAiZm9yICg7
IGktLSA+IDA7ICkiIGJlaGF2aW9yLi4uIEkgc2hvdWxkIGhhdmUgdGVzdGVkIHRoaXMgYmVmb3Jl
DQpJIHNlbmQgc3VjaCBhIGNvbW1lbnQuLi4NCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNo
aW1vZGENCg0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3Rz
IG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+IA0KPiBJbiBw
ZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2Vs
ZiBhIGhhY2tlci4gQnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0
IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
