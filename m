Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5FCD6F55E7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 May 2023 12:20:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbjECKUS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 3 May 2023 06:20:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbjECKUR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 May 2023 06:20:17 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2129.outbound.protection.outlook.com [40.107.114.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDF9710F3;
        Wed,  3 May 2023 03:20:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dSxTxBltDocRLGQtrZU/EYG8sX3JMbqvliDHbiAY0dVaroQ7qDT3mHnHPSuL/geZVpGvyx9/15XQMWBQ4x4I0bBQNmOCxwzMEI+MH1JNm7TtnI5EcjfH7nfYwQ4iUC/du7BP2yYyoKUg4oMo5SZbmXqoku2ngiB0htJA10Fq7fUfCPCF/fRgu0AmgfDhxgHWzW4wEGSjTXo1q6SerkcsyZY8ep1i+/RaAR+waKsXxAel/aOkvlOhCYd+py97+mFYwWkNaCiVLoEu2dzQz2fqdHqf/d6F0srM3Bhnymzlihl8Ab1/h38diEIFPHJ/QffIib/vW0ih/t3Jfsq9o7O7Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0K7e+9dZGpTkMMHwKqgLB+6FHJNkBE10y5W0fzHvrMs=;
 b=jx3Olz/9P/cHRiFAGe3byiiT6q6Av2cWrkpSbiEMME3Tcs1Xsxni9NEHd+Mr87LBFzLUbQYnG4v4yT70lm1XU5ncbqNP3S8bUPlvSqbK0ncz/jbBXErRX3tqaOYd8xPiSlz+6f7ngANWsryCQr6lXXtaVHUgWTM2+64JV5lZGHsVRyW+14YZLUhJ+CTp3LlzkMliRgnXuAm83SA2qn/sNrsSw9PBCJ6vwe/NN/3tyMDBtRlZAL9bpn2nn0jSgDo4bJ0PIUMiV0lQxXa2gJTb9n/yWTI7jEKAD2l4b4u6e3TahbG9T+vvkq3KIx4i6yvYiNVJ5917kz0zEf+LlIzHFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0K7e+9dZGpTkMMHwKqgLB+6FHJNkBE10y5W0fzHvrMs=;
 b=TbOau5EC9JqKTQ4G68ZUCkUGvnyv7nQsQ0uklv+eTI5rWTCNBDEWJ1u6BfwCaFSmZFiER9IAe94KENZTEUWkOe5cWyoGt/JbISgptr9grxBD3rciuUdZxO8EfO2QJp+h1W/leC8lCGGdYO4opazpeDjsY0vSJaTJ9GlfiPZO+T0=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB7865.jpnprd01.prod.outlook.com (2603:1096:604:1b5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21; Wed, 3 May
 2023 10:20:12 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6363.021; Wed, 3 May 2023
 10:20:11 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH RFC 1/6] dt-bindings: mfd: Add Renesas RAA215300 PMIC
 bindings
Thread-Topic: [PATCH RFC 1/6] dt-bindings: mfd: Add Renesas RAA215300 PMIC
 bindings
Thread-Index: AQHZfZu8ZyJhHVfu6UKCJMS/J3k6Qa9ISq+AgAAJetA=
Date:   Wed, 3 May 2023 10:20:11 +0000
Message-ID: <OS0PR01MB592206A862585B47650CBFBA866C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230503084608.14008-1-biju.das.jz@bp.renesas.com>
 <20230503084608.14008-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdXQa3-Qnyru_3=hccWjEZwZxriUHc8-5PrpwzQaxsy5Hw@mail.gmail.com>
In-Reply-To: <CAMuHMdXQa3-Qnyru_3=hccWjEZwZxriUHc8-5PrpwzQaxsy5Hw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSZPR01MB7865:EE_
x-ms-office365-filtering-correlation-id: 66119390-2be8-4be8-4285-08db4bbffa9f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1bS+dRUGYmmdEnV4xQiCfDrf32t2kt0tK0DDallwJ/41lz7pjb18/n3ahABnizRiY22AJfoTpAiJT6sT2iYAGOuFzSQbP6P0KU3X0ZuLTsCCTc6uR844I91X17nlZFjH8bCuWroowizNRy3ff/jh1xWL8+W9tJShdVbFySBIz8JkIPQtHeqQO4rb2AwEmbo1DPVDseb+005kt3pgoUV/90vEObjKs6In9QB1T9CjLbhGcWN9Ot8VI0f9ifJjlEEA9MIGdAJn+zj6tQ1Pc3fuXN2pt4VB2WmsQcQMyOMJA0eu96CssHUNiyQ7Plhh9p7fhbmLV+x1UsD/uLiw1V7LP1xV+7GxoRL+FC8JN8zSVbBbAEwLGh497q6e6uCJ+bG7f7Y0//uNJnT0g7BL0FTCDpOVfmPVqnds55gZjZ2VWLEa/zVNVe7h96RP9e3WsVo2xuTfV/z8pXAD53sZFX2brUHxlfcusEbT1DcfZUR0NW7+fa/LW7FaBMUlLixJz2OV0TtiKtr7fgnDmiGWZca0sJPgUkjlWGVUBLFiI5EijyW6aWbShjAEbl+6JSrLo2p7NP7NZ/eFJneCt4TAL52YF6ED38cEvB9Piq0MzxCSQgI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(396003)(376002)(39860400002)(346002)(451199021)(66899021)(86362001)(966005)(76116006)(66946007)(66476007)(66556008)(66446008)(64756008)(6916009)(4326008)(478600001)(45080400002)(71200400001)(7696005)(316002)(54906003)(33656002)(83380400001)(53546011)(9686003)(107886003)(6506007)(26005)(8676002)(8936002)(5660300002)(52536014)(2906002)(55016003)(38100700002)(38070700005)(186003)(122000001)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WE5KYmdET2pvNExBSThGRFZEdFFiYTZWUUJ1d1N6RDNqY21QY3UxN0tyejJW?=
 =?utf-8?B?TlU4N3NONmkyMW9waE9HamhUekQxbmU1bVhXampReC9CcjZEam1yK05xTkhT?=
 =?utf-8?B?Nm1RellUR3ovU1Rnd1ByTDdaZ2hkeVVCK0hpenVwY21ZS2ZKaHJQWHN4REJI?=
 =?utf-8?B?eUNwZy9jN1BWOTkvbW5Oamc2dGpmQjBLTllJUWMyMDMrOFpOdjBaaVgvV0Uw?=
 =?utf-8?B?QzVTRitiUFREL2c2bDhnVGp4LzJoNEdJMVJyQ2x5Zk1pRHFvbFZZNTV1bVNj?=
 =?utf-8?B?cDQrUkkzSE1Qai9tOXkzdmcwOWRiVlBXSnhzZEM3RWVBaXVEOVQwVWNlRVhB?=
 =?utf-8?B?K1lnYmkwcUNFUUZkYkhYTGZiSm9hOExsQWYxdmx5ZnVETGoyUHJqbk56QW16?=
 =?utf-8?B?ZmNjVWtDc2xtdS9XcDhxeXlkdTkzNnVoL3FRcXkrUmhmQ3dPTUIxbGdFd3NO?=
 =?utf-8?B?MmI2ZHlkZjNFU3djT09tckoyaGRSTXBiTVpWeEw5a2JYVnVmOUhseG5aOEQw?=
 =?utf-8?B?TW5XeXBnWEVFMG1BRXRTQUxSalFHQW9Eb1ZTVlM5SmJoMHlkRHdFY1RidnJt?=
 =?utf-8?B?NVR4WWVxUnZGM2tvZHhjUGUvdDc1ZUxvQzFGYzI3VHlCMGFZTzhyWXAzT2J0?=
 =?utf-8?B?T0dTdHN3cUJ2Ymo0cnN3RU9JT2VBR05jR2hXV2pKZytFK0lsZUVwRnA4NUF3?=
 =?utf-8?B?d09mUVRQc0dDcTJ3VmMrelR1bmRXcHcxU0pKK0VWZmlMREJLeGNrTHlzaUsw?=
 =?utf-8?B?VUZhVzhHTW9TZTVvdlhwZ2dXR3JDZXQzTmlia3dPT0NjekJ6SCtRWndtU29O?=
 =?utf-8?B?M0xLQUFmNFgyNjlYVFptZEN4SEU4YnBSMXE1STZieW9GUVFsNldUK21UWlRS?=
 =?utf-8?B?QytnWEExRDl0czBVcHY4NlErQzFnOG1QYmg2UFJQQ2o2Q1pjRUJNeG1OSUR4?=
 =?utf-8?B?TFhrbTgxdk54ZjVJZ3RWUzlQR3NsRXpvd0xQRTl1NE5XMHV4d0l0RE43YkJ2?=
 =?utf-8?B?RFZYV2lEczZtZnFFeXhCZjJsMzEwNGdUYzE1dW9tYnc3Yzc1R1dNZzFaaFdM?=
 =?utf-8?B?RS9wNHFSdDI4b0dOZnJZZDZUYWpmL1BWNk9RbmNGcTVUWGw5eXBSdENuS2s2?=
 =?utf-8?B?Ui84ZzJDTjVJZE05RHlMaURPTklkRm14ZnhjZjBaZEluSndWVGJMeXc5RDVx?=
 =?utf-8?B?NEpkMFRhNGdKNHNGT0NtTFBIenJOMUhTZnhCZG9uTmNpWkI3WXpKU3pDZUQx?=
 =?utf-8?B?Y3hUK3FHcCtaTmRndGtLcjlFZmpUMWVqL3RFNU5GSEI4UjdWU3FGbXdBNFNn?=
 =?utf-8?B?U1NCYjJKejUrNy9hckx6S0RwV1VUaGl0Q3Y2RHZTZTUxZkQ5TitneldCOUZ2?=
 =?utf-8?B?aXFPcU13emNRUUlEcFpONjZBQ0t0WlFhT25Mb0gzQkNpVzJYQm1MQU1JTzZ5?=
 =?utf-8?B?ZlcrWWlyNGZHV0V4K3BnSHlVdC9ETUZsT2NEMDNrWHVETHIyNkZ3UGI0OE9z?=
 =?utf-8?B?d2xLMlJyUmJIc2RUK1d5ajJkeHN1cXNPQWhpMjVXQjIxazNMS2ZPSmIrdEJk?=
 =?utf-8?B?Wk5XaFF1S29SYnlUdXA2RlpNV3VWcXl5NVNYVmJOekkxUkYvZEdJcnloc2VW?=
 =?utf-8?B?ZktVNGZWTzgvWFhySTFjWHQ2MkxBdUJlV0d4Nmg1OEJsUE55T1pPdU1NdXlP?=
 =?utf-8?B?dllLbHhmNk5wdldoWWhvcEpvQXllRVJ0aDFMQ2xUV0M3bEx6N2ZkWlJtcGYw?=
 =?utf-8?B?dU5LNXJqaEVzRXJTUGVadXlLa3p4NktkM2Urcmc2b01rTFBmY25ZcisrcFVv?=
 =?utf-8?B?ZzJnU3kxOUtBNTVIUXFwQnEzdXpLOFFncUFBU1h0THJRdFl5WXRVdUkrK29p?=
 =?utf-8?B?dm0yeENCN0xkZmo3ZXY4Z3VTMkJERlN0ZjJuZ3NQNTF0Y2xSU0kvSCtOOEZT?=
 =?utf-8?B?aVc3WjBVZS93MHQ2bmFxY0FXSkNVclYvamtHcTg3OXlEcjhLNEg5UG1FWG5h?=
 =?utf-8?B?aEFVTktWbDVDSFRiSi9MU1paUDlsdEFxMTlUM2FEcDFzQ3cyMktJVklCb0p1?=
 =?utf-8?B?WFJTMGJ6OWVoVzNidTNWSGsxdENKSWRoV0tGeldvTUo5Zk9sVFdMa3JLalJh?=
 =?utf-8?Q?T6owfQEdngOOfTzOGlRKSItF5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66119390-2be8-4be8-4285-08db4bbffa9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2023 10:20:11.8402
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FvTWcAkamCdMGedtwF5mtULwNjqfRS9PKoK1wA/xXldG/SFxVNCZlLVNau1RXjTkGjq9DWB+/9NnM621sQfz35OmHvg+h/bRZMioZCniIDI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7865
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
UEFUQ0ggUkZDIDEvNl0gZHQtYmluZGluZ3M6IG1mZDogQWRkIFJlbmVzYXMgUkFBMjE1MzAwIFBN
SUMNCj4gYmluZGluZ3MNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBXZWQsIE1heSAzLCAyMDIz
IGF0IDEwOjQ24oCvQU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90
ZToNCj4gPiBEb2N1bWVudCBSZW5lc2FzIFJBQTIxNTMwMCBQTUlDIGJpbmRpbmdzLg0KPiA+DQo+
ID4gVGhlIFJBQTIxNTMwMCBpcyBhIGhpZ2ggUGVyZm9ybWFuY2UgOS1DaGFubmVsIFBNSUMgc3Vw
cG9ydGluZyBERFINCj4gPiBNZW1vcnksIHdpdGggQnVpbHQtSW4gQ2hhcmdlciBhbmQgUlRDLg0K
PiA+DQo+ID4gSXQgc3VwcG9ydHMgRERSMywgRERSM0wsIEREUjQsIGFuZCBMUEREUjQgbWVtb3J5
IHBvd2VyIHJlcXVpcmVtZW50cy4NCj4gPiBUaGUgaW50ZXJuYWxseSBjb21wZW5zYXRlZCByZWd1
bGF0b3JzLCBidWlsdC1pbiBSZWFsLVRpbWUgQ2xvY2sgKFJUQyksDQo+ID4gMzJrSHogY3J5c3Rh
bCBvc2NpbGxhdG9yLCBhbmQgY29pbiBjZWxsIGJhdHRlcnkgY2hhcmdlciBwcm92aWRlIGENCj4g
PiBoaWdobHkgaW50ZWdyYXRlZCwgc21hbGwgZm9vdHByaW50IHBvd2VyIHNvbHV0aW9uIGlkZWFs
IGZvcg0KPiA+IFN5c3RlbS1Pbi1Nb2R1bGUgKFNPTSkgYXBwbGljYXRpb25zLiBBIHNwcmVhZCBz
cGVjdHJ1bSBmZWF0dXJlDQo+ID4gcHJvdmlkZXMgYW4gZWFzZS1vZi11c2Ugc29sdXRpb24gZm9y
IG5vaXNlLXNlbnNpdGl2ZSBhdWRpbyBvciBSRg0KPiA+IGFwcGxpY2F0aW9ucy4NCj4gPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4g
DQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvcmVuZXNhcyxyYWEyMTUz
MDAueWFtbA0KPiA+IEBAIC0wLDAgKzEsNTcgQEANCj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpICVZQU1MIDEuMg0KPiA+ICstLS0N
Cj4gPiArJGlkOg0KPiA+ICtodHRwczovL2pwbjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxv
b2suY29tLz91cmw9aHR0cCUzQSUyRiUyRmRldmkNCj4gPiArY2V0cmVlLm9yZyUyRnNjaGVtYXMl
MkZtZmQlMkZyZW5lc2FzJTJDcmFhMjE1MzAwLnlhbWwlMjMmZGF0YT0wNSU3QzAxDQo+ID4gKyU3
Q2JpanUuZGFzLmp6JTQwYnAucmVuZXNhcy5jb20lN0MzNzMwMmM2ZjM3YjA0OGFlMjYwZjA4ZGI0
YmJhMWYyZiU3Qw0KPiA+ICs1M2Q4MjU3MWRhMTk0N2U0OWNiNDYyNWExNjZhNGEyYSU3QzAlN0Mw
JTdDNjM4MTg3MDM0OTc4NzAzNTExJTdDVW5rbm8NCj4gPiArd24lN0NUV0ZwYkdac2IzZDhleUpX
SWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpDQo+ID4gK0xD
SlhWQ0k2TW4wJTNEJTdDMzAwMCU3QyU3QyU3QyZzZGF0YT1xbmhKR3pQb2xGU3NZMWZOMnA4QkpU
dyUyRkNadW5GSQ0KPiA+ICslMkJXZ1puZTZDWFMwVDQlM0QmcmVzZXJ2ZWQ9MA0KPiA+ICskc2No
ZW1hOg0KPiA+ICtodHRwczovL2pwbjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29t
Lz91cmw9aHR0cCUzQSUyRiUyRmRldmkNCj4gPiArY2V0cmVlLm9yZyUyRm1ldGEtc2NoZW1hcyUy
RmNvcmUueWFtbCUyMyZkYXRhPTA1JTdDMDElN0NiaWp1LmRhcy5qeiU0DQo+ID4gKzBicC5yZW5l
c2FzLmNvbSU3QzM3MzAyYzZmMzdiMDQ4YWUyNjBmMDhkYjRiYmExZjJmJTdDNTNkODI1NzFkYTE5
NDdlNA0KPiA+ICs5Y2I0NjI1YTE2NmE0YTJhJTdDMCU3QzAlN0M2MzgxODcwMzQ5Nzg3MDM1MTEl
N0NVbmtub3duJTdDVFdGcGJHWnNiM2QNCj4gPiArOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlq
b2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3DQo+ID4gK0MzMDAwJTdD
JTdDJTdDJnNkYXRhPTg2JTJGS3hyV1M2b0paVnBtVHlZbUtxSm1SdUJUWVdxbXFTbHdNdnRTMTZw
YyUzRA0KPiA+ICsmcmVzZXJ2ZWQ9MA0KPiA+ICsNCj4gPiArdGl0bGU6IFJlbmVzYXMgUkFBMjE1
MzAwIFBvd2VyIE1hbmFnZW1lbnQgSW50ZWdyYXRlZCBDaXJjdWl0IChQTUlDKQ0KPiA+ICsNCj4g
PiArbWFpbnRhaW5lcnM6DQo+ID4gKyAgLSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNh
cy5jb20+DQo+ID4gKw0KPiA+ICtkZXNjcmlwdGlvbjogfA0KPiA+ICsgIFRoZSBSQUEyMTUzMDAg
aXMgYSBoaWdoLXBlcmZvcm1hbmNlLCBsb3ctY29zdCA5LWNoYW5uZWwgUE1JQw0KPiA+ICtkZXNp
Z25lZCBmb3INCj4gPiArICAzMi1iaXQgYW5kIDY0LWJpdCBNQ1UgYW5kIE1QVSBhcHBsaWNhdGlv
bnMuIEl0IHN1cHBvcnRzIEREUjMsDQo+ID4gK0REUjNMLCBERFI0LA0KPiA+ICsgIGFuZCBMUERE
UjQgbWVtb3J5IHBvd2VyIHJlcXVpcmVtZW50cy4gVGhlIGludGVybmFsbHkgY29tcGVuc2F0ZWQN
Cj4gPiArcmVndWxhdG9ycywNCj4gPiArICBidWlsdC1pbiBSZWFsLVRpbWUgQ2xvY2sgKFJUQyks
IDMya0h6IGNyeXN0YWwgb3NjaWxsYXRvciwgYW5kIGNvaW4NCj4gPiArY2VsbA0KPiA+ICsgIGJh
dHRlcnkgY2hhcmdlciBwcm92aWRlIGEgaGlnaGx5IGludGVncmF0ZWQsIHNtYWxsIGZvb3Rwcmlu
dCBwb3dlcg0KPiA+ICtzb2x1dGlvbg0KPiA+ICsgIGlkZWFsIGZvciBTeXN0ZW0tT24tTW9kdWxl
IChTT00pIGFwcGxpY2F0aW9ucy4gQSBzcHJlYWQgc3BlY3RydW0NCj4gPiArZmVhdHVyZQ0KPiA+
ICsgIHByb3ZpZGVzIGFuIGVhc2Utb2YtdXNlIHNvbHV0aW9uIGZvciBub2lzZS1zZW5zaXRpdmUg
YXVkaW8gb3IgUkYNCj4gYXBwbGljYXRpb25zLg0KPiA+ICsNCj4gPiArICBUaGlzIGRldmljZSBl
eHBvc2VzIHR3byBkZXZpY2VzIHZpYSBJMkMuIE9uZSBmb3IgdGhlIGludGVncmF0ZWQgUlRDDQo+
ID4gKyBJUCwgYW5kICBvbmUgZm9yIGV2ZXJ5dGhpbmcgZWxzZS4NCj4gPiArDQo+ID4gKyAgTGlu
ayB0byBkYXRhc2hlZXQ6DQo+ID4gKw0KPiA+ICsgaHR0cHM6Ly93d3cucmVuZXNhcy5jb20vaW4v
ZW4vcHJvZHVjdHMvcG93ZXItcG93ZXItbWFuYWdlbWVudC9tdWx0aS0NCj4gPiArIGNoYW5uZWwt
cG93ZXItbWFuYWdlbWVudC1pY3MtcG1pY3Mvc3Nkc29jLXBvd2VyLW1hbmFnZW1lbnQtaWNzLXBt
aWMtDQo+ID4gKyBhbmQtcG11cy9yYWEyMTUzMDAtaGlnaC1wZXJmb3JtYW5jZS05LWNoYW5uZWwt
cG1pYy1zdXBwb3J0aW5nLWRkci1tZQ0KPiA+ICsgbW9yeS1idWlsdC1jaGFyZ2VyLWFuZC1ydGMN
Cj4gPiArDQo+ID4gK3Byb3BlcnRpZXM6DQo+ID4gKyAgY29tcGF0aWJsZToNCj4gPiArICAgIGVu
dW06DQo+ID4gKyAgICAgIC0gcmVuZXNhcyxyYWEyMTUzMDANCj4gDQo+IHJlbmVzYXMscmFhMjE1
MzAwLXBtaWM/DQoNCk9LLg0KDQo+IA0KPiA+ICsNCj4gPiArICByZWc6DQo+ID4gKyAgICBtYXhJ
dGVtczogMQ0KPiA+ICsNCj4gPiArICByZW5lc2FzLHJhYTIxNTMwMC1ydGM6DQo+IA0KPiByZW5l
c2FzLHJ0Yz8NCg0KT0suIFdpbGwgd2FpdCBmb3Igb3RoZXJzIGNvbW1lbnRzLg0KDQpDaGVlcnMs
DQpCaWp1DQoNCj4gDQo+IA0KPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVm
aW5pdGlvbnMvcGhhbmRsZQ0KPiA+ICsgICAgZGVzY3JpcHRpb246IHBoYW5kbGUgdG8gdGhlIGJ1
aWx0LWluIFJUQyBkZXZpY2UuDQo+ID4gKw0KPiA+ICtyZXF1aXJlZDoNCj4gPiArICAtIGNvbXBh
dGlibGUNCj4gPiArICAtIHJlZw0KPiA+ICsNCj4gPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZh
bHNlDQo+ID4gKw0KPiA+ICtleGFtcGxlczoNCj4gPiArICAtIHwNCj4gPiArICAgIGkyYyB7DQo+
ID4gKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+ID4gKyAgICAgICAgI3NpemUtY2Vs
bHMgPSA8MD47DQo+ID4gKw0KPiA+ICsgICAgICAgIHBtaWM6IHJhYTIxNTMwMEAxMiB7DQo+ID4g
KyAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicmVuZXNhcyxyYWEyMTUzMDAiOw0KPiA+ICsgICAg
ICAgICAgICByZWcgPSA8MHgxMj47DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICByZW5lc2FzLHJh
YTIxNTMwMC1ydGMgPSA8JnJ0Y19yYWEyMTUzMDA+Ow0KPiA+ICsgICAgICAgIH07DQo+ID4gKyAg
ICB9Ow0KPiA+IC0tDQo+ID4gMi4yNS4xDQo+ID4NCg==
