Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 663D267A7FC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jan 2023 01:49:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230294AbjAYAtw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Jan 2023 19:49:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233619AbjAYAtv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jan 2023 19:49:51 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2130.outbound.protection.outlook.com [40.107.113.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 848853FF09;
        Tue, 24 Jan 2023 16:49:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bwg10XIVMYzNmQswok0/HSuvCBm7OyGXZPs2iGnIT6ZDC+HWk+7HfFacO8P93QLPqsrsDUClbaaUtA4Za+pGXhXKYm7XCZOFtcPsuPwdr7w/R3tL0FDKB2gKud7Fhk4bj9+cbaif4b6b3pBriXODi83pQJ0xXXDVdQdcOqnTeNdxxaP1ggiU4yxsxIf7YXs5Gk2dfmGxsnIQQydz8WQGnhIE7S7RbcYM6WIiR0XJKZYTj0eK89fJDcHTiOHkD74hQnhoWMwT7cd8Jp4IxVbIIlgOoypDJlqsPzB9DzjOqcd3TzbtHOIfO9hO0BfD3qKk+mej7y8NOYrUya1dqjZ5kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcmIZJLqMGYIKKt6S5TmEJPFVJgvJcXtfyIXgJqUs9E=;
 b=mSSyV7XqOUyuUsdsDsC8pf0OymOujW8rSO3BfRvxXchVPYnvBM7yk2m6menIOzKUCw3ekDprXF5FwzGi8tco9T3G2Jm/LwpEwjyQZS1fnvxBAeQTgvRJYHFVRpWGYwbAwRKqAM+rl1GnouPkryi3h29uNktfYvQ70Qoj6GLet+INUZXnJxGvT7o0dkNSlCDex30OMOfhMbKstVCM3Dn8YGVZXDMsXwFMvQTutqQ1W12f1r/ml602GjrPOl8IPBdhVCLpIR3+f5y8BKqY1Ket8DU1dC6yDUclBo0RtPJ0RS59JMPCBwwfKnwAmmINXyVk+C3xupJuAaEN94yAfsiWjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lcmIZJLqMGYIKKt6S5TmEJPFVJgvJcXtfyIXgJqUs9E=;
 b=mMe1FkGZSbr6R75wevDP8ao2TXiB/yfSo/+VGtTUfJ3Nw2DlC91E82yE97b9TGxKnsGSuiOMuiut8Z1QjSBzxkBo/EbJkauXjUxFFa9OsMI2/B1Y7IxQWsCaoOUE4JMXiK7f5iB63lrQMd3dUqFs3A2vvE4sJ9oaypdglQMFjvc=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYBPR01MB5423.jpnprd01.prod.outlook.com
 (2603:1096:404:802f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 00:49:46 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::3e61:3792:227e:5f18]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::3e61:3792:227e:5f18%9]) with mapi id 15.20.6043.020; Wed, 25 Jan 2023
 00:49:46 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     "joro@8bytes.org" <joro@8bytes.org>,
        "will@kernel.org" <will@kernel.org>,
        "robin.murphy@arm.com" <robin.murphy@arm.com>,
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
Thread-Index: AQHZLsourgLTvtmvK0W71iwTdWHd8a6tpGsAgACkryA=
Date:   Wed, 25 Jan 2023 00:49:46 +0000
Message-ID: <TYBPR01MB5341B023178B4A10DE52B844D8CE9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20230123012940.1250879-1-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdX92KMeON0xC9p17kiqWT7ksEBX_NyPiiQk0fLaucDZBA@mail.gmail.com>
In-Reply-To: <CAMuHMdX92KMeON0xC9p17kiqWT7ksEBX_NyPiiQk0fLaucDZBA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYBPR01MB5423:EE_
x-ms-office365-filtering-correlation-id: 29975f70-7926-4f85-a71f-08dafe6e0e13
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KGAJsAqYr10lI9uk5I1pbopLQWY3DTWYOcCH2KeaxiunZyb9bg5cVyGOp/MylRpxXsHPSNf8sJcboJzuEblUOncykm1tUoq/4SHIcauOzcuJrTARy3E3/83NqKxla6+G48Wgn4gM2o+7YsLIrJQvl3xOBx3wxUNdwzSsE8Pv/Ggo0eErqDXAMx+eZsmgwoq8BceHwC7Qiop3/K5x+xA4OPntLMsC2Pv12m3pwsONWTYD8u/aYWB8foLoN3HSdARbDdXksirTgaH9r9QHwzbaoTzgPhhwSKnglMFZ4gZCPrUo6P3WCPC9ZJvG6wieVWOXqhnoHs5JBa2zsbEzc7skGYfT/RuWicVwI4Xx4KNA52jV0yjAN0nL7F2aWcnbjl23lbTULYkj1SdbwyLBD16kIgcVSDpFmT1sAlWLmLBUjk111ZHwH2imUoPY6zlpXVPpvVYbGwqlYQYi+MsHp+ZUMKFVcQc4c7Ypla7ltqBftSmTmulLo5++0gESJFK22ovrT6+JMiRjjcVyFAHLGnumR598jNITBsx490MAGNmATN3pJNqzA084RzTw1O8tLexSeL3WikECEBcV4/TNO8JQkXubXWagC9n2DOI8FIAxL16C8YE9G4xVsRtfBGvjRmX7PBPZZFTGbF2D7VYMrLoxj+nB6kUEPg4qLSIaPVBq+CtMM6Tnypb+7oYUaGnaW+HP3RADIlsi5bOOYlQEb6S4hw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(451199018)(38100700002)(86362001)(38070700005)(5660300002)(8936002)(2906002)(41300700001)(4326008)(66446008)(55016003)(122000001)(33656002)(15650500001)(478600001)(66476007)(52536014)(7696005)(71200400001)(6916009)(8676002)(9686003)(186003)(64756008)(83380400001)(316002)(66946007)(53546011)(66556008)(54906003)(76116006)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z3ZLZXNKOXQ0SGhNVlg4aGpWOVhxT0QybFFVbDJoT0lsVjNTdkN3ZnlFMVlo?=
 =?utf-8?B?QWEzbmsyV25rQjd2a1BLMDgybUk1UFNNRTE4MVFpV2I4SUY3cjZPUE4zRVUw?=
 =?utf-8?B?a3Y2V3ozV2wyb1creHp4L1ZlK1duTHdlWm5wQjB2bGRQdmRmd2dLb0lkWS9I?=
 =?utf-8?B?QVBzUFMyZE03c3hsUUtKNVB5Tzc5OTljWHgveWNobzhMeXlnSzVOWFo4V0lp?=
 =?utf-8?B?Wi9oUk5MMjF0THN1bmpGd2krTTBtY2ZVYWxUY3dJd09ETkQwSE8wSjJCOWJ4?=
 =?utf-8?B?ZzJpSi9VUE9tYjlWc3REZGRjT3U2SFVtN2hhcHUwUldkQnhweUxUUFFNKzlR?=
 =?utf-8?B?dXNzaWQxTHJIMFl5dDZGaXNldHFMN0FpQjFIbUxKOFRpZEx5cnIxVlVHQkZP?=
 =?utf-8?B?Vm1zeG5YbEg3c1FVdFVjZU9YSy9sUXd2UmgzZjN0T0xpWlFIb001UjZmblkz?=
 =?utf-8?B?SHJsV0lFQS8ySkVwWWZDNjV1cFRsc3U1YXBXN1V0V01aNHFPZUpHMUZKdElk?=
 =?utf-8?B?UHArYWZva2VHc1RXWWw3Ky9oZ1ovaXgxMitYSlFSWlFGalgzaWtLSUUrQ29L?=
 =?utf-8?B?SG5EMHdGVWJwemtPNUN0RjFIbVV5dkVtK0Z2WDJrcy9SbHdpNWF0ZFZNTm9L?=
 =?utf-8?B?TU96V2FHZ2tteXVWOU5Pb1ZjcXJ5U04zU1A3dk1UclNHWnIwcElSTSs3NEo0?=
 =?utf-8?B?aUs3UzgvVm9oZjAreWVVK1FrRnBrNmdOZXRVY0k4OXVGd3JQd04rZlZQdVFB?=
 =?utf-8?B?ZUtjTUFnamRTdjljRHU0Y2gyNC9zZGpTb2pWRWxXTXdjQXdEWGoxY0EvQ1Y5?=
 =?utf-8?B?OTdwRmo1bkZFUHUzb3BXdUZtdFpWdzlodmZmRU9wNnY3aEpBTEt1cTBlL2Q4?=
 =?utf-8?B?THNWZ0JKMFdRMFFyR0JoWUlJNUJXdW91WHBHMEJKM0hRajJQL1pBcFA4dDE2?=
 =?utf-8?B?ODNndGwzS3JPVnR4YmdlNEwzM0RuSlNGWnhSaHhiRVBKZ2FzN3hseHdldEpj?=
 =?utf-8?B?MDFQZU1DUUVDNjdTNmZUSzRySEo4RVlGb2cwOFNFY2tJcHJlb3Jxb0pQOVFE?=
 =?utf-8?B?R040eDgybWt2WERjK045NGhjalliVndTL0JEb28zTzBObitoWU9DWi9nTXdC?=
 =?utf-8?B?b1FtVnJGSXBHUSs1MkFNT1dtS0pLYkJuUmxXS3RORHRJdWNPejIwTkZBRkVz?=
 =?utf-8?B?dkxRNmNiSjhDY1dFY25aUm1WYWFYeFhZU1J5RzZEK0JqM3dDTWFvdVRxTCsy?=
 =?utf-8?B?STFKbEhlbTlza2lHcTNHWGxvbWU0c2ZzTGxEaWEzQy92NGhIYWVGZjJoTEth?=
 =?utf-8?B?MVJqVlY5MndWWmlaaW8ray9wOENyejB6SzhSSEZlcE9sWUxmdGNRZFBmWEE3?=
 =?utf-8?B?LzU1WTRucy9GMGZNc01WYnduMGVQbnVrWUdLTEVIZElpT1JWTEE5aWU3ZXh5?=
 =?utf-8?B?eFBDV212M2gzM0laZG5GVEt6blUraW1US2NIMmhSVGRkZDFSdWNlczg5bnBk?=
 =?utf-8?B?TE5uZ2M2bzM3Nk8rRjJRcXkxcWlxS3RPdVR0N0JmVERqcjgxRk5hL1YvSFpE?=
 =?utf-8?B?b3lxS2V2YkVodXgyTWNCcGp5ckdESWFMU0VLaDlNYk1IeGtvbnhndmVQdSsx?=
 =?utf-8?B?UCtjbHVMYUEyOE5LeENubGkzMUpFNVcrTUtZc0JYai8vUmxSM3pXRWpXd2VI?=
 =?utf-8?B?UXVPTFhGd0tXNjZUMG5nVEtUY0VuVEttUEx1QnRPUXR6RXA5YWRWWXdseFJC?=
 =?utf-8?B?cDVzdXg0bmtCZXpVL2hnQVhlK1Z1SmNYU2tjU3dOMFFiZlNuUnh4b3dmeStu?=
 =?utf-8?B?K2FLekErRnNsQVZoa1pDTm5wZ3I4eWU2K21idlBTRE9JRm8wQTdVc1hWQ3l6?=
 =?utf-8?B?eHlkMjJ4Yjh6STQwcnBQVko3ZDFITktpeTJteDFIRFI0VW9yVWNxeGMwQXJX?=
 =?utf-8?B?MmMwMFMyeDlDbi9ZM1lkK2lZS05TUkdyWGluTjdRMlNLQXJDVTdUbzJESHdT?=
 =?utf-8?B?ZjZDRVdiQndIYWVvUE9QZGFKOENrYWJFcG1KNk1Ya0o5K3U0NWNTSjROZHh2?=
 =?utf-8?B?MEY5VEozZGdmYUk5TVV6VHNnQjI3RkR4TVMyNXBvc2ErV3ViLzZQc2Z5bWpm?=
 =?utf-8?B?dFV0Qmo2eXo0RnNUYlBpT3IreWVCQ0JKaTdmS3JpazUzd21Zby9NWm1OTHZh?=
 =?utf-8?B?Wm5QRzRidkNjc25kaU9IcDBJWFBOK2FJNUJzQmdLSFhiOTZSOTJSa3Z0L1Ra?=
 =?utf-8?B?ek1IaW9MbytPTFFHM1Q5REhPZHhRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29975f70-7926-4f85-a71f-08dafe6e0e13
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2023 00:49:46.1733
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dJnScfTsz89ua1bZ/aSYO8m3DJlJZsPkEsf6huYsPsjcK+E9LQ9ZcUwHhd7sVU0RvHmHAHH67toVJv1uVl0JRbHTPfZcK8zIblzMvjUSdXWnQPp1w62auE/DS60EMaku
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5423
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVHVlc2Rh
eSwgSmFudWFyeSAyNCwgMjAyMyAxMTozNSBQTQ0KPiANCj4gSGkgU2hpbW9kYS1zYW4sDQo+IA0K
PiBPbiBNb24sIEphbiAyMywgMjAyMyBhdCAyOjM1IEFNIFlvc2hpaGlybyBTaGltb2RhDQo+IDx5
b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gU2luY2UgUi1DYXIg
R2VuNCBkb2Vucyd0IGhhdmUgdGhlIG1haW4gSVBNTVUgSU1TU1RSIHJlZ2lzdGVyLCBidXQNCj4g
PiBlYWNoIGNhY2hlIElQTU1VIGhhcyBvd24gbW9kdWxlIGlkLiBTbywgdXBkYXRlIGRlc2NyaXB0
aW9ucyBvZg0KPiA+IHJlbmVzYXMsaXBtbXUtbWFpbiBwcm9wZXJ0eSBmb3IgUi1DYXIgR2VuNC4N
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8uc2hp
bW9kYS51aEByZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCg0KVGhh
bmsgeW91IGZvciB5b3VyIHJldmlldyENCg0KPiA+IC0tLQ0KPiA+ICBUaGUgb2xkIFItQ2FyIFM0
LTggZGF0YXNoZWV0IGhhZCBkZXNjcmliZWQgSVBNTVUgSU1TU1RSIHJlZ2lzdGVyLCBidXQNCj4g
PiAgdGhlIGxhdGVzdCBkYXRhc2hlZXQgdW5kb2N1bWVudGVkIHRoZSByZWdpc3Rlci4gU28sIHVw
ZGF0ZSB0aGUgcHJvcGV0aWVzDQo+ID4gIGRlc2NyaXB0aW9uLiBOb3RlIHRoYXQgdGhlIHNlY29u
ZCBhcmd1bWVudCBpcyBub3QgdXNlZCBvbiB0aGUgZHJpdmVyLg0KPiANCj4gRFQgZGVzY3JpYmVz
IGhhcmR3YXJlLCBub3Qgc29mdHdhcmUgcG9saWN5Lg0KDQpJIHRoaW5rIHNvLg0KDQo+ID4gIFNv
IG5vIGJlaGF2aW9yIGNoYW5nZS4NCj4gDQo+IFNvIHdoZXJlIGRvIHdlIGdldCB0aGUgbW9kdWxl
IGlkIG51bWJlcnMgdG8gdXNlLCBpZiB0aGV5IGFyZSBubyBsb25nZXINCj4gZG9jdW1lbnRlZCBp
biB0aGUgSGFyZHdhcmUgTWFudWFsPw0KDQpJZiBzbywgd2UgY2Fubm90IGdldCB0aGUgbW9kdWxl
IGlkIG51bWJlcnMuIFNvLCBzaG91bGQgd2UgdXNlIG90aGVyDQppbmZvcm1hdGlvbiB3aGljaCBp
cyBjb21wbGV0ZWx5IGZpeGVkIGluc3RlYWQ/IEkgaGF2ZSBzb21lIGlkZWFzOg0KMSkgSnVzdCAw
IChvciBvdGhlciBmaXhlZCB2YWx1ZSkgaWYgdGhlIElNU1NUUiByZWdpc3RlciBkb2Vzbid0IGV4
aXN0Lg0KMikgU2VxdWVudGlhbCBudW1iZXJzIGZyb20gcmVnaXN0ZXIgYmFzZSBvZmZzZXQuDQog
ICBJbiBSLUNhciBTNDogaXBtbXVfcnQwIGlzIHRoZSBmaXJzdCBub2RlIGZyb20gcmVnaXN0ZXIg
YmFzZSBvZmZzZXQsDQogICBhbmQgaXBtbXVfcnQxIGlzIHRoZSBzZWNvbmQgb25lLg0KICAgU28s
IGlwbW11X3J0MCBpcyAwLCBpcG1tdV9ydDEgaXMgMSwgaXBtbXVfZHMwIGlzIDIgYW5kIGlwbW11
X2hjIGlzIDMuDQozKSBVc2luZyBiYXNlIGFkZHJlc3MgdXBwZXIgMTYtYml0cy4gDQogICBJbiBS
LUNhciBTNDogaXBtbXVfcnQwIGlzIDB4ZWU0ODAwMDAuIFNvLCB0aGUgdmFsdWUgaXMgMHhlZTQ4
Lg0KDQpQZXJoYXBzLCB0aGUgb3B0aW9uIDEpIGlzIHJlYXNvbmFibGUsIEkgdGhpbmsuIEJ1dCwg
d2hhdCBkbyB5b3UgdGhpbms/DQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoN
Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW9tbXUvcmVuZXNh
cyxpcG1tdS12bXNhLnlhbWwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvaW9tbXUvcmVuZXNhcyxpcG1tdS12bXNhLnlhbWwNCj4gPiBAQCAtNzYsMTQgKzc2LDE1
IEBAIHByb3BlcnRpZXM6DQo+ID4gICAgICBpdGVtczoNCj4gPiAgICAgICAgLSBpdGVtczoNCj4g
PiAgICAgICAgICAgIC0gZGVzY3JpcHRpb246IHBoYW5kbGUgdG8gbWFpbiBJUE1NVQ0KPiA+IC0g
ICAgICAgICAgLSBkZXNjcmlwdGlvbjogdGhlIGludGVycnVwdCBiaXQgbnVtYmVyIGFzc29jaWF0
ZWQgd2l0aCB0aGUgcGFydGljdWxhcg0KPiA+IC0gICAgICAgICAgICAgIGNhY2hlIElQTU1VIGRl
dmljZS4gVGhlIGludGVycnVwdCBiaXQgbnVtYmVyIG5lZWRzIHRvIG1hdGNoIHRoZSBtYWluDQo+
ID4gLSAgICAgICAgICAgICAgSVBNTVUgSU1TU1RSIHJlZ2lzdGVyLiBPbmx5IHVzZWQgYnkgY2Fj
aGUgSVBNTVUgaW5zdGFuY2VzLg0KPiA+ICsgICAgICAgICAgLSBkZXNjcmlwdGlvbjogVGhlIGlu
dGVycnVwdCBiaXQgbnVtYmVyIG9yIG1vZHVsZSBpZCBhc3NvY2lhdGVkIHdpdGgNCj4gPiArICAg
ICAgICAgICAgICB0aGUgcGFydGljdWxhciBjYWNoZSBJUE1NVSBkZXZpY2UuIFRoZSBpbnRlcnJ1
cHQgYml0IG51bWJlciBuZWVkcw0KPiA+ICsgICAgICAgICAgICAgIHRvIG1hdGNoIHRoZSBtYWlu
IElQTU1VIElNU1NUUiByZWdpc3Rlci4gT25seSB1c2VkIGJ5IGNhY2hlIElQTU1VDQo+ID4gKyAg
ICAgICAgICAgICAgaW5zdGFuY2VzLg0KPiA+ICAgICAgZGVzY3JpcHRpb246DQo+ID4gICAgICAg
IFJlZmVyZW5jZSB0byB0aGUgbWFpbiBJUE1NVSBwaGFuZGxlIHBsdXMgMSBjZWxsLiBUaGUgY2Vs
bCBpcw0KPiA+IC0gICAgICB0aGUgaW50ZXJydXB0IGJpdCBudW1iZXIgYXNzb2NpYXRlZCB3aXRo
IHRoZSBwYXJ0aWN1bGFyIGNhY2hlIElQTU1VDQo+ID4gLSAgICAgIGRldmljZS4gVGhlIGludGVy
cnVwdCBiaXQgbnVtYmVyIG5lZWRzIHRvIG1hdGNoIHRoZSBtYWluIElQTU1VIElNU1NUUg0KPiA+
IC0gICAgICByZWdpc3Rlci4gT25seSB1c2VkIGJ5IGNhY2hlIElQTU1VIGluc3RhbmNlcy4NCj4g
PiArICAgICAgdGhlIGludGVycnVwdCBiaXQgbnVtYmVyIG9yIG1vZHVsZSBpZCBhc3NvY2lhdGVk
IHdpdGggdGhlIHBhcnRpY3VsYXINCj4gPiArICAgICAgY2FjaGUgSVBNTVUgZGV2aWNlLiBUaGUg
aW50ZXJydXB0IGJpdCBudW1iZXIgbmVlZHMgdG8gbWF0Y2ggdGhlIG1haW4NCj4gPiArICAgICAg
SVBNTVUgSU1TU1RSIHJlZ2lzdGVyLiBPbmx5IHVzZWQgYnkgY2FjaGUgSVBNTVUgaW5zdGFuY2Vz
Lg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAg
ICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBv
ZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZw0KPiANCj4gSW4gcGVy
c29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYg
YSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBz
YXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==
