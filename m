Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F2EA4FEBCB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Apr 2022 02:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229975AbiDMAMR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Apr 2022 20:12:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229941AbiDMAMQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Apr 2022 20:12:16 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2120.outbound.protection.outlook.com [40.107.114.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD01ADE85;
        Tue, 12 Apr 2022 17:09:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MUvXRbYsIbnG6iHxLnKKRJ1B8UBupZmQedK54z9rdIQ00oXBjuANVmjE0hwqgXWJrkQJNHYFaHsV1Bix7J+aNAHoRztQ+kqmUrKYTpT0cvSjED9ANd0Ze5iRYUcCCs0nfS5A9PuANAj6jUip/RW3yvQQ8P6ZH/FftGQfLZFiaakUVsb9DyfTcxAoZRoWsR/blwAa4VwzktQncfMWzx/wsaeHN/Opet7V/7iAaPT3Pq5u6FIc54IuRLT5lIawMM84QGLH4kLXP/JpIiVxF085S6KXWWkNxW81oQGxad5SLSHK/9Yc0/3JAlEgrCH4L03/GCmd1PEyClo8Vi5jf/CCcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pgv+bYabzIs83pZcq2Eo9DX9KK/txKQfq69KbJ7/XKg=;
 b=HqWx1Osnl653JSEbwniAjZB2lcwUqWZIPTw2Quzp3dJonKhf+HpHE/Rceg7RTD9exwwoyRWExycjMPpb/EDXhjufZdf8lHQnslsXmqh6o9/xKpxrhqKX1V9iAWX0E/8OhUvRlPCLG7WOzSXpexoT4f+c1vaKP2s1WYQrJqWwkXSfYVJgJlu8HA5UQnZRsYKQY4T9o13hNmPMMTjPZKOxRIyRRyxA7zIu84mMlJc+qV9IYK3sp+h1lcOGHWZt+2urR3J7fS7xdqUViLwLzkIA8n23y3+yT0P0kWBkVdJfzaIC7YK1xQJHhfwnqSPX1tzmiyT+VskR6hsb51N1Hk7LQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pgv+bYabzIs83pZcq2Eo9DX9KK/txKQfq69KbJ7/XKg=;
 b=dugyo/7cZk+aVLO+ZF6Ovr4rpyFfd994Uoa3beUz526tKrInHdrk2NORXXegC4kilcEukDFImqJ7vNZMP3KJd0Huh2mWGIz8dP7Fhp+09lrPhow7k82iFl1Vk1dK7LIoSm/4yh5nIBYPJF4lnevmwTh7lMRULg9CJ1Z9dvjtiCQ=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OSAPR01MB7301.jpnprd01.prod.outlook.com
 (2603:1096:604:11c::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Wed, 13 Apr
 2022 00:09:53 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::205e:c981:34d8:dbcf]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::205e:c981:34d8:dbcf%7]) with mapi id 15.20.5144.030; Wed, 13 Apr 2022
 00:09:52 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
        "avri.altman@wdc.com" <avri.altman@wdc.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>
CC:     "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 6/7] arm64: dts: renesas: r8a779f0: Add UFS node
Thread-Topic: [PATCH 6/7] arm64: dts: renesas: r8a779f0: Add UFS node
Thread-Index: AQHYTkAdDdgyY+yoV0iX2zcyeMTTEqzr/A8AgAD6jDA=
Date:   Wed, 13 Apr 2022 00:09:52 +0000
Message-ID: <TYBPR01MB534192EDF0C76F77A797187AD8EC9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20220412073647.3808493-1-yoshihiro.shimoda.uh@renesas.com>
 <20220412073647.3808493-7-yoshihiro.shimoda.uh@renesas.com>
 <b189e6fc-98b5-9668-d22c-1144d5741071@linaro.org>
