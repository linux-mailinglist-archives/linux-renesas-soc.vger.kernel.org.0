Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25D6753B22C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jun 2022 05:42:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233559AbiFBDXI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Jun 2022 23:23:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233483AbiFBDXH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Jun 2022 23:23:07 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2106.outbound.protection.outlook.com [40.107.114.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C3BC1ACE75;
        Wed,  1 Jun 2022 20:23:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gfy6lrQFU2NvrNTznG5jNl8hIuqboMTO/mivpZ25YKxkwdFiBc1kxOlU9fjz6gyX/iRkalEObZngugUva3JWtt5dr84Asr1abd07DBF3XI4z/1eDJNKOY2SDGCyQIZiNXTL4HRqLa+mFYfa9Lom2PcgMvOF7eqSC09C7mupeUnkFgfFa8+xBAkhWjmFymRsCmMCR8Qq3T2Ep3HsRwyY98QmMzpHX9nsb7rMvGGH4vQCXXevXglay0S73RcsK+7+ZJDI7G3XHE/tMRykKX8S2gdnwAtMFkRk1wujI2zOoBnEucS9c6hWcC4DaayZBrSLdP0kXLYhO5C7ccZ0PK6sUwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GtYtg1xl7qMB3r7+b8w/ih7mscPa7IgYI92o67P6VZs=;
 b=aonz5wla407jZ3FDsMQbZAlHQGEWeV6rlQTJK9vZN2FJaYgokAVq/+TGES+mB9+tauekJ/dqAT2YyTMMc4J5auAzG8PGY3vH2DUhSeG3tr9XWY4Bw5LynX2aEOEEE468qfhTFf4yeKcndWzZkmW16hrVQbhJ87Ss4WwS2T5INA4qu+Q/XL5FTTf0vxSlEKAC4nGmAJW85312aG1uY9Y4Yz2GwHF+kIYBzT6PZ79TOE2uTpX685Cf+1BqBqKzEZrsXwWWlkXF7JO4nYhcX1whwtQg6jbCvW/pXotj5hquhwDFWGABNbHMfXOZ1dTG5wjkYAGfeRvDGOATMb7XTbii5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtYtg1xl7qMB3r7+b8w/ih7mscPa7IgYI92o67P6VZs=;
 b=Wye3CSDgGF89brDSR5VGGRO5le/oYbGdvR88TGWtYpSjYST2W1JF/pTiRbUoz10Qi+DhjhGj+ogm0YwtQqiGNdiMMSM/JzUnL5jfzWY8Y1OVfak9q1Xyy0p5g9raY/x+pyrwb8l1JUQ1gOdW9xLGKBaEsskNn8T+vs1Zg+APCE4=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OSAPR01MB2146.jpnprd01.prod.outlook.com
 (2603:1096:603:15::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Thu, 2 Jun
 2022 03:23:03 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::7c7c:9331:bdd:218b]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::7c7c:9331:bdd:218b%2]) with mapi id 15.20.5314.013; Thu, 2 Jun 2022
 03:23:03 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Alim Akhtar <alim.akhtar@samsung.com>,
        "avri.altman@wdc.com" <avri.altman@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        scsi <linux-scsi@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 6/7] arm64: dts: renesas: r8a779f0: Add UFS node
Thread-Topic: [PATCH v4 6/7] arm64: dts: renesas: r8a779f0: Add UFS node
Thread-Index: AQHYVGIHfAeb2jY4VEmNTQFLByGlT60DyKaAgAEm+HCANsXSkA==
Date:   Thu, 2 Jun 2022 03:23:03 +0000
Message-ID: <TYBPR01MB53417CC05A3489804436F97AD8DE9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20220420025450.289578-1-yoshihiro.shimoda.uh@renesas.com>
 <20220420025450.289578-7-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdU7_nqwT8J_OKLez9GDU8sCiP_PB1ioZBK5YvevToOsXg@mail.gmail.com>
 <TYBPR01MB5341FD0D3C9B69EAF0CED3CDD8FD9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
