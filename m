Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F24B6285C5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Nov 2022 17:45:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237904AbiKNQo7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Nov 2022 11:44:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237906AbiKNQo6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2022 11:44:58 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2119.outbound.protection.outlook.com [40.107.113.119])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E364C2F023;
        Mon, 14 Nov 2022 08:44:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cav5F9XdxP4Pg67qSPyNVDNozWHSKN/Cyz9zis+Y6S43ilwZ14DlnD4PAeuhfr2n1TxVV/wQqG92SjwsT3o/iP1u3EYKjEaUWGsKZ/6gpKliAg7FIjlq3NyFQATFO2cucrYU6YOX50O38WWBixFH/Mb/VOiViDpmQPy6MTy87xpqYT2nVoTWaXkd4RskvrlXchw1uEdH+2ytY3sIxgbEYYYtegobEAhkJXNKN3qQWfQl1ouxMcD9cKi/W42jj+9Oqs1aaZua6Vm3ulCDf2H3wLiVTYHdiFaK+AkxmfBiddycNdGBsRgGcx6wvbOgFNOfHkshuW4Bn6FKWtmk6Eab3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o08WNLciHRMBEFAy+o7qAMOm/r6dqnLFy0NMuWhBLvc=;
 b=dNpjnATgsvp6RthDovJLUWDUtLjVVZZLL/wZQ9Zh3PgbxaOgRM0EXFmY4sU9P2VHqAeXInqXmpRDBys1wi96oNZlDyV7yMmObB9YwMfst/+v0koa8qdBTTD/dmd6Bm1wot7Rn8RIOD2549Q7Y9USGVF63nxeRKNTTddr1Uc76Bmw2UlwJ4HmQ0v0gweZpOXKCZj76EnN0qEaMzK3t7MRmvKBYKrAg0KlRFScIU/HTjOOi63btPFTXuvlkdPBdiQRcO2qrRFcOLsho7272+sa6HRBT1UKsbL/UlQUC+pwRaz/iHn04gWfo7Qhf9ZaaTof85ctyfQWkchfyuJuSYOr0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o08WNLciHRMBEFAy+o7qAMOm/r6dqnLFy0NMuWhBLvc=;
 b=izIT6s6HUufWwJ3MoCCyW5gzCxXxtMSq6N3sXt/WHvYgCG/YdRgSGkUXk4N2YNbZX0IN683pVU2PmEINworHtOaNS9VcAhR7BYjFHLIgyYiFQ7MrWUCoDDFxz9MAmOGe67J26t6ZjBdRN1L3wM3FoiHX3p86dCmJK2WGUh/nSAs=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB8332.jpnprd01.prod.outlook.com (2603:1096:400:161::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 16:44:53 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::5b24:f581:85bd:6ce2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::5b24:f581:85bd:6ce2%3]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 16:44:53 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Phil Edworthy <phil.edworthy@renesas.com>,
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
Thread-Index: AQHY9SCBIuQl3m8nV0Kf1Ch8X1TBHq45ZpOAgAAH2aCAAB6FgIAABS+ggAUMRDCAAAS2gIAAAUsg
Date:   Mon, 14 Nov 2022 16:44:53 +0000
Message-ID: <OS0PR01MB59226FC7CA88208AB5C0AED586059@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20221110162126.103437-1-biju.das.jz@bp.renesas.com>
 <20221110162126.103437-2-biju.das.jz@bp.renesas.com>
 <ae35fd75-64d3-3ab9-8cc0-3cbcc9c34b78@linaro.org>
 <OS0PR01MB59229179DE3D3D00C4963F3186009@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <a7bbfdd1-1abd-2ee5-1d32-47d0bcb7e1f2@linaro.org>
 <OS0PR01MB5922863B8EC8DF54D8E881FE86009@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922C8A590502C8820B05A7186059@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <839d9740-e814-897e-d484-ded3d531a97a@linaro.org>
