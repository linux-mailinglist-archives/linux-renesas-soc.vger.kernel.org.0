Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 360DA67C253
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jan 2023 02:24:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbjAZBYk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Jan 2023 20:24:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjAZBYk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 20:24:40 -0500
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2102.outbound.protection.outlook.com [40.107.255.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DC1612B;
        Wed, 25 Jan 2023 17:24:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ecCtky/OFDoq3FwwrNNQ3GqmJokkpEZKWYYZ2V6qjnAbi1Mbo1UOZGsoccfSTYZfCR+dRY1i9q16K1gWP3hOsFVDaYgx3B707u1o7Oz7CjgM2ZaOLzWtIv1WT7D49M8pShhr2J9R9bNETPWtSZ8ythOFEjr1tN6oeJKF5bt+CdWMijQLEjuxqAf4GvmcJ++l5X4KPFeyhxYnpoGIDGC7XOsctlDEY5SoKbFNyfBCFAe6VL0pLiRl68fmURSThxfEtf/AS1HkIz89R+yWvYnC0AlgnU730DVBVTLVBdsG+sH1fwDt0GqAxQws9APuA78RCVhWv7o151ZLnQvrqIQASA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VmG8eCLm0dkaI7C308KPqqAIwtxlkSu4TbkqN0RNstQ=;
 b=nrahsgMN175/M49MndKPA6+nzT2bzE8Cu+Ku+uq83sqiFnqa7LsIgFI3xeUFAoi7cVnTtlpeagVtoNhlEWSf96puzvQZKVerJakRyyp/mGMnTr5RjoSvQMf9H8Ulv8t6oXESkBMxm59xooHsvCF/AiRBdz3QbcVRzCVPtbW+fwCZcvgiL83EdeNgrBXrwlUrAKTKSu6c5Gqv7Clq9CVSXSrHGPzf3ZB7YBcmzZw3CKQz/D79KeMjRVnaJ2XqYpHwL3SIkqxA3kc/rOh1zLnqpBNnQd9j1DGTVSSsh3QGZDwZnQChv+An2+bOO68/53fHaKkWf6b3t8AQp/zcJFTnyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VmG8eCLm0dkaI7C308KPqqAIwtxlkSu4TbkqN0RNstQ=;
 b=Uh5BMs2wTrTq6IruuAhyUL9vW+V5q/eVio9NawRHzZk2INlk38mDbWw2vdyI5jbJvW44iVq5/+oZiHAxcYI7CWxJ2v8elBX5JVjp38f2DMQexOuGLQk+XJkh8qNmRqluChd/ma3vhAZOW3xWmvhUIhdjWMRVxVpcl7JljrYQcDE=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYVPR01MB11128.jpnprd01.prod.outlook.com
 (2603:1096:400:364::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 01:24:35 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::3e61:3792:227e:5f18]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::3e61:3792:227e:5f18%7]) with mapi id 15.20.6043.021; Thu, 26 Jan 2023
 01:24:35 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Robin Murphy <robin.murphy@arm.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     "joro@8bytes.org" <joro@8bytes.org>,
        "will@kernel.org" <will@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: iommu: renesas,ipmmu-vmsa: Update
 descriptions for R-Car Gen4
Thread-Topic: [PATCH] dt-bindings: iommu: renesas,ipmmu-vmsa: Update
 descriptions for R-Car Gen4
Thread-Index: AQHZLsourgLTvtmvK0W71iwTdWHd8a6tpGsAgACkryCAAI6eAIAAHhGAgAD13pA=
Date:   Thu, 26 Jan 2023 01:24:34 +0000
Message-ID: <TYBPR01MB53413152631A581004C3535ED8CF9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20230123012940.1250879-1-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdX92KMeON0xC9p17kiqWT7ksEBX_NyPiiQk0fLaucDZBA@mail.gmail.com>
 <TYBPR01MB5341B023178B4A10DE52B844D8CE9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <CAMuHMdXXnu88Tn2ucuHZK=3G18v-nCfaTYpomchRXBu3bD7UuA@mail.gmail.com>
 <3c3e1dc2-1f66-565c-c677-2eae368e10be@arm.com>