In-Reply-To: <TYBPR01MB5341FD0D3C9B69EAF0CED3CDD8FD9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ead7f26d-b7fa-41d6-fb31-08da44473438
x-ms-traffictypediagnostic: OSAPR01MB2146:EE_
x-microsoft-antispam-prvs: <OSAPR01MB214623E35749AB6062FBFAA9D8DE9@OSAPR01MB2146.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6HXtavbsIAzdMnketEKCfbeRfS9ocIsjyyI89tLCg/b4FLmwKfXEEY+RQr4b7Ekrr0xCkw3fCs4sI8zxgRfDzYyue+pnSmPuoQd/mD1vpTwAfXFWXhaQNbxZZLPr1dgtlbV2v0NcTf7JfYQM2ZmTsVENlT5RIdGSYag7jTtBdrnjV7CmjuR7tnSvTeIwntJJq2B8103coow04Mw1fYV/34syj/G3K5Egi2FCjlGMOzK/xAVDw2Dp6uMcJUUMnXiBbd5XDh/zqCO6v3nl4Aoivl0GJ/waHcQd2u+CYTjLs1C2lqd+WmrjUXLx2eUTPT0jhyhSGwY3iGHIiLVtEU9o+qy0pRGH+Ve5YJYctIAsnz/DZUjTgOpTmm0Csj8ta0T7sSRW1bzx2nSMllYPd/7FpK0QXilYLEWvcXaPF1zXMBoe6UQbRoLYslSQbEpuEogoxOcmYkdnLrmnZEVxggV8uJrU64Fh+K+38K+wyIQgrwZ7WAiuQ0+byZ2PxtUrWDIBhWIfYETb8OQGSmbzywvkIsRTWoxUoBAqlww2By0hJPaPmvdBC5GjNdf/W3+P+f0GnNsj4JQKQfOiyQeqLt7eXv80bm2vut0nEeDFF5fAvsp37y2Vjp1D+sOZfyK3ILjguvPyILks1Q+Hu7HMaOZiteeYhIbJ+LkuB4UX01RU9L8KYfFyjbjbIpCjw3LWcG067ycu1cB7mrzzNnqUE8ucUQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(186003)(38100700002)(55016003)(9686003)(86362001)(71200400001)(122000001)(7416002)(64756008)(76116006)(66556008)(5660300002)(4326008)(66946007)(66476007)(66446008)(52536014)(83380400001)(8936002)(33656002)(54906003)(2906002)(8676002)(6916009)(316002)(6506007)(7696005)(53546011)(508600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VlpLUTRnZ0E3Q1Vmb0VuTURBdlZ4cE4rN2hTVmhNTzltOHR3ems5MDgxOTJq?=
 =?utf-8?B?YkpZWWE4Q1BkVlpTOGlIL2pWT0diTmlyVjdOTlhneUdvTjk4OXVwNkhPRUwr?=
 =?utf-8?B?eU1udnRUdFVuSmdKVFdqNWtrV2cyQm1BcksyR3gyck9DdDhHaGpDUHN4dHJO?=
 =?utf-8?B?SnREa2p4TFIwN0RlcHpkOTlLYVY5MmRML0UxZ1lXMFZlcm00MmFlZ1dLaHhY?=
 =?utf-8?B?SERzZHc2WEpPZ0VrTkU2NnhnVklMckVRUmR3THB0aEc5NW94cTZJblZNSmxi?=
 =?utf-8?B?SEozRXlSNC9tTVJjejkyVWJwbXlFeTlXYlJUSy82WkFIWnhLQ0tQYWIvMVMz?=
 =?utf-8?B?RDFGakM4OWFWNzhrY2dxaDVadDdKVGxGU0Z0WlBOMVhHdXI1WkVaWk9LK0c3?=
 =?utf-8?B?QlViWW82M0VhZURDWThkYTRVc3RoWHlaSnp4ODZJeDJHS0w3aVRWMlo2QkpQ?=
 =?utf-8?B?QUdUb2xoSTdzNXNoRkJzempTMXdmZm0vT29ua2tMNVFPak5FTzU5TGppbW9t?=
 =?utf-8?B?OW5sMzNCQlFIRXVNaGtDSlhIVHppWFJnbmFsejNqaDBDalFGbWxzTVdFOXlV?=
 =?utf-8?B?TElKQWhmby9HUHdWeFFJVThMS2doeTRvc3A1UVppVzJia2ZuRHplcURIaGhw?=
 =?utf-8?B?YmFUZUJJK09HVk15WVRKaXB3L2UyQzQyaEErMllqcWsxaW94SVRoUXVsT2Ri?=
 =?utf-8?B?R0NXUUkvVVQ2dlJzV2NCQVdTOUNPTVpGMFR1dFhCeWhJaXFSYXVDUHU2bC9m?=
 =?utf-8?B?Ky9qemZGMWlET05YS0ZtREJNVndDWFJvZzlYeHBmQ0I1YWI0S0d6c0VlanN1?=
 =?utf-8?B?SHBUSXR4UWVOeVJTemF5eSs5aHhiV1c5bXNlMW5mWVpyWlhjZndmQUZzMjJw?=
 =?utf-8?B?dmcvZ21ST2IrWXpYNE40cy9nRHRFVmxZcTF3dzM3bkVHTHhwYWNpRXNXR3o0?=
 =?utf-8?B?dW56WE42TjY3VjkzYjI0Qm5WSHlJakVFamNTZ0tFZ2twZThlVXVNaHlGZlF2?=
 =?utf-8?B?UFJMYXh3RWlQaVM5UXNCZU5HTytUOGxrM0NvRWFITWFoeGhEUHVtYVU0d1h0?=
 =?utf-8?B?Z3c2dWdZdTROYnQ0dzYvK05aZU5GWWZhaG1UVVRIakNsajMvZ2NZamdqZ3RI?=
 =?utf-8?B?RGd1QlJ0NHpqaDQ5c1N6V1ZMdVFoSE1MS3d2VlpYVDkrTmpITVdUZUJZZVNh?=
 =?utf-8?B?QXlzSjZLdEpnU3hrcWZZQ0JtSCthZ3RtMno5MEJIR2U0bTc4TWhRS2dIcXRV?=
 =?utf-8?B?NzR5cXEweHB1Qm11c1JwcTlmMUdCcnR6R0dnUXZLd1BpN2hiS3pFZFpscVJ2?=
 =?utf-8?B?eWJZVnZram03eHJPZGpCWWpmWjVSMmtuWVp2Uyt1TmhaNnhMckMvYkthbzZ1?=
 =?utf-8?B?ZUY0amlMZWREMnJpalJRbVFJMTlqNncxcVo4Sy9QQTZTT0hqT2lCaHFHQU9x?=
 =?utf-8?B?Yis3dStlajk3VVBKcXQ0QlU4Mm9SMUF3bzRDSDRRK01QZTlkV0JnUmtKK0JQ?=
 =?utf-8?B?a0NQejA3NW9Rai8xWHNrOVQwcEVCYldlNGw0c241Z1puN3JXdENzZFBBdWdu?=
 =?utf-8?B?aUh5cjRCSmlRYnZhTHdvT1BhcDR6eThlNjM5Ny9CMkZiblRVZ09NeGhYNzFB?=
 =?utf-8?B?bWpXM1cwYnVWUUM0RzdsOFI4WE5QTUoxNmxHR0F6UGNxYU9GbjRBZmV3Rm5S?=
 =?utf-8?B?ZU1mcU9uMUEwa05OeDNZUnkxMVVBTGwvUUFxTWx5cW1NU0F1TEdiTXFQSUNY?=
 =?utf-8?B?YVZrWjFoQTRmTlZ0Z3YrN2JjZ2VRek9HaUJaUnM1WTRjTW9Eam9BMkVTZmtM?=
 =?utf-8?B?RFJpTW43QklkYXZJTkZVM2VyOFk0VmZQa01tL2ZyK05Db09POG52OHhoWDR0?=
 =?utf-8?B?T2RRc2ttMlFZS093WmxvT05iODRmM0E0YnFHakRoWEdmc2FyaXordERkNEpy?=
 =?utf-8?B?QVBIdGtndjBreDVBeGVsUkdsdDdKK2dkODduU0tTQU5XbCt5bnozaFU2MTdn?=
 =?utf-8?B?YWNISjZzUmxtQUJwTDlDMjM3RG5jazhheTY4Y2FaWmFyUVo3a1dGWUlkMXZE?=
 =?utf-8?B?cHRDK3l1UUNnRk43U1VvQ1krSnZCUGZZRlFXK05WbDVubWhQV0tzVVpnOHBD?=
 =?utf-8?B?VzBGSWorWVI5ZUlubjVaOG9Ib0hQbDEzQ3F0QWpMMGZZekFBaEQ2TTVKYzRP?=
 =?utf-8?B?cE1ISXhVaE1uUDJCdG1hL3VobG0weXl0M2tpWjR0clhDOFBxR3M3R2MzWFFm?=
 =?utf-8?B?WjkydC8vaEh0QUtHWDREdVZKVVAzY1RSQnhBTnphVUhUVU0wMEpiTkROdklI?=
 =?utf-8?B?U1ZSWFNaSnNYQi9aUk5vbFNqckJDMkIrdzlKaGIzVks0NllZV1NGbGRwa003?=
 =?utf-8?Q?dS5tJc4xrl/5aknv7Ga+4ZBWVQvOUNJW/6y3sa4JpU4YH?=
x-ms-exchange-antispam-messagedata-1: bVxrNjV1+mwz/dz+5mvFo/b4BPMoGMAmIj4=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ead7f26d-b7fa-41d6-fb31-08da44473438
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2022 03:23:03.5706
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mk04l1jQKevW2LPiV/eKAglWMHt3fMueWcgjI9N/m7vcsiPy0sHxIQ0e+BWi/LYhARhTtmSBtiF4kVuYbG/5hd8BWYrDKxuNXIgj0k3xtwxBGN5ZRmgjCGaRD9hZwVYB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2146
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IFlvc2hpaGlybyBTaGltb2RhLCBTZW50OiBUaHVyc2Rh
eSwgQXByaWwgMjgsIDIwMjIgMzo1NCBQTQ0KPiANCj4gPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2
ZW4sIFNlbnQ6IFdlZG5lc2RheSwgQXByaWwgMjcsIDIwMjIgMTA6MTQgUE0NCj4gPg0KPiA+IE9u
IFdlZCwgQXByIDIwLCAyMDIyIGF0IDEwOjMxIEFNIFlvc2hpaGlybyBTaGltb2RhDQo+ID4gPHlv
c2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+IEFkZCBVRlMgbm9k
ZSBmb3IgUi1DYXIgUzQtOCAocjhhNzc5ZjApLg0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6
IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4NCj4g
Pg0KPiA+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OWYwLmR0c2kN
Cj4gPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzlmMC5kdHNpDQo+
ID4gPiBAQCAtNDAsNiArNDAsMTMgQEAgZXh0YWxyX2NsazogZXh0YWxyIHsNCj4gPiA+ICAgICAg
ICAgICAgICAgICBjbG9jay1mcmVxdWVuY3kgPSA8MD47DQo+ID4gPiAgICAgICAgIH07DQo+ID4g
Pg0KPiA+ID4gKyAgICAgICB1ZnMzMF9jbGs6IHVmczMwLWNsayB7DQo+ID4gPiArICAgICAgICAg
ICAgICAgY29tcGF0aWJsZSA9ICJmaXhlZC1jbG9jayI7DQo+ID4gPiArICAgICAgICAgICAgICAg
I2Nsb2NrLWNlbGxzID0gPDA+Ow0KPiA+ID4gKyAgICAgICAgICAgICAgIC8qIFRoaXMgdmFsdWUg
bXVzdCBiZSBvdmVycmlkZGVuIGJ5IHRoZSBib2FyZCAqLw0KPiA+ID4gKyAgICAgICAgICAgICAg
IGNsb2NrLWZyZXF1ZW5jeSA9IDwwPjsNCj4gPiA+ICsgICAgICAgfTsNCj4gPg0KPiA+IFRoaXMg
bWF0Y2hlcyB3aGF0IHdlIHR5cGljYWxseSBkbyBmb3IgdGhlIFBDSWUgcmVmZXJlbmNlIGNsb2Nr
LA0KPiA+IGJ1dCByZWxpZXMgb24gdGhlIGN1cnJlbnRseS1taXNzaW5nIGNsb2NrIGdlbmVyYXRv
ciBpbml0aWFsaXphdGlvbg0KPiA+IGluIHRoZSBib290IGxvYWRlciBzdGFjay4NCj4gDQo+IFll
cywgdGhhdCdzIHRydWUuDQo+IA0KPiBPbiBVRlMsIHRoZSB1ZnNoY2QuYyByZXF1aXJlcyBhIHJl
Zl9jbGsgYW5kIHRoaXMgaXMgZm9yIGl0Lg0KPiBUaGUgZHJpdmVyIHdpbGwgZ2V0ICJyZWZfY2xr
IiByYXRlIGFuZCBjaGVjayBpdCBieSB1ZnNfcmVmX2Nsa19mcmVxc1tdLg0KPiANCj4gPiA+ICsN
Cj4gPiA+ICAgICAgICAgcG11X2E1NSB7DQo+ID4gPiAgICAgICAgICAgICAgICAgY29tcGF0aWJs
ZSA9ICJhcm0sY29ydGV4LWE1NS1wbXUiOw0KPiA+ID4gICAgICAgICAgICAgICAgIGludGVycnVw
dHMtZXh0ZW5kZWQgPSA8JmdpYyBHSUNfUFBJIDcgSVJRX1RZUEVfTEVWRUxfTE9XPjsNCj4gPiA+
IEBAIC0yNTgsNiArMjY1LDE4IEBAIGkyYzU6IGkyY0BlNjZlMDAwMCB7DQo+ID4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOw0KPiA+ID4gICAgICAgICAgICAg
ICAgIH07DQo+ID4gPg0KPiA+ID4gKyAgICAgICAgICAgICAgIHVmczogdWZzQGU2ODYwMDAwIHsN
Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicmVuZXNhcyxyOGE3
NzlmMC11ZnMiOw0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDAgMHhlNjg2
MDAwMCAwIDB4MTAwPjsNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMg
PSA8R0lDX1NQSSAyMzUgSVJRX1RZUEVfTEVWRUxfSElHSD47DQo+ID4NCj4gPiBUaGUgUi1DYXIg
UzQtOCBpbnRlcnJ1cHQgbWFwcGluZyBzcHJlYWRzaGVldCBsaXN0cyB0d28gaW50ZXJydXB0cy4N
Cj4gDQo+IE9vcHMuIEknbGwgYWRkIGl0Lg0KDQpJIGFza2VkIHRoZSBoYXJkd2FyZSB0ZWFtIGFi
b3V0IHRoZSBsaXN0ZWQgdHdvIGludGVycnVwdHMuDQpGaW5hbGx5LCBJIGdvdCBmZWVkYmFjayBm
cm9tIHRoZW0gdG9kYXkuDQoNCldlIGNhbiBub3QgdXNlIHRoZSBvbmUgb2YgaW50ZXJydXB0cy4g
U28sIHRoZSBzcHJlYWRzaGVldCB3aWxsIGJlIHJldmlzZWQNCmluIHRoZSBmdXR1cmUuIFNvLCB3
ZSBkb24ndCBuZWVkIHRvIGNoYW5nZSB0aGlzIGludGVycnVwdHMgcHJvcGVydHkuDQoNCkJlc3Qg
cmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGNsb2NrcyA9IDwmY3BnIENQR19NT0QgMTUxND4sIDwmdWZzMzBfY2xrPjsNCj4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGNsb2NrLW5hbWVzID0gImZjayIsICJyZWZfY2xrIjsNCj4g
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGZyZXEtdGFibGUtaHogPSA8MjAwMDAwMDAwIDIw
MDAwMDAwMD4sIDwzODQwMDAwMCAzODQwMDAwMD47DQo+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICBwb3dlci1kb21haW5zID0gPCZzeXNjIFI4QTc3OUYwX1BEX0FMV0FZU19PTj47DQo+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICByZXNldHMgPSA8JmNwZyAxNTE0PjsNCj4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4gPiArICAgICAg
ICAgICAgICAgfTsNCj4gPiA+ICsNCj4gPiA+ICAgICAgICAgICAgICAgICBzY2lmMzogc2VyaWFs
QGU2YzUwMDAwIHsNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAi
cmVuZXNhcyxzY2lmLXI4YTc3OWYwIiwNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAicmVuZXNhcyxyY2FyLWdlbjQtc2NpZiIsICJyZW5lc2FzLHNjaWYiOw0KPiA+
DQo+ID4gVGhlIHJlc3QgTEdUTSwgc28gd2l0aCB0aGUgYWJvdmUgcmVzb2x2ZWQ6DQo+ID4gUmV2
aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+
IA0KPiBUaGFua3MhDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IFlvc2hpaGlybyBTaGltb2RhDQoN
Cg==