In-Reply-To: <b189e6fc-98b5-9668-d22c-1144d5741071@linaro.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 67065705-1b13-4819-2203-08da1ce1eefe
x-ms-traffictypediagnostic: OSAPR01MB7301:EE_
x-microsoft-antispam-prvs: <OSAPR01MB7301667DCCB2F588A4C9E33ED8EC9@OSAPR01MB7301.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UQ3eHA4GTkWtl2Ifn1ypAc5cmEtNnlV1QFoMjP1f/s8v682UR1N5c3Cx7Eh1i7ngS3+SNIQ+HZszKpIzthqjE/PlGCG7LnWy1KBKoVqqQWurVM77Fgd62N3cPYMjFxJQnLSx9tNwkFyHW2W/rNTC+ioUVYufaok5zstEW3sM/r5e5ms8MgC0J+Z2q7zmkCUoet+7LVosBes+aoibOcVTWrgtZMPgyHFLi+mUYykzH1bkdlsbGMMVa2miXgxPZ2rHLpY3JSIJu1ZFhR0mL7Z9pkWpGXSFwjpZsh1BMR3AlZ8RE1h4NOgukXlgu18/P75qVw8ShYKrABh55G9W0aYb98kJMxDvzOV6lWZ0LyV2hj2v3Sh096Dca/h66xiL2/5zjUFf2YXoMAM419Mmm6gXUb7XFgw/cFfICrcxM5+KURYC8RabhQQGGfCSQnjvL7UePfSKMv1vo+cTWbNtHReM3cglI83kv9JUM5ErARHLPuQr09swCVMKuH5V/jqwU8IIJE94tfLXUfk7XGWWMqSlD5Ycdt/3G3DzUSrUDQt+l1w9n7e6jJ3tzbVjBs189jxwVxEjl6SbgiA9UAxjyh+XsR3cjxDaPe2xYvefMplyGfJtMrnIe4sBpjirihYVWVJRMuxRtf6pcXpzptHNnQ2g2I186RjNDTlG5KflZ7UTnGuzVbO4n+IjchUVDO3owfCfiTkLV+OEob0SvO+DzIHVcxH6qciPJK1d1FiJL0Od+1a3jFQUkQFYweIFxaceZSHABIj8tWPcrlZDyFKX53cSu9ORW65TEyjHmmg6XEeLn+E=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(76116006)(66556008)(66946007)(64756008)(66476007)(83380400001)(966005)(8676002)(4326008)(122000001)(66446008)(508600001)(110136005)(55016003)(9686003)(6506007)(53546011)(2906002)(54906003)(186003)(7696005)(316002)(7416002)(8936002)(33656002)(86362001)(38100700002)(52536014)(71200400001)(38070700005)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QjZ0RWNGNmFiZ2JEZGJmdE9Kek94WTNScGlMUEN2K3hvZzIzR0V1aXhsbGpG?=
 =?utf-8?B?SzlPSmlSczNnQlAvMStBMzJSekNPbWFjN1NhVUZyNVQvVkFZRitweFRxS29R?=
 =?utf-8?B?cTkyS0tMamxaTnQ3M1ppQUNib1dVVzNmZVA1YVpXN1RqY0M1VXpSajNOaGU4?=
 =?utf-8?B?bVFaSytwRTVRUHlrYzVlTXJMN0xSVjZ4bXFHNG5yeldqRDNaa3RsQjd3b1M2?=
 =?utf-8?B?REQ3WHgvVkxnRCs0NkFwZUQrUFZzNlpaRk9NdjBiSEQzVE5jZnpYSWdDRTdy?=
 =?utf-8?B?ZCtKVWxsYkVhYmRKa21pVlNmUklHRjU2NWdXZzk3VGxpQllRdjEyOS92dUY3?=
 =?utf-8?B?MHBwM1Z1d2N2aHBYQ05ZSk1hUG1YVWhLQWM5ekZOUE4xanBQY1FyVzQvdlZ6?=
 =?utf-8?B?QlVSV0RDVDVtUy9nTkNNMHpBN1JrVVdnM2NRcGl3OS80QlYvcGprd2tMYnhZ?=
 =?utf-8?B?WnNvUDgxeEpkQTNjYU9pUitQYXk4WXJETUdHQ0xOMzR5SlZDaHRhTW9Ua2FK?=
 =?utf-8?B?VEdvcnV3VVVjYVl5K1dxVm5sQ2piMmhFSUdYMldTbTRleWdoeTNzbndBOEdC?=
 =?utf-8?B?Und1SUErOEtWaFJMbmUwN29CZkYzRUExaXR3Tk5IdE1neXhuMmdZcS9OeHgz?=
 =?utf-8?B?Q2JOV2FXNng2RGh5cTVYdDJUcTFnSGI5YWxjTXNqNGJpci85aUJXbHlQK3o3?=
 =?utf-8?B?V3Blemg3NGh6NjR5QXAyR1l5SlRJN0Vjc2ZhK2VmdDBsMWpxeUp6NnN1NzR2?=
 =?utf-8?B?WnVxWk9qRWtpZ1NTclgyZEJWOEs0eW5KelJaT3NrUUlLbDhvQ3dYQ0pnNEVi?=
 =?utf-8?B?MlM4SXFPNkxvSXhOUGhqcXRpdEphY0J2TytvVXRuVmdUM1NJUDU1dkM1VmE1?=
 =?utf-8?B?Um84cVJJOXJqZzIxRVV1ZVZrYktNbDlqd2RNVGdxdXUxL090K0RhUlFDUFM3?=
 =?utf-8?B?cUFqL2lWclN6Z2JRK2V6Smhock81NituemhZYjY3N2ptaXpSdHN6ZHo3VGNO?=
 =?utf-8?B?LzdJTEdrYjRyeVAxcEZSQ3NEM1BvWHUzU3JReUtaN3dWcWx4b2krOWdHMW52?=
 =?utf-8?B?L3ZqUUFSckJTM1V5bmozamcxTklQWlQ5TlhaWkUwbkgrZm5zdEoxdWhtajh6?=
 =?utf-8?B?UnF2UHVsRzdKRis4OG1mdDRhMHBNeGdHcnY3TXFHdFhIZWNFcFM1dGFCMXRr?=
 =?utf-8?B?dWJXV0J6anhZcWRqaXE5MjB2bEhpNi9jMzUyZERFeCt4Zzl3VjA4WncxaktU?=
 =?utf-8?B?Rm9BQ3o1aEluN1RPRk5mS0R1bHBWUGgvTUlYNlpQaU1Hd0FlVWJvRDNhcXlX?=
 =?utf-8?B?aWJkdjdxYll3Z1pOVjlpbmNBSUtwamdHQ0JVSFZkYytIeG85NUxUS3dPcUVV?=
 =?utf-8?B?K2o5L0wwRmJmVXl3YXFQVWo2d2EyTHZjYW1sSnYzR0ozdTd0WWpMM0xBTkZx?=
 =?utf-8?B?SUtnUjZXNG9rVUVsUWl1aEpITDBvdTEvRURNeWNSdTArbTBkS1N0ZE54aDM0?=
 =?utf-8?B?bW5MZVhlWHpzbG5WSzZBeUorZzVlS1poR0FSQXVNNDd1blY5VU9Na2dHT3JW?=
 =?utf-8?B?Z1lEc2RvV2RyMlg4d0xhdjY0alJDVjZSd2pGVTQyOTJ0RUZXYjlFSVl1M1lF?=
 =?utf-8?B?RDkwNlF0V1F4NzlRZUZVUS93U01uTnd6b2V5Slp2NzZWRGRiSjFCK3lId0Jz?=
 =?utf-8?B?OVdrVjJJQVJSRHBpQXprL0RrYTg0eUVKOTkxUTBITkRUZzdTSENEakQ5UGti?=
 =?utf-8?B?NXFHakdpU0NoV2VmTnhtdkF6aVhpNUV0S0pTYTBDWitYUFdpZm9HOGM1NG5z?=
 =?utf-8?B?NGFrOWtjaklWUVJKbEMvZ1dhZDhHaFcrWHBpa2R0NGU4TEdnYURzc1dCaEhv?=
 =?utf-8?B?dUYwTmczSzZhKzMxSStGcktjWVF0TmNLOUdTN0hOOW4wdWZSY2d1eEhOeks3?=
 =?utf-8?B?Q1hVVy9PQVI0eGRRRndJM0dVcURLQTdqbHFVVGZLQ1MxQ0cyakhSZ29kb3RW?=
 =?utf-8?B?djdaQ1BLZ2dxL0Zzc3lRTzVmZW5Odmo4Rk55dFBaMmxEbmJWTVVMZWxRR3Nx?=
 =?utf-8?B?U3BmcVNndS8vTjhDdnRDbnRhZVBwdUEvTWxzdmxXL1IyN0pmWERITFRrZG50?=
 =?utf-8?B?ZDZiZ0QvRGtPYjBnQlJCaUI1U085SUExMzgyOFA2QnVSZlBKMHhuemI0WjdS?=
 =?utf-8?B?NHVuQzhVVi84cFhYbEhnajlzRFFCUEJGTlhJcmVTYmdqeStjUC9tWEdOdWZn?=
 =?utf-8?B?V21KNk9OYkVZWGVHMGpyVHZHZGI3L1g0VEpEY1cxTzZmVHRwM0RVakFZbTZN?=
 =?utf-8?B?QUpuemtsN3JHdkZ6d3pkaWs0L1ppbm1UbmNCWUFwVjFDblFsVkcvZ0xaQ2Nw?=
 =?utf-8?Q?/CfSkGQqZ0mm95+N9ODPrTo61M+YAG/VwtThRXV3p1SD1?=