In-Reply-To: <3c3e1dc2-1f66-565c-c677-2eae368e10be@arm.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYVPR01MB11128:EE_
x-ms-office365-filtering-correlation-id: 0d78bc0f-a9b5-4172-6405-08daff3c1580
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0bqBpa3u2ELfdFUul5KI5FWuxYlDdeLuOG5qaOt+n3KiuGW5S2fHHhdh+9bMpvMgYXS9TXj1hDO/Kvbj/Mi+AWloHQdIICGDBb9bezJ+M4YhTTSMBFIu1xneJWO5lrA1ViRpA/Hks+oedoMpx/uf85+4yMpHujA1/cG+qwj5PSeIclXoX1It+lvFvP55qy2j1R0pVSaw9COcoqTL6EDyOE1QtYHzWj8Fcc529B2CkAfgM/D8DVCIdryZPymJy6FdMiUWEg5gYmhCFVgTnPF6eIVk/dj+FtCG73YX0UrmVQzkDJMSN1Rj8RfIsUgQsYAzjVPwUf49O7Tm1I6loj8neN9JtO61uuqWzLI0spHP/AmnEhWdauJk8YDrUy5VtHrBJY0HSFGcPld4nhuGNBjxCNPk5B3rX4B0tAGwmyIbRzYZMjBIbOVirM/uIfPugojKoC89mgqEJQV3SevXJXfn7g9iDNyyiV025hdgigXtMR9dPeZEFjFi1JeEfcwA+DwwjxM4J89/4SClJVjFKckzVzvwO0rEmBb+pczuvBZK+734PwLldfLtbA6Vs4thEhztH1pnY5Le7SKYkP3QiWnBTbcLqpbS88dY3Scnwuoh94SSUjvRXgO57XF1V3m466XmECdouOsaVgvo3+01AeQxMKo37vEUhNMrx+8+LCrntKR0dXa222Hdi+VSrM2/kimEm6arIn9pwJJ6KflEvCT3xY6RB6Pudl2jPOyQ0kcHb+w=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(451199018)(86362001)(38070700005)(38100700002)(122000001)(33656002)(41300700001)(66946007)(52536014)(5660300002)(8936002)(4326008)(54906003)(66556008)(66476007)(66446008)(64756008)(8676002)(76116006)(316002)(55016003)(15650500001)(2906002)(110136005)(83380400001)(7696005)(478600001)(966005)(45080400002)(53546011)(6506007)(9686003)(186003)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OEhDY25LVUExd3BNaWMvRTZSanhSOGUvK2VKc2ZtektXejRUQjlZdHBNUkE4?=
 =?utf-8?B?N3J6bzlHWjhNSmp5TThpSExkZ2JmSnFaeVRiQlJKQVNXNHFJb2dWOWk1MHVp?=
 =?utf-8?B?TmtUQzZXeXFmTW0rRGpyZE1jelEwRXl3aUhjWUR2VlZhNHROa1pJVjBnVHEx?=
 =?utf-8?B?ZHIyU3RudDlGWHprQVdSRVF0dkdKZm1haG1ZMzd3QmtSbWEyWlBuaVhKNUdm?=
 =?utf-8?B?dThRQm5wRE15VHJOZkJWNFJ0V1c1MjNYRzdsQWpxeThJZjZvMGU4V1haQlp3?=
 =?utf-8?B?MEJkWlNMUFRVR294cWs1KzBCbDY1dnR2UE1US2ZEN2NZWWhrMjl0MC92ekha?=
 =?utf-8?B?MldVMzRzKzJsbkZDMXpIbVRyUDFEME9zSC8vdFZaOEdSUFplZ0pMREFRd2dX?=
 =?utf-8?B?VnFJLy9wQVRYZVB4TGxxbEVLSU9MMTBlalUvYXJCOFoyZVJFOTZHU1ZEKzBL?=
 =?utf-8?B?eVVKTUhqeVRDM2pjVU1jSllvRGFYU0pZUGpEQ2xrVzhHNkY1RjkrNWJRMXNz?=
 =?utf-8?B?R2tUdmEzcWdndk1DeTd0TGZWdk9hQ3BmMlVkRy9jNXZkSmZTdHYvVGxmRVAy?=
 =?utf-8?B?SHdpUWhLd0JhRy8vdWc2cXNIUUxrRDUxNmprR3dJWDhPZmRVelVrd1I3dVVl?=
 =?utf-8?B?K3NJRlJmR3dNeHpPQU92Q2doYVFHSmJPd0FZSytPL0RTTGZ3VEhzMTliT3Z2?=
 =?utf-8?B?YTdqUkNpN2ZzbkE4MVRHWXBlS1gyR0RKQk5nSVVQU1l5WTV4SGpveU9jWFdK?=
 =?utf-8?B?TVY1eGxXa09heFVoZnFVV3FZN083ME5xalFiOGNMSXI2c0hLUVIwV2JSbWZ1?=
 =?utf-8?B?RGFhdGFjb25zcmFrVVJzM2ljSExmaXp3Y1NiTGRVLzNRbkNCekVlTWJnU2hs?=
 =?utf-8?B?YktHR1NZYW1vUjBrVWIwWGlVWDJlOG5EQUVzdlV4MlNYYzNMMnl2WDZ0WW9j?=
 =?utf-8?B?U2tqZ1p5YWdDRERUN2hpQndIejdxTTJCSENDTmcyUENJVGZQSzJwYml3K3dZ?=
 =?utf-8?B?RkdJdnZIKzlYQ3UreXRFbVhhVW9Xd3ZrYnYrWVpTNGg5SXM4dExiU0h0L0Vt?=
 =?utf-8?B?a2VzV09wTXNQVFd0bTVmUWVvbHdZQ3BNbXcxT1NVVndJbUhIVnpNTm5zM05Z?=
 =?utf-8?B?OFlwMUdPd2thL1VUVXRsNHVpNk5TZkJpSUFvaDFRcEp2SzkwdFJhdzJqSW16?=
 =?utf-8?B?V1NMcWtYZktRSlVoRkw5bTRBdElsWU85UDYwVGVEQ1ZkNlRtNFpTUzhLY21M?=
 =?utf-8?B?V0NFY2hRWWpjUlZEMGJjZllOU0VwL1FhN0Zla0d4L0hiWDV0cU1VVXlHNitX?=
 =?utf-8?B?SVNtS3ZHRU5lVGhvajh0UVBjc1M0K0pmWTFqM0RmSWZEM09SL3dLSGRDQUNn?=
 =?utf-8?B?anE2S1hxT2RrdDU2b1ZZLzBHRHhoRWhSM3RWYVNFa1EzNkpLMzZmUFUyaXk5?=
 =?utf-8?B?aTlnclhBMlA1RVFrMExqbitIL1k3NnNtZW1sVmh4ZlpHcHBJUVRkUmRFbnBU?=
 =?utf-8?B?VnJLS3FTZ2dnOXpNb1g2L1EzSUZJVWZxZXppbW5qQTNMa2NNSW5QYjRQTW5s?=
 =?utf-8?B?Ym5SYXZJUXdRMGpCdDQ2dUpiNytTRVBMdDRrNXhxRjhUY0VqVm40ZDI3OWdy?=
 =?utf-8?B?YnZMR1JjTnNpd3dRRWo5WnVGV1N3SVRzNW5na0tlZ1dQSU1SL3NUS0N4eWN6?=
 =?utf-8?B?RUJzQVNVM29HLzFmYktqZHh5dTZVcjZ3V3MrTWsyRlp1c3h4OURndlVET1ha?=
 =?utf-8?B?dnYyWEJpTlFIeUs4eUtVbk1MOEwrVzBkRkp3cjE5OUJEOVhSYmhhZGtEOXJB?=
 =?utf-8?B?bWFmUkRKSXl3enlnTnZsYmZPRDVJK2MzYklJTTl1bFR0T2RxVWVkaHB2ZytL?=
 =?utf-8?B?WVJ1Ujc3RFVnRFpFT3llSWhHSVJnVDJmczlGK0crZzlicm5aUnR3RWtqK0FW?=
 =?utf-8?B?Ykp2NklFOVlpTkZyVC93dkhERVVQNjNzVzcvNEdLOS9uQUUyMHFsdTBGMGE1?=
 =?utf-8?B?SStIRGVqM0F1Z21pYmlsVnBocVhhSEd4Q21GN1RXdUdpeSs0eEx0dWxUUi9p?=
 =?utf-8?B?eUtiUHh5VngwNWFEWHZTdXZnaWN2dzZwb0tHQVdVWlVvNWpiMlN5cjF0bVVl?=
 =?utf-8?B?MmVFbUZjSkJiQytzUWtvUDBDOTh1ZHRoZUpDYVlKWi9zdGpjM3UxZllicnB2?=
 =?utf-8?B?MS9WMHd5eDh6OVE4ZXRON0RJZEdyUzliWkYvZzhWWGdYTHVYbGtkOEk4WExm?=
 =?utf-8?B?cHlidUt0WXFlK0lWOENETW1kQ3NBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d78bc0f-a9b5-4172-6405-08daff3c1580
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2023 01:24:34.9265
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m8bS7+ozN0enbMx8gC7DOLt6uAUH+hYaNPIuZTrjfDXY/iAMj+wMkoXryCQ1BPT5tQX35CRcI2xksuimszcNHoXsVhup+GGE4PrFPSaReZELnAR7fye9QMYifBFeDktO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11128
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgUm9iaW4sDQoNCj4gRnJvbTogUm9iaW4gTXVycGh5LCBTZW50OiBXZWRuZXNkYXksIEphbnVh
cnkgMjUsIDIwMjMgNzo0MiBQTQ0KPiANCj4gT24gMjAyMy0wMS0yNSAwODo1NCwgR2VlcnQgVXl0
dGVyaG9ldmVuIHdyb3RlOg0KPiA+IEhpIFNoaW1vZGEtc2FuLA0KPiA+DQo+ID4gT24gV2VkLCBK
YW4gMjUsIDIwMjMgYXQgMTo0OSBBTSBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA+IDx5b3NoaWhpcm8u
c2hpbW9kYS51aEByZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4+PiBGcm9tOiBHZWVydCBVeXR0ZXJo
b2V2ZW4sIFNlbnQ6IFR1ZXNkYXksIEphbnVhcnkgMjQsIDIwMjMgMTE6MzUgUE0NCj4gPj4+IE9u
IE1vbiwgSmFuIDIzLCAyMDIzIGF0IDI6MzUgQU0gWW9zaGloaXJvIFNoaW1vZGENCj4gPj4+IDx5
b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4+Pj4gU2luY2UgUi1D
YXIgR2VuNCBkb2Vucyd0IGhhdmUgdGhlIG1haW4gSVBNTVUgSU1TU1RSIHJlZ2lzdGVyLCBidXQN
Cj4gPj4+PiBlYWNoIGNhY2hlIElQTU1VIGhhcyBvd24gbW9kdWxlIGlkLiBTbywgdXBkYXRlIGRl
c2NyaXB0aW9ucyBvZg0KPiA+Pj4+IHJlbmVzYXMsaXBtbXUtbWFpbiBwcm9wZXJ0eSBmb3IgUi1D
YXIgR2VuNC4NCj4gPj4+Pg0KPiA+Pj4+IFNpZ25lZC1vZmYtYnk6IFlvc2hpaGlybyBTaGltb2Rh
IDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4NCj4gPg0KPiA+Pj4+IC0tLQ0KPiA+
Pj4+ICAgVGhlIG9sZCBSLUNhciBTNC04IGRhdGFzaGVldCBoYWQgZGVzY3JpYmVkIElQTU1VIElN
U1NUUiByZWdpc3RlciwgYnV0DQo+ID4+Pj4gICB0aGUgbGF0ZXN0IGRhdGFzaGVldCB1bmRvY3Vt
ZW50ZWQgdGhlIHJlZ2lzdGVyLiBTbywgdXBkYXRlIHRoZSBwcm9wZXRpZXMNCj4gPj4+PiAgIGRl
c2NyaXB0aW9uLiBOb3RlIHRoYXQgdGhlIHNlY29uZCBhcmd1bWVudCBpcyBub3QgdXNlZCBvbiB0
aGUgZHJpdmVyLg0KPiA+Pj4NCj4gPj4+IERUIGRlc2NyaWJlcyBoYXJkd2FyZSwgbm90IHNvZnR3
YXJlIHBvbGljeS4NCj4gPj4NCj4gPj4gSSB0aGluayBzby4NCj4gPj4NCj4gPj4+PiAgIFNvIG5v
IGJlaGF2aW9yIGNoYW5nZS4NCj4gPj4+DQo+ID4+PiBTbyB3aGVyZSBkbyB3ZSBnZXQgdGhlIG1v
ZHVsZSBpZCBudW1iZXJzIHRvIHVzZSwgaWYgdGhleSBhcmUgbm8gbG9uZ2VyDQo+ID4+PiBkb2N1
bWVudGVkIGluIHRoZSBIYXJkd2FyZSBNYW51YWw/DQo+ID4+DQo+ID4+IElmIHNvLCB3ZSBjYW5u
b3QgZ2V0IHRoZSBtb2R1bGUgaWQgbnVtYmVycy4gU28sIHNob3VsZCB3ZSB1c2Ugb3RoZXINCj4g
Pj4gaW5mb3JtYXRpb24gd2hpY2ggaXMgY29tcGxldGVseSBmaXhlZCBpbnN0ZWFkPyBJIGhhdmUg
c29tZSBpZGVhczoNCj4gPj4gMSkgSnVzdCAwIChvciBvdGhlciBmaXhlZCB2YWx1ZSkgaWYgdGhl
IElNU1NUUiByZWdpc3RlciBkb2Vzbid0IGV4aXN0Lg0KPiA+PiAyKSBTZXF1ZW50aWFsIG51bWJl
cnMgZnJvbSByZWdpc3RlciBiYXNlIG9mZnNldC4NCj4gPj4gICAgIEluIFItQ2FyIFM0OiBpcG1t
dV9ydDAgaXMgdGhlIGZpcnN0IG5vZGUgZnJvbSByZWdpc3RlciBiYXNlIG9mZnNldCwNCj4gPj4g
ICAgIGFuZCBpcG1tdV9ydDEgaXMgdGhlIHNlY29uZCBvbmUuDQo+ID4+ICAgICBTbywgaXBtbXVf
cnQwIGlzIDAsIGlwbW11X3J0MSBpcyAxLCBpcG1tdV9kczAgaXMgMiBhbmQgaXBtbXVfaGMgaXMg
My4NCj4gPj4gMykgVXNpbmcgYmFzZSBhZGRyZXNzIHVwcGVyIDE2LWJpdHMuDQo+ID4+ICAgICBJ
biBSLUNhciBTNDogaXBtbXVfcnQwIGlzIDB4ZWU0ODAwMDAuIFNvLCB0aGUgdmFsdWUgaXMgMHhl
ZTQ4Lg0KPiA+Pg0KPiA+PiBQZXJoYXBzLCB0aGUgb3B0aW9uIDEpIGlzIHJlYXNvbmFibGUsIEkg
dGhpbmsuIEJ1dCwgd2hhdCBkbyB5b3UgdGhpbms/DQo+ID4NCj4gPiBJIHdvdWxkIG5vdCBtYWtl
IHVwIG51bWJlcnMsIGFzIHRoYXQgd291bGQgY2F1c2UgY29uZnVzaW9uIHdpdGggU29Dcw0KPiA+
IHdoZXJlIHRoZSBudW1iZXJzIGRvIG1hdGNoIHRoZSBoYXJkd2FyZS4NCj4gPiBBcyB0aGUgZHJp
dmVyIGRvZXNuJ3QgdXNlIHRoZSBtb2R1bGUgaWQgbnVtYmVyIChpdCBhbHJlYWR5IGxvb3BzDQo+
ID4gb3ZlciBhbGwgZG9tYWlucywgaW5zdGVhZCBvZiBjaGVja2luZyBJTVNTVFIsIHByb2JhYmx5
IGJlY2F1c2Ugb2YNCj4gPiBoaXN0b3JpY2FsIChSLUNhciBHZW4yKSByZWFzb25zPyksIHdoYXQg
YWJvdXQgZHJvcHBpbmcgaXQgZnJvbSB0aGUNCj4gPiBwcm9wZXJ0eT8gSS5lLiBhZGQgIm1pbkl0
ZW1zOiAxIiwgcG9zc2libHkgb25seSB3aGVuIGNvbXBhdGlibGUgd2l0aA0KPiA+IHJlbmVzYXMs
cmNhci1nZW40LWlwbW11LXZtc2E/DQo+IA0KPiBSaWdodCwgaWYgdGhlcmUgcmVhbGx5IGlzIG5v
IG1lYW5pbmdmdWwgSUQgZm9yIHRoaXMgbW9kZWwgdGhlbiBpdHMNCj4gYmluZGluZyBzaG91bGQg
bm90IHJlcXVpcmUgb25lLg0KDQpUaGFuayB5b3UgZm9yIHlvdXIgY29tbWVudC4gSSBnb3QgaXQu
DQoNCj4gPiBCVFcsIHRoZSByZWxhdGVkIElNQ1RSIHJlZ2lzdGVyIGlzIHN0aWxsIGRvY3VtZW50
ZWQsIGFuZCB0aGUgZHJpdmVyDQo+ID4gZG9lcyBlbmFibGUgdGhlIGludGVycnVwdCBiaXQgKElN
Q1RSX0lOVEVOKSwgc28gSSdtIHdvbmRlcmluZyBob3cgdGhlDQo+ID4gaGFyZHdhcmUgKGRvY3Vt
ZW50YXRpb24pIHBlb3BsZSBpbnRlbmQgdGhpcyB0byBiZSB1c2VkLi4uDQo+ID4gUGVyaGFwcyBJ
TUNUUl9JTlRFTiB3aWxsIGJlIHJlbW92ZWQvdW5kb2N1bWVudGVkLCB0b28/DQo+ID4gT3IgcGVy
aGFwcyB0aGUgcmVtb3ZhbC91bmRvY3VtZW50YXRpb24gb2YgSU1TU1RSIHdhcyBhIG1pc3Rha2U/
DQo+IA0KPiBJIGd1ZXNzIGl0IHNob3VsZCBiZSBwcmV0dHkgc3RyYWlnaHRmb3J3YXJkIHRvIGp1
c3QgdHJ5IHJlYWRpbmcgdGhlDQo+IGV4cGVjdGVkIElNU1NUUiByZWdpc3RlciBsb2NhdGlvbnMg
b24gdGhpcyBTb0MgdG8gZG91YmxlLWNoZWNrIHdoZXRoZXINCj4gYW55dGhpbmcgaXMgdGhlcmUu
DQoNCkFzIEkgbWVudGlvbmVkIG9uIG90aGVyIGVtYWlsIFsxXSwgd2Ugc2hvdWxkIG5vdCBhY2Nl
c3MgSU1TU1RSIHRvIGF2b2lkDQphIHBvdGVudGlhbCBpc3N1ZS4uLg0KDQpbMV0NCmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC9UWUJQUjAxTUI1MzQxRjhEQzM2RUFENjU5MjA5QTJCREREOENG
OUBUWUJQUjAxTUI1MzQxLmpwbnByZDAxLnByb2Qub3V0bG9vay5jb20vDQoNCkJlc3QgcmVnYXJk
cywNCllvc2hpaGlybyBTaGltb2RhDQoNCj4gVGhhbmtzLA0KPiBSb2Jpbi4NCg==