In-Reply-To: <839d9740-e814-897e-d484-ded3d531a97a@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB8332:EE_
x-ms-office365-filtering-correlation-id: cc472296-5910-4bf4-eb42-08dac65f8e24
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2jKEvJW8QTQHoEZcyKfpLbNffImQLHm+9VuQ8rs0kV/SxBzZmZfhKfYf5k4ZdqQvsDsHBgcYnnzxU6GHXAQRWGHLm1j6KInMKwvulhIbk6bnmFcwgNqmCs26Iw+LT3RUyxYXkSw34Fmx2EVARPIcJzI8Nz32HgNN9tR6jItV0rMMovVE54B3eA01Zt2hYN/SaWfmRuvXiCKDccVXHnIx/XEKrjImxW+UtT+GIo+ck2vevMYZHbuleRs413fDM2lJRysu/zKaOpSDjaknk3VfKCQQj5kVO/mSAMJqCF/eRNOnJWqlhfxdMvGRi3RReHnuOOPFncEf2XXxltmqudcRAU+AfCtXIE1R7AifFGQpR4S7yZvtOg7fD9PFFPMciMVGLR5dcmKt9zo7L0CRzBymLFLXU7dCBu0TccuFjW59ZfcbnnEvGt/XE0vLPbSAmvEqKkuw8Da1hb3J6XSQ8d+fy8630bhDWwE5fV5QD7zoQtlcGExnijrRcr225E579NH6w2rOPoKD6r7/Z838+kl2/EXZWKDhhXuQ8pzw9quBdcYARy4Jou1eu/Wmb7p6QXSk7T6XLivX8e15TD3EpTy8SrvjVCnJytFvulx1BQbDsD6uaDF3K2swrS2O+G0qLBjDOP9HO+iBP5q0tUmClHSaYuCGlst8iO5IeD2Vv4luBvv/No+NK71RzEazUsSlLAjs6PcbJ1GfuxOCQgKyqi3Mr0fW3LWYTNen8/OUtg8Bfabdc6hkJcJ5ZhbeUOqr9ZiS+1B81MBTd8TJBFHxo1lWkA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(451199015)(107886003)(71200400001)(478600001)(54906003)(110136005)(186003)(8936002)(52536014)(6506007)(41300700001)(26005)(2906002)(7696005)(5660300002)(53546011)(316002)(66446008)(9686003)(4326008)(66556008)(66946007)(64756008)(8676002)(66476007)(76116006)(83380400001)(33656002)(86362001)(55016003)(38100700002)(38070700005)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OURFMVV3MERNVlhFdHBkVG1sZUR0Q2E4Y081c0hVK29JQmpzcUNXdEpYSGM0?=
 =?utf-8?B?Y0c1RzZTMVFyTFNHUHc4ZU55TUFWTlpmYjd5SEd4T3p5QzlBSVAySkNQc1ov?=
 =?utf-8?B?ZjI0STR2akFZWTBmY0p0OFJ6Y0QzNjdESEFETG9OeWI2cDk4ZTV3MUVnYzRk?=
 =?utf-8?B?T25sMVFscnREMjUwQzBRWTY5UjB6ZEZuVkFLQ3lRZVRyVVF6THduaHAxRkJm?=
 =?utf-8?B?cVVZMlhxdFdpN29UbENsY0JqTlJtVnkyRzZnTTJxUHl4b2xHVzhUVkd4ZWVX?=
 =?utf-8?B?cXBYd0NvNTlkendtNzBwYVV1eWc3WWJsOHEvalAyZGZ1M0IyNzE1V0lzM2xY?=
 =?utf-8?B?S0UzSENneUpzRkpVbVNESDNtYStWMVZLWUt0YVpNUEVMNGdBMVJkNFU3WUJN?=
 =?utf-8?B?ZkVXVFRvOU0wZ0krQTNXY3JhdEorR1l0ZElWZmFBRWcweDB4SEswaVBrRHJM?=
 =?utf-8?B?KzZQbzZkNTVjUmZJRVQ2c3BFdUZ0NUJNVk8yemRMQWZBZU1ram4yQVVZMVVU?=
 =?utf-8?B?bDgrSXkwVFBlQWw1dEFrbDJGSDV3SHdwbERuR1NJZEZyam1vdDduNGV3YTB0?=
 =?utf-8?B?YjBiUkVDdnFqdi81MmUxc3FPbzZxc3JGQnJjd2pzYXgzbVRDWUVNcFNRcDMy?=
 =?utf-8?B?L1BZdWhpcHd5RTcvUW9ZSml0Q3NPQUlpRjRhaEQwNWZMKytON3NDbFlaT0pB?=
 =?utf-8?B?SExob3E1cGNQdmhGdDRUcWY2UGsvMklEQi9Fbmt1eS9sNGwrQmJhc3k5SGpE?=
 =?utf-8?B?WTRKZFhkMGtjbHQzd2FoZjVuQVU0S3BGTlZWckJ2TkdJU3hFTWZYcm8yakxv?=
 =?utf-8?B?VmZUcEJmSHlXeTJyUGQ1eVU0ZjM2NlVpeG1PYTNkY2g1Zmk2cCtuNzlJWnVa?=
 =?utf-8?B?eUdhTmt4cUJQWkRWQVU5Rm55c0tIRmd5aFlJWlk3OWIrVVB3Yy9namZWdDNj?=
 =?utf-8?B?UU5GVDN3eURDR2JXejJNU1BRYUE2bnluQVhMWmdldkFpaHdaUU8yNnc0WnhJ?=
 =?utf-8?B?N3Z1dkRYbitRdnZzOUtpOU5RL0pQTXpyVDNXWlVKNUYyenBEdjVkeVArL0Fq?=
 =?utf-8?B?QlRHTCtoTXovWmlwaU9hdnFPTTZyNXIxS2RteTJ2RkFTMUprM1JCSC9PVkR3?=
 =?utf-8?B?UHRCZ3M0L3RMTHJiWmp4KzhuS09yMmpHZmR3alcyUTlRd2RVdEZ1T3N4K0Rs?=
 =?utf-8?B?dmRVRUdBa1gzRVNjUVloOEU0VUl1bWdKNkgwdG9CaWZOSzJNcXJSTmQyR2dT?=
 =?utf-8?B?R05PNkxPaWsvb1lpbG9oeFFWcXFKVjNxelNTVG93U0M3OEFhRTFpbk1vTjZT?=
 =?utf-8?B?cktBTDJzM2lRRERzYWlJK0JQMHJSa2NDUlkvMklDeVZjUWZBcGZiSFg2ajVF?=
 =?utf-8?B?cVNYMDlzZUZQbzkvdlJNMktVdWZNVDhqOHczSlJneThvN1ZkSStWbDI1cUZ1?=
 =?utf-8?B?Y3pFNWMySUhuUkJQSk9Ia3d5SERnUzl6YVBnL1krcEp3OE0vWjVjVVRQZVZn?=
 =?utf-8?B?YzNEWWZDSDRwRW1XMndGeE8wZXU3cnNHTUJYelBNS1lnZ0VrRzFYUlo5dGVa?=
 =?utf-8?B?Q2gxTXZsSEJqUzRmdzBVZFdtSzNCbUYzZDNXNWhxaG5GVUF3K0lod2VWUjFE?=
 =?utf-8?B?VTdQa0MyYU85NWNNeTRLd1E1MW5lbTQ0N0dBUGMwQzVXNnMrbHAyeTJrNEl0?=
 =?utf-8?B?N1hVWnphK3hHSHRsR0xmQVBCaWdqR0RocUxyancvYlhYaTNybmU5bnhENFVr?=
 =?utf-8?B?WDdOaUNGQmFWZEVtM05zY1NLbGxTV3BPYW1ZZW9pZWVCYm9QSEVCU0dFQkVJ?=
 =?utf-8?B?TEN4VGxUM1dvYjdUVk1HaWRlaTFXK3RldWVxVFVoeVIvOGlUbWdqb1FRcDJp?=
 =?utf-8?B?aTYrS05ZREZpQTdJWVNCa1M3ZkZRVHZlbE4rRkRwclRJOXczQWlQbGZaYnA0?=
 =?utf-8?B?VWNobS9JVFl4VFkxOFk4WEsrYmdXd2pMQjFJUVVEK1E3ck5ETmhtSUdWYVdK?=
 =?utf-8?B?Q0x3ZzlLdUMyZDlObVZORmJVcGNKTCtyRFhBc3JqVEJDb0w1UnpyVWNYblA0?=
 =?utf-8?B?MjRrdnVyOWc0cThPaUJ6WnZRRXhxbWN4UHlzb2txZ3pQaW1PWStlcWl3UGlv?=
 =?utf-8?B?THM3QlkrV1o4MS9LRGVnQW03ZERQclBXdlZ2Tzk2aFFoRW5TSldzQzJLWHlo?=
 =?utf-8?B?QWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc472296-5910-4bf4-eb42-08dac65f8e24
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2022 16:44:53.5167
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l51J1zO2lCed6/rYiZ3A0B7PioeQ1AzCCq61Zw3/LckY80S/hN352LKSXzLicPVFtDvR7Gb3wEIRY5raAYj2Eq6VKRg/QVUj84l7sDPH2oM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8332
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPg0KPiBTZW50OiAxNCBOb3ZlbWJl
ciAyMDIyIDE2OjMyDQo+IFRvOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
OyBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPjsNCj4gS3J6eXN6dG9mIEtvemxvd3Nr
aSA8a3J6eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3JnPjsgR2VlcnQgVXl0dGVyaG9ldmVu
DQo+IDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gQ2M6IFBoaWwgRWR3b3J0aHkgPHBoaWwu
ZWR3b3J0aHlAcmVuZXNhcy5jb20+OyBNYWdudXMgRGFtbQ0KPiA8bWFnbnVzLmRhbW1AZ21haWwu
Y29tPjsgbGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnOw0KPiBkZXZpY2V0cmVlQHZn
ZXIua2VybmVsLm9yZzsgQ2hyaXMgUGF0ZXJzb24gPENocmlzLlBhdGVyc29uMkByZW5lc2FzLmNv
bT47DQo+IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvLmp6QHJlbmVzYXMuY29tPg0K
PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDEvM10gZHQtYmluZGluZ3M6IGFybTogcmVuZXNhczog
RG9jdW1lbnQgUmVuZXNhcw0KPiBSWi9WMk0gU3lzdGVtIENvbmZpZ3VyYXRpb24NCj4gDQo+IE9u
IDE0LzExLzIwMjIgMTc6MTgsIEJpanUgRGFzIHdyb3RlOg0KPiA+IEhpIEFsbCwNCj4gPg0KPiA+
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBCaWp1IERhcw0KPiA+PiBT
ZW50OiAxMSBOb3ZlbWJlciAyMDIyIDExOjE3DQo+ID4gID4NCj4gPj4+IE9uIDExLzExLzIwMjIg
MTA6MDYsIEJpanUgRGFzIHdyb3RlOg0KPiA+Pj4+IEhpIEtyenlzenRvZiBLb3psb3dza2ksDQo+
ID4+Pj4NCj4gPj4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4+Pj4gRnJvbTog
S3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPg0KPiA+
Pj4+PiBTZW50OiAxMSBOb3ZlbWJlciAyMDIyIDA4OjM0DQo+ID4+Pj4+IFRvOiBCaWp1IERhcyA8
YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+OyBSb2IgSGVycmluZw0KPiA+Pj4+PiA8cm9iaCtk
dEBrZXJuZWwub3JnPjsgS3J6eXN6dG9mIEtvemxvd3NraQ0KPiA+Pj4+PiA8a3J6eXN6dG9mLmtv
emxvd3NraStkdEBsaW5hcm8ub3JnPg0KPiA+Pj4+PiBDYzogUGhpbCBFZHdvcnRoeSA8cGhpbC5l
ZHdvcnRoeUByZW5lc2FzLmNvbT47IEdlZXJ0IFV5dHRlcmhvZXZlbg0KPiA+Pj4+PiA8Z2VlcnQr
cmVuZXNhc0BnbGlkZXIuYmU+OyBNYWdudXMgRGFtbSA8bWFnbnVzLmRhbW1AZ21haWwuY29tPjsN
Cj4gPj4+Pj4gbGludXgtIHJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJlZUB2
Z2VyLmtlcm5lbC5vcmc7DQo+ID4+Pj4+IENocmlzIFBhdGVyc29uIDxDaHJpcy5QYXRlcnNvbjJA
cmVuZXNhcy5jb20+OyBGYWJyaXppbyBDYXN0cm8NCj4gPj4+Pj4gPGZhYnJpemlvLmNhc3Ryby5q
ekByZW5lc2FzLmNvbT4NCj4gPj4+Pj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAxLzNdIGR0LWJp
bmRpbmdzOiBhcm06IHJlbmVzYXM6IERvY3VtZW50DQo+ID4+Pj4+IFJlbmVzYXMgUlovVjJNIFN5
c3RlbSBDb25maWd1cmF0aW9uDQo+ID4+Pj4+DQo+ID4+Pj4+IE9uIDEwLzExLzIwMjIgMTc6MjEs
IEJpanUgRGFzIHdyb3RlOg0KPiA+Pj4+Pj4gRnJvbTogUGhpbCBFZHdvcnRoeSA8cGhpbC5lZHdv
cnRoeUByZW5lc2FzLmNvbT4NCj4gPj4+Pj4+DQo+ID4+Pj4+PiBBZGQgRFQgYmluZGluZyBkb2N1
bWVudGF0aW9uIGZvciBTeXN0ZW0gQ29uZmlndXJhdGlvbiAoU1lTKSBmb3VuZA0KPiA+Pj4+Pj4g
b24gUlovVjJNIFNvQydzLg0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IFNZUyBibG9jayBjb250YWlucyB0
aGUgU1lTX1ZFUlNJT04gcmVnaXN0ZXIgd2hpY2ggY2FuIGJlIHVzZWQgdG8NCj4gPj4+Pj4+IHJl
dHJpZXZlIFNvQyB2ZXJzaW9uIGluZm9ybWF0aW9uLg0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IFNpZ25l
ZC1vZmYtYnk6IFBoaWwgRWR3b3J0aHkgPHBoaWwuZWR3b3J0aHlAcmVuZXNhcy5jb20+DQo+ID4+
Pj4+PiBbYmlqdTogVXBkYXRlZCB0aGUgZXhhbXBsZSBdDQo+ID4+Pj4+PiBTaWduZWQtb2ZmLWJ5
OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4+Pj4+PiAtLS0NCj4g
Pj4+Pj4+IHYxLT52MjoNCj4gPj4+Pj4+ICAqIE1vdmVkIHRoZSBmaWxlIGZyb20gYXJtLT5zb2Mv
cmVuZXNhcw0KPiA+Pj4+Pj4gICogVXBkYXRlZCB0aGUgcGF0aCBmb3IgYmluZGluZyBmaWxlDQo+
ID4+Pj4+PiAgKiBVcGRhdGVkIHRoZSBleGFtcGxlDQo+ID4+Pj4+PiAtLS0NCj4gPj4+Pj4+ICAu
Li4vc29jL3JlbmVzYXMvcmVuZXNhcyxyenYybS1zeXMueWFtbCAgICAgICAgfCAzOQ0KPiArKysr
KysrKysrKysrKysrKysrDQo+ID4+Pj4+PiAgMSBmaWxlIGNoYW5nZWQsIDM5IGluc2VydGlvbnMo
KykgIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+Pj4+Pj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3NvYy9yZW5lc2FzL3JlbmVzYXMscnp2Mm0tc3lzLnkNCj4gPj4+Pj4+IGENCj4g
Pj4+Pj4+IG1sDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gZGlmZiAtLWdpdA0KPiA+Pj4+Pj4gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL3JlbmVzYXMvcmVuZXNhcyxyenYybS1z
eXMuDQo+ID4+Pj4+PiB5YQ0KPiA+Pj4+Pj4gbWwNCj4gPj4+Pj4+IGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3NvYy9yZW5lc2FzL3JlbmVzYXMscnp2Mm0tc3lzLg0KPiA+Pj4+
Pj4geWENCj4gPj4+Pj4+IG1sDQo+ID4+Pj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+Pj4+
Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi5jYzQxNzQ3Nzk4ZTINCj4gPj4+Pj4+IC0tLSAvZGV2L251
bGwNCj4gPj4+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2Mv
cmVuZXNhcy9yZW5lc2FzLHJ6djJtLXN5cy4NCj4gPj4+Pj4+ICsrKyB5YW1sDQo+ID4+Pj4+DQo+
ID4+Pj4+IEZpbGVuYW1lIHNob3VsZCBiZSBiYXNlZCBvbiB0aGUgY29tcGF0aWJsZS4gUHJldHR5
IG9mdGVuIHNvbWUNCj4gPj4+Pj4gY29tbW9uIHBhcnRzIG9mIGJvdGggYXJlIGZpbmUgKGUuZy4g
d2hlbiBmaWxlIGNvbnRhaW5zIG11bHRpcGxlDQo+ID4+Pj4+IGNvbXBhdGlibGVzKSwgYnV0IHRo
aXMgdmVyeSBkaWZmZXJlbnQgdGhlbiB3aGF0IEkgc2VlIGJlbG93Lg0KPiA+Pj4+DQo+ID4+Pj4g
V2UgcGxhbiB0byB1cHN0cmVhbSBhbm90aGVyIHNpbWlsYXIgU29DLCBSWi9WMk1BIHdoaWNoIGhh
cyBzaW1pbGFyDQo+ID4+Pj4gSVAsIHNvIHdlIG1heSBuZWVkIHRvIGFkZCBnZW5lcmljIGNvbXBh
dGlibGUgcnp2Mm0tc3lzLiBJIGFtDQo+ID4+Pj4gY2hlY2tpbmcgd2l0aCBIVyBwZW9wbGUgdG8g
Z2V0IG1vcmUgaW5mbyBhYm91dCBSWi9WMk1BLg0KPiA+Pj4+DQo+ID4+Pj4+DQo+ID4+Pj4+PiBA
QCAtMCwwICsxLDM5IEBADQo+ID4+Pj4+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQ
TC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpICVZQU1MDQo+ID4+Pj4+PiArMS4yDQo+ID4+Pj4+
PiArLS0tDQo+ID4+Pj4+PiArJGlkOg0KPiA+Pj4+PiAiDQo+ID4+Pj4gIg0KPiA+Pj4+Pj4gKyRz
Y2hlbWE6DQo+ID4+Pj4+ICINCj4gPj4+PiAiDQo+ID4+Pj4+DQo+ID4+Pj4+IERyb3AgcXVvdGVz
IGZyb20gYm90aC4NCj4gPj4+Pg0KPiA+Pj4+IE9LLg0KPiA+Pj4+DQo+ID4+Pj4+DQo+ID4+Pj4+
PiArDQo+ID4+Pj4+PiArdGl0bGU6IFJlbmVzYXMgUlovVjJNIFN5c3RlbSBDb25maWd1cmF0aW9u
IChTWVMpDQo+ID4+Pj4+PiArDQo+ID4+Pj4+PiArbWFpbnRhaW5lcnM6DQo+ID4+Pj4+PiArICAt
IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+ID4+Pj4+PiAr
DQo+ID4+Pj4+PiArZGVzY3JpcHRpb246DQo+ID4+Pj4+PiArICBUaGUgUlovVjJNIFN5c3RlbSBD
b25maWd1cmF0aW9uIChTWVMpIHBlcmZvcm1zIHN5c3RlbSBjb250cm9sDQo+ID4+Pj4+PiArb2Yg
dGhlIExTSQ0KPiA+Pj4+Pj4gKyAgYW5kIHN1cHBvcnRzIHRoZSBmb2xsb3dpbmcgZnVuY3Rpb25z
LA0KPiA+Pj4+Pj4gKyAgLSBMU0kgdmVyc2lvbg0KPiA+Pj4+Pj4gKyAgLSAzNC1iaXQgYWRkcmVz
cyBzcGFjZSBhY2Nlc3MgZnVuY3Rpb24NCj4gPj4+Pj4+ICsgIC0gUENJZSByZWxhdGVkIHNldHRp
bmdzDQo+ID4+Pj4+PiArICAtIFdEVCBzdG9wIGNvbnRyb2wNCj4gPj4+Pj4+ICsgIC0gVGVtcGVy
YXR1cmUgc2Vuc29yIChUU1UpIG1vbml0b3INCj4gPj4+Pj4+ICsNCj4gPj4+Pj4+ICtwcm9wZXJ0
aWVzOg0KPiA+Pj4+Pj4gKyAgY29tcGF0aWJsZToNCj4gPj4+Pj4+ICsgICAgY29uc3Q6IHJlbmVz
YXMscjlhMDlnMDExLXN5cw0KPiA+Pj4+Pj4gKw0KPiA+Pj4+Pj4gKyAgcmVnOg0KPiA+Pj4+Pj4g
KyAgICBtYXhJdGVtczogMQ0KPiA+Pj4+Pj4gKw0KPiA+Pj4+Pj4gK3JlcXVpcmVkOg0KPiA+Pj4+
Pj4gKyAgLSBjb21wYXRpYmxlDQo+ID4+Pj4+PiArICAtIHJlZw0KPiA+Pj4+Pj4gKw0KPiA+Pj4+
Pj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+Pj4+Pj4gKw0KPiA+Pj4+Pj4gK2V4
YW1wbGVzOg0KPiA+Pj4+Pj4gKyAgLSB8DQo+ID4+Pj4+PiArICAgIHN5c2M6IHN5c3RlbS1jb25m
aWd1cmF0aW9uQGEzZjAzMDAwIHsNCj4gPj4+Pj4NCj4gPj4+Pj4gSWYgSSBnZXQgcHJvcGVybHkg
dGhlIHB1cnBvc2Ugb2YgdGhlIGRldmljZSwgdXN1YWxseSB0aGlzIGlzDQo+ID4+Pj4+IGNhbGxl
ZA0KPiA+Pj4+PiAic3lzdGVtLSBjb250cm9sbGVyIi4gVXNlIHRoYXQgYXMgZGV2aWNlIG5vZGUu
DQo+ID4+Pj4NCj4gPj4+PiBUaGUgaGFyZHdhcmUgbWFudWFsIG1lbnRpb25zIHRoZSBiZWxvdy4g
U28gd2FudCB0byBjb25zaXN0ZW50IHdpdGgNCj4gPj4+PiBIVw0KPiA+Pj4gbWFudWFsLg0KPiA+
Pj4NCj4gPj4+IElmIHRoZSBoYXJkd2FyZSBtYW51YWwgc2FpZCB0aGlzIGlzIGNhbGxlZCAiZm9v
LXdoYXRldmVyLW5hbWUiIG9yDQo+ID4+PiAicno4NTczNmRmbngyIiwgeW91IHdvdWxkIHVzZSBp
dCBhcyB3ZWxsPw0KPiA+Pj4NCj4gPj4+IE5vZGUgbmFtZXMgc2hvdWxkIGJlIGdlbmVyaWMuDQo+
ID4NCj4gPiBJIGdvdCB0aGUgZm9sbG93aW5nIGZlZWRiYWNrIGZyb20gTFNJIHRlYW0uDQo+ID4N
Cj4gPiAqVGhlIHJlYXNvbiB3aHkgd2UgdXNlICJjb25maWd1cmF0aW9uIiBhbmQgbm90ICJjb250
cm9sbGVyIiBpcyB0aGUNCj4gPiBwb3NzaWJpbGl0eSB0aGF0IHVzZXJzIG1pZ2h0IHRha2UgaXQg
dG8gbWVhbiAiY29udHJvbCIgb2Ygc3lzdGVtDQo+ID4gb3BlcmF0aW9uIChwcm9kdWN0IG9wZXJh
dGlvbikuIFRoaXMgdW5pdCBkZXRlcm1pbmVzIGhvdyB0aGUgd2hvbGUgTFNJDQo+IGNvbmZpZ3Vy
ZSB0byBvcGVyYXRlIExTSSwgc28gd2UgdXNlICJjb25maWd1cmF0aW9uIiBmb3IgdGhpcyBJUCBu
YW1lLg0KPiA+DQo+ID4gQXMgcGVyIHRoaXMgaXQgaXMgbm90IGEgY29udHJvbGxlci4gSXQgaXMg
YSBDb25maWd1cmF0aW9uIElQLg0KPiA+DQo+ID4gV2hhdCBzaG91bGQgYmUgZ2VuZXJpYyBub2Rl
IG5hbWUgZm9yIHN5c3RlbSBjb25maWd1cmF0aW9uIElQPw0KPiANCj4gVGhlbiBpdCdzIGNsb3Nl
ciB0byBjaGlwaWQgYW5kIHNob3VsZCBiZSBpbiBod2luZm8/DQoNCllvdSBtZWFuLCBzeXM6IGh3
aW5mb0BhM2YwMzAwMCBpbnN0ZWFkIG9mIHN5czogc3lzdGVtLWNvbmZpZ3VyYXRpb25AYTNmMDMw
MDAgPz8NCg0KQWxzbyB0aGUgc2FtZSBJUCBibG9jayBpcyBwcmVzZW50IG9uIHJ6L3YybWEgYXMg
d2VsbD8NCg0KU2hhbGwgSSB1c2UgdGhlIHNhbWUgZmlsZSByZW5lc2FzLHJ6djJtLXN5cy55YW1s
IGZvciBib3RoIHI5YTA5ZzAxMS1zeXMgYW5kIHI5YTA5ZzA1NS1zeXM/DQoNCj4gDQo+IEFueXdh
eSwgeW91IHdyb3RlIGluIGJpbmRpbmdzIGRlc2NyaXB0aW9uOiAicGVyZm9ybXMgc3lzdGVtIGNv
bnRyb2wiLCBzbyB3aGF0DQo+IGNhbiBJIHNheT8NCg0KU1lTIGZ1bmN0aW9uYWwgZGVzY3JpcHRp
b24gaXMgYXMgZm9sbG93cy4NCg0KVGhlIFNZUyBjb250cm9scyB0aGUgb3ZlcmFsbCBjb25maWd1
cmF0aW9uIG9mIHRoZSBjaGlwLCBzdWNoIGFzDQoNCuKXjyBCYW5rIGFkZHJlc3Mgc2V0dGluZ3Mg
Zm9yIERNQUMNCuKXjyBCYW5rIGFkZHJlc3Mgc2V0dGluZ3Mgb2YgdGhlIHVuaXRzIGZvciBJQ0IN
CuKXjyBFVEhFUiBBeENBQ0hFWzFdIChDIGJpdCkgY29udHJvbCBmdW5jdGlvbg0K4pePIFJBTUEg
aW5pdGlhbGl6YXRpb24gY29udHJvbA0K4pePIE1EWzc6MF0gcGluIG1vbml0b3JpbmcNCuKXjyBM
U0kgdmVyc2lvbiByZWdpc3Rlcg0K4pePIEdlbmVyYWwtcHVycG9zZSAzMi1iaXQgcmVhZGFibGUv
d3JpdGFibGUgcmVnaXN0ZXJzDQril48gT2JzZXJ2YWJpbGl0eSBjb3VudGluZyBzdG9wIGNvbnRy
b2wgZm9yIElDQg0K4pePIFdEVCBjb3VudGVyIHN0b3AgY29udHJvbA0K4pePIFJlYWRpbmcgb2Yg
dGhlIHRlbXBlcmF0dXJlIHNlbnNvciByZWZlcmVuY2UgdmFsdWUNCg0KQ2hlZXJzLA0KQmlqdQ0K