x-ms-exchange-antispam-messagedata-1: p7S0AcuHWTFsNrd3q04OcWVYYBq/LLON50M=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67065705-1b13-4819-2203-08da1ce1eefe
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2022 00:09:52.8573
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q+MmEy7rXYyVjcTsVqGRfpfJT6nIhRF3QxqG//HDmfm86Vrl/Byd8+H/TiApNbZige2ZEHbb9Y5JJ5FeSNz11AVsLtnBydZc0EzhJSOpVVJnvkike+MzrHF2CuF/cTI7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7301
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgS3J6eXN6dG9mLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0KDQo+IEZyb206IEty
enlzenRvZiBLb3psb3dza2ksIFNlbnQ6IFR1ZXNkYXksIEFwcmlsIDEyLCAyMDIyIDY6MDQgUE0N
Cj4gDQo+IE9uIDEyLzA0LzIwMjIgMDk6MzYsIFlvc2hpaGlybyBTaGltb2RhIHdyb3RlOg0KPiA+
IEFkZCBVRlMgbm9kZSBmb3IgUi1DYXIgUzQtOCAocjhhNzc5ZjApLg0KPiA+DQo+ID4gU2lnbmVk
LW9mZi1ieTogWW9zaGloaXJvIFNoaW1vZGEgPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMu
Y29tPg0KPiA+IC0tLQ0KPiA+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5ZjAu
ZHRzaSB8IDE5ICsrKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE5IGlu
c2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQNCj4gDQo+IFRoYW5rIHlvdSBmb3IgeW91
ciBwYXRjaC4gVGhlcmUgaXMgc29tZXRoaW5nIHRvIGRpc2N1c3MvaW1wcm92ZS4NCj4gDQo+ICBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzlmMC5kdHNpDQo+IGIvYXJjaC9hcm02
NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OWYwLmR0c2kNCj4gPiBpbmRleCBiMDI0MWFhMjlmYzgu
LjhiZjQxOGE0MjMyZiAxMDA2NDQNCj4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVz
YXMvcjhhNzc5ZjAuZHRzaQ0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9y
OGE3NzlmMC5kdHNpDQo+ID4gQEAgLTQwLDYgKzQwLDEzIEBAIGV4dGFscl9jbGs6IGV4dGFsciB7
DQo+ID4gIAkJY2xvY2stZnJlcXVlbmN5ID0gPDA+Ow0KPiA+ICAJfTsNCj4gPg0KPiA+ICsJdWZz
MzBfY2xrOiB1ZnMzMF9yZWZjbGtfdiB7DQo+IA0KPiBObyB1bmRlcnNjb3JlcyBpbiBub2RlIG5h
bWVzLiBOb2RlIG5hbWVzIHNob3VsZCBiZSBnZW5lcmljLCBzbyBpZiB5b3UNCj4gaW5zaXN0IG9u
IHByZWZpeCwgaXQgY291bGQgYmUgInVmczMwLWNsayIuDQoNCkkgZ290IGl0LiBJJ2xsIGZpeCBp
dC4NCg0KPiA+ICsJCWNvbXBhdGlibGUgPSAiZml4ZWQtY2xvY2siOw0KPiA+ICsJCSNjbG9jay1j
ZWxscyA9IDwwPjsNCj4gPiArCQkvKiBUaGlzIHZhbHVlIG11c3QgYmUgb3ZlcnJpZGRlbiBieSB0
aGUgYm9hcmQgKi8NCj4gPiArCQljbG9jay1mcmVxdWVuY3kgPSA8MD47DQo+ID4gKwl9Ow0KPiA+
ICsNCj4gPiAgCXBtdV9hNTUgew0KPiA+ICAJCWNvbXBhdGlibGUgPSAiYXJtLGNvcnRleC1hNTUt
cG11IjsNCj4gPiAgCQlpbnRlcnJ1cHRzLWV4dGVuZGVkID0gPCZnaWMgR0lDX1BQSSA3IElSUV9U
WVBFX0xFVkVMX0xPVz47DQo+ID4gQEAgLTI1OCw2ICsyNjUsMTggQEAgaTJjNTogaTJjQGU2NmUw
MDAwIHsNCj4gPiAgCQkJc3RhdHVzID0gImRpc2FibGVkIjsNCj4gPiAgCQl9Ow0KPiA+DQo+ID4g
KwkJdWZzOiBzY3NpQGU2ODYwMDAwIHsNCj4gDQo+IE5vZGUgbmFtZTogdWZzIChpdCBpcyBub3Qg
YSBTQ1NJIGRldmljZSwgQUZBSUspLg0KDQpJIGdvdCBpdC4gSSdsbCBmaXggaXQuDQooSSBoYWQg
YXNzdW1lZCB0aGF0IHdlIHNob3VsZCBjaG9vc2UgYSBub2RlIG5hbWUgZnJvbSAiMi4yLjIgR2Vu
ZXJpYyBOYW1lcw0KIFJlY29tbWVuZGF0aW9uIiBvZiB0aGUgZVBBUFIgdjEuMSBbMV0uIEJ1dCwg
dGhhdCdzIHdyb25nLiApDQoNClsxXQ0KaHR0cHM6Ly9lbGludXgub3JnL2ltYWdlcy9jL2NmL1Bv
d2VyX2VQQVBSX0FQUFJPVkVEX3YxLjEucGRmDQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBT
aGltb2RhDQoNCj4gPiArCQkJY29tcGF0aWJsZSA9ICJyZW5lc2FzLHI4YTc3OWYwLXVmcyI7DQo+
ID4gKwkJCXJlZyA9IDwwIDB4ZTY4NjAwMDAgMCAweDEwMD47DQo+ID4gKwkJCWludGVycnVwdHMg
PSA8R0lDX1NQSSAyMzUgSVJRX1RZUEVfTEVWRUxfSElHSD47DQo+ID4gKwkJCWNsb2NrcyA9IDwm
Y3BnIENQR19NT0QgMTUxND4sIDwmdWZzMzBfY2xrPjsNCj4gPiArCQkJY2xvY2stbmFtZXMgPSAi
ZmNrIiwgInJlZl9jbGsiOw0KPiANCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo=
